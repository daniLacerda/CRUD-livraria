unit Editora.Model;

interface

uses
  sysutils, strutils;

type
  TEditora = class
  strict private
    FNome: String;
    FCidade: String;
    FUF: String;
    procedure SetNome (const Value: String);
    procedure SetCidade(Const Value: String);
    procedure SetUF (const Value: String);
  private
    FID : Integer;

  public
    property ID: Integer read FID;
    property Nome: String read FNome write SetNome;
    property Cidade: String read FCidade write SetCidade;
    property UF: String read FUF write SetUF;

    procedure Gravar;
    procedure Deletar;
end;

  TEditoraDAO = class
    private
      class function getSqlForRecord(AID : Integer) : String;
      class procedure Salvar(AEditora : TEditora);
      class procedure Excluir(AID : Integer);
    public
      class function Carregar(AID : Integer):TEditora;
  end;

implementation
uses
Firedac.comp.client, uDataModule;


{ TEditora }

procedure TEditora.Deletar;
begin
  TEditoraDAO.Excluir(Self.ID);
end;

procedure TEditora.Gravar;
begin
  TEditoraDAO.Salvar(Self);
end;

procedure TEditora.SetCidade(const Value: String);
begin
  if Value.IsEmpty then
    raise Exception.Create('O campo Cidade não foi preenchido!');
  if Value.Length > 40 then
    raise Exception.Create('A cidade não deve conter mais de 40 dígitos.');
  Self.FCidade := leftStr(Value, 40);
end;

procedure TEditora.SetNome(const Value: String);
begin
  if Value.IsEmpty then
    raise Exception.Create('O Nome da Editora não foi preenchido');
  if Value.Length >= 20 then
    raise Exception.Create('O nome da Editora não deve conter mais de 20 dígitos');
  Self.FNome := LeftStr(Value, 20);
end;

procedure TEditora.SetUF(const Value: String);
begin
  if Value.IsEmpty then
    raise Exception.Create('O UF não foi preenchido!');
  if Value.Length > 2 then
    raise Exception.Create('O UF não deve conter mais de 2 dígitos!');
  Self.FUF := leftStr(Value, 2);
end;

{ TEditoraDAO }

class function TEditoraDAO.Carregar(AID: Integer): TEditora;
var
  _qry : TFDQuery;
begin
  Result := nil;
  try
    _qry := TFDQuery.Create(nil);
    _qry.Connection := DataModule1.conexao;
    _qry.SQL.Text := getSqlForRecord(AID);
    try
      _qry.Open;
    except on E: Exception do
      raise Exception.Create('[TEditoraDAO]' +AID.ToString +' não encontrado na tabela de editoras. ');
    end;
    Result := TEditora.Create;

    Result.FID := _qry.FieldByName('id_editora').AsInteger;
    Result.Nome := _qry.FieldByName('nome_editora').AsString;
    Result.Cidade :=_qry.FieldByName('cidade_editora').AsString;
    Result.UF := _qry.FieldByName('estado_editora').AsString;
  finally
    FreeAndNil(_qry);
  end;

end;

class procedure TEditoraDAO.Excluir(AID : Integer);
begin
  if (DataModule1.conexao.ExecSQL(
  'DELETE FROM '+
    'editoras '+
  'WHERE '+
    'id_editora = ' + AID.ToString ) =0) then
    raise Exception.Create('[TEditoraDAO] Falha ao Excluir Registro' + AID.ToString);
end;

class function TEditoraDAO.getSqlForRecord(AID: Integer): String;
begin
  Result :=
    'SELECT * FROM ' +
      'editoras ' +
    'WHERE ' +
      'id_editora = ' + AID.ToString;
end;

class procedure TEditoraDAO.Salvar(AEditora: TEditora);
var
_qryEditora : TFDQuery;
begin
  _qryEditora := TFDQuery.Create(nil);
  _qryEditora.Connection := DataModule1.conexao;
  _qryEditora.SQL.Text := getSqlForRecord(AEditora.ID);
  try
    try
      _qryEditora.Open;
    except on E: Exception do
      raise Exception.Create('[TEditoraDAO] Erro ao Consultar Dados' + E.Message);
    end;
    _qryEditora.FieldByName('id_editora').Required := False;

    if _qryEditora.IsEmpty then
      _qryEditora.Append
    else
      _qryEditora.Edit;

    _qryEditora.FieldByName('nome_editora').Value := AEditora.Nome;
    _qryEditora.FieldByName('cidade_editora').Value := AEditora.Cidade;
    _qryEditora.FieldByName('estado_editora').Value := AEditora.UF;
    try
      _qryEditora.Post;
    except on E: Exception do
      raise Exception.Create('[TEditoraDAO] Erro ao  SALVAR os valores.' + E.Message)
    end;

  finally
   FreeAndNil(_qryEditora);
  end;


end;

end.
