unit Autor.Model;

interface

uses
  SysUtils;

type
  TAutor = class
  Strict Private
    FNome: String;
    procedure SetNome(const Value: String);

  private
    FID: Integer;
    FHora: TTime;
    FData: TDate;

  public
    property ID: Integer read FID;
    property Nome: String read FNome write SetNome;
    property Hora: TTime read FHora;
    property Data: TDate read FData;
    procedure Gravar;
    procedure Deletar;
  end;
  TAutorDAO = class
    private
      class function getSqlForRecord(AID : Integer) : String;
      class procedure Salvar(AAutor : TAutor);
      class procedure Excluir(AID : Integer);
    public
      class function Carregar(AID: Integer): TAutor;
  end;


implementation
uses
Firedac.comp.client,StrUtils, uDataModule;

{ TAutor }

procedure TAutor.Deletar;
begin
  TAutorDAO.Excluir(Self.ID);
  Self.FID :=0;
end;

procedure TAutor.Gravar;
begin
  TAutorDAO.Salvar(Self);
end;

procedure TAutor.SetNome(const Value: String);
begin
  if Value = EmptyStr then
    raise Exception.Create('O Nome do Autor não foi Preenchido!');
  if Value.Length > 50 then
    raise Exception.Create('O Nome do Autor não pode conter mais de 50 dígitos!');
  Self.FNome := LeftStr(Value, 50)
end;

{ TAutorDAO }

class function TAutorDAO.Carregar(AID: Integer): TAutor;
var
  _qry : TFDQuery;
begin
  Result := nil;
  _qry := TFDQuery.Create(nil);
  try
    _qry.Connection := DataModule1.conexao;
    _qry.SQL.Text := getSqlForRecord(AID);
    try
      _qry.Open;
    except
      on E: Exception do
      raise Exception.Create('[TDAutorDao] Falha ao abrir a consulta de Autores.'
      + E.Message);
    end;
    if _qry.IsEmpty then
    begin
      raise Exception.Create('[TDAutorDao] ' + AID.ToString+' Não foi encontrado na tabela de autores.');
    end;
    Result:= TAutor.Create;

    Result.FID := _qry.FieldByName('id_autor').AsInteger;
    Result.Nome := _qry.FieldByName('nome_autor').AsString;
    Result.FHora := _qry.FieldByName('hora_log').AsDateTime;
    Result.FData := _qry.FieldByName('data_log').AsDateTime;
  finally
    FreeAndNil(_qry);
  end;
end;

class procedure TAutorDAO.Excluir(AID: Integer);
begin
  if (DataModule1.conexao.ExecSQL(
    'DELETE FROM '+
      'autores '+
    ' WHERE '+
      'id_autor =' + AID.ToString
    )=0) then
      raise Exception.Create('[TAutorDAO] Falha ao excluir registro '+AID.ToString);
end;

class function TAutorDAO.getSqlForRecord(AID: Integer): String;
begin
  result :=
  'SELECT * FROM '+
    'autores'+
  ' WHERE '+
    'id_autor = ' + AID.ToString;
end;

class procedure TAutorDAO.Salvar(AAutor: TAutor);
var
  _qryAutores : TFDQuery;
begin
  _qryAutores := TFDQuery.Create(nil);
  _qryAutores.Connection := DataModule1.conexao;
  _qryAutores.SQL.Text := getSqlForRecord(AAutor.ID);
  try
    try
      _qryAutores.Open;
    except
      on E: Exception do
        raise Exception.Create('[TAutorDAO] Erro ao consultar os Registros.' + E.Message);
    end;
    //_qryAutores.FieldByName('id_autor').Required := False;

    if _qryAutores.IsEmpty then
      _qryAutores.Append
    else
      _qryAutores.Edit;
      _qryAutores.FieldByName('id_autor').Required := False;

    //_qryAutores.FieldByName('id_autor').Value := AAutor.ID;
    _qryAutores.FieldByName('nome_autor').Value := AAutor.Nome;
    _qryAutores.FieldByName('hora_log').Value := Time();
    _qryAutores.FieldByName('data_log').Value := Date();

    try
      _qryAutores.Post;
    except
      on E: Exception do
        raise Exception.Create('[TAutorDAO] Erro ao SALVAR os registros.' + E.Message);
    end;
  finally
    FreeAndNil(_qryAutores);
  end;
end;

end.

