unit Livro.Model;

interface

uses
  SysUtils;

type
  TLivro = class
  strict private
    FNome : String;
    FAutorLivro: String;
    FAnoLivro: String;
    FEditoraLivro: String;
    procedure SetNome(const Value: String);
    procedure SetAutorLivro(const Value: String);
    procedure SetAnoLivro(const Value: String);
    procedure SetEditoraLivro(const Value: String);

  private
    FID: Integer;

  public
    property ID: Integer read FID;
    property Nome: String read FNome write SetNome;
    property AutorLivro: String read FAutorLivro write SetAutorLivro;
    property AnoLivro: String read FAnoLivro write SetAnoLivro;
    property EditoraLivro: String read FEditoraLivro write SetEditoraLivro;

    procedure Gravar;
    Procedure Deletar;
  end;

  TLivroDAO = class
  private
    class function getSqlForRecord(AID : Integer):String;
    class procedure Salvar(ALivro : TLivro);
    class procedure Excluir(AID : Integer);
  public
    class function Carregar(AID: Integer):TLivro;
  end;


implementation
uses
Firedac.comp.client, StrUtils, uDataModule;

{ TLivro }

procedure TLivro.Deletar;
begin
  TLivroDAO.Excluir(Self.ID);
  Self.FID := 0;
end;

procedure TLivro.Gravar;
begin
  TLivroDAO.Salvar(Self);
end;

procedure TLivro.SetAnoLivro(const Value: String);
begin
  if Value = EmptyStr then
    raise Exception.Create('O Ano de publicação não foi Preenchido!' );
  if Value.Length > 4 then
    raise Exception.Create('O Ano não pode conter mais de 4 dígitos!');
  Self.FAnoLivro := LeftStr(Value, 4);
end;

procedure TLivro.SetAutorLivro(const Value: String);
begin
  if Value = EmptyStr then
    raise Exception.Create('O ID do Autor não foi Preenchido!');
  if Value.Length > 5 then
    raise Exception.Create('O Autor não pode conter mais de 5 dígitos.!');
  Self.FAutorLivro := LeftStr(Value, 5);
end;

procedure TLivro.SetEditoraLivro(const Value: String);
begin
  if Value = EmptyStr then
    raise Exception.Create('O ID da Editora não foi Preenchido!');
  if Value.Length > 5 then
    raise Exception.Create('O ID da editora não pode conter mais que 5 dígitos.');
  Self.FEditoraLivro := LeftStr(Value, 5);
end;

procedure TLivro.SetNome(const Value: String);
begin
  if Value = EmptyStr then
    raise Exception.Create('O Nome do Livro não foi preenchido!');
  if Value.Length > 50 then
    raise Exception.Create('O Nome do Livro não pode conter mais que 50 dígitos.');
  Self.FNome := LeftStr(Value, 50);
end;

{ TLivroDAO }

class function TLivroDAO.Carregar(AID: Integer): TLivro;
var
  _qry : TFDQuery;
begin
  Result := nil;
  try
    _qry := TFDQuery.Create(nil);
    _qry.Connection := DataModule1.conexao;
    _qry.SQL.Text :=getSqlForRecord(AID);
    try
      _qry.Open;
    except
      on E: Exception do
      raise Exception.Create('[TLivroDAO] ' +AID.ToString+ 'não encontrado na tabela de livros' + E.Message);
    end;
    Result := TLivro.Create;

    Result.FID := _qry.FieldByName('id_livro').AsInteger;
    Result.Nome := _qry.FieldByName('nome_livro').AsString;
    Result.AnoLivro :=_qry.FieldByName('ano_livro').AsString;
    Result.AutorLivro := _qry.FieldByName('autor_livro').AsString;
    Result.EditoraLivro := _qry.FieldByName('editora_livro').AsString;
  finally
    FreeAndNil(_qry);
  end;

end;

class procedure TLivroDAO.Excluir(AID: Integer);
begin
  if (DataModule1.conexao.ExecSQL(
  'DELETE FROM '+
    'livros '+
  'WHERE '+
    'id_livro = ' + AID.ToString)=0) then
    raise Exception.Create('[TLivroDAO] Falha ao excluir regristro ' +AID.ToString);
end;

class function TLivroDAO.getSqlForRecord(AID: Integer): String;
begin
  Result :=
    'SELECT * FROM '+
      'livros ' +
    'WHERE '+
      'id_livro = ' + AID.ToString;
end;

class procedure TLivroDAO.Salvar(ALivro: TLivro);
var
  _qryLivros : TFDQuery;
begin
  _qryLivros := TFDQuery.Create(nil);
  _qryLivros.Connection := DataModule1.conexao;
  _qryLivros.SQL.Text := getSqlForRecord(ALivro.ID);
  try
      try
        _qryLivros.Open;
      except
        on E: Exception do
          raise Exception.Create('[TLivroDAO] Erro ao consultar dados.'+ E.Message);
      end;
      _qryLivros.FieldByName('id_livro').Required := False;

      if _qryLivros.IsEmpty then
        _qryLivros.Append
      else
        _qryLivros.Edit;

    _qryLivros.FieldByName('nome_livro').Value := ALivro.Nome;
    _qryLivros.FieldByName('ano_livro').Value := ALivro.AnoLivro;
    _qryLivros.FieldByName('autor_livro').Value := ALivro.AutorLivro ;
    _qryLivros.FieldByName('editora_livro').Value := ALivro.EditoraLivro;

    try
      _qryLivros.Post;
    except
      on E: Exception do
        raise Exception.Create('[TLivroDAO] Erro ao SALVAR os valores.' + E.Message);
    end;
  finally
    FreeAndNil(_qryLivros);
  end;

end;

end.

