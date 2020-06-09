unit FrmLivro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Livro.Model, uDataModule, uModoTela, Vcl.ComCtrls,
  FireDAC.Comp.Client;

type
  FLivro = TLivro;
  TFormCadastroLivro = class(TForm)
    btnConsultarLivros: TButton;
    pgcLivros: TPageControl;
    tbLPesquisa: TTabSheet;
    tbLCadastro: TTabSheet;
    pnlLivros: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtLVisualID: TEdit;
    edtLVisualAutor: TEdit;
    dbGridLivros: TDBGrid;
    edtLVisualNome: TEdit;
    edtLVisualAno: TEdit;
    edtLVisualEditora: TEdit;
    pnlL_Confirmar: TPanel;
    btnL_Salvar: TButton;
    btnL_Cancelar: TButton;
    edtId_Livro: TEdit;
    edtNome_Livro: TEdit;
    edtL_AnoLivro: TEdit;
    edtAutor_Livro: TEdit;
    edtL_EditoraLivro: TEdit;
    lblModoLivro: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    btnListaAutores: TButton;
    btnListaEditoras: TButton;
    pnlAConsulta: TPanel;
    dbGridALista: TDBGrid;
    btnL_Excluir: TButton;
    pnlL_Operacoes: TPanel;
    btnL_Incluir: TButton;
    btnL_Alterar: TButton;
    btnL_Anterior: TButton;
    btnL_Proximo: TButton;

    procedure dbGridLivrosCellClick(Column: TColumn);
    procedure dbGridLivrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbGridLivrosColumnMoved(Sender: TObject;
      FromIndex, ToIndex: Integer);
    procedure btnL_AlterarClick(Sender: TObject);
    procedure btnL_IncluirClick(Sender: TObject);
    procedure btnL_ExcluirClick(Sender: TObject);
    procedure btnL_AnteriorClick(Sender: TObject);
    procedure btnL_ProximoClick(Sender: TObject);
    procedure btnL_CancelarClick(Sender: TObject);
    procedure btnL_SalvarClick(Sender: TObject);
    procedure btnConsultarLivrosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnListaAutoresClick(Sender: TObject);
    procedure btnListaEditorasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnListaAutoresKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FModo : TModo;
    FLivro : TLivro;
    FqryConsultaA : TFDQuery;
    FqryConsultaE : TFDQuery;
    FDataSA : TDataSource;
    FDataSE : TDataSource;
    procedure Consultar_Livro;
    procedure SyncView_Livro;
    procedure FeedModel_Livro;
    procedure AfterScrollDS(ADataSet: TDataSet);
    procedure EdtsVisuais;
    procedure GridConsultaAutores;
    procedure GridConsultaEditoras;
    procedure SqlListarAutores;
    procedure SqlListarEditoras;
  public

    { Public declarations }
  end;

var
  FormCadastroLivro: TFormCadastroLivro;

implementation

{$R *.dfm}

{ TCadastrarLivros }

procedure TFormCadastroLivro.AfterScrollDS(ADataSet: TDataSet);
begin
  SyncView_Livro();
  Consultar_Livro();
end;

procedure TFormCadastroLivro.btnConsultarLivrosClick(Sender: TObject);
begin
  DataModule1.qryLivros.Active := Active;

  pgcLivros.ActivePage := tbLPesquisa;

  DataModule1.qryLivros.FetchAll;
  DataModule1.qryLivros.First;
  Consultar_Livro();

  if dbGridLivros.CanFocus then
    dbGridLivros.SetFocus;
end;

procedure TFormCadastroLivro.btnListaAutoresClick(Sender: TObject);
begin
  SqlListarAutores();
end;

procedure TFormCadastroLivro.btnListaAutoresKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then 
  Self.Close;
end;

procedure TFormCadastroLivro.btnListaEditorasClick(Sender: TObject);
begin

  SqlListarEditoras();
end;

procedure TFormCadastroLivro.btnL_AlterarClick(Sender: TObject);
begin
  pgcLivros.ActivePage := tbLCadastro;
  
  btnL_Excluir.Visible := True;

  btnListaAutores.Visible := False;
  btnListaEditoras.Visible:= False;
  if edtNome_Livro.CanFocus then
    edtNome_Livro.SetFocus;

  lblModoLivro.Caption := 'Modo: Alteração';
  FModo := modoAlteracao;
end;

procedure TFormCadastroLivro.btnL_AnteriorClick(Sender: TObject);
begin
  DataModule1.qryLivros.Prior;
  Consultar_Livro;
end;

procedure TFormCadastroLivro.btnL_CancelarClick(Sender: TObject);
begin
  pgcLivros.ActivePage := tbLPesquisa;

  dbGridALista.Visible := False;

  FModo := modoLeitura;
  lblModoLivro.Caption := 'Modo: Leitura';
end;

procedure TFormCadastroLivro.btnL_ExcluirClick(Sender: TObject);
begin
  Consultar_Livro;
  try
    FLivro.Deletar;

  except on E: Exception do
    raise Exception.Create('Erro ao Excluir o Registro.' + E.Message);
  end;
  pgcLivros.ActivePage := tbLPesquisa;

  ShowMessage('Registro Excluido com Sucesso');
  DataModule1.qryLivros.Refresh;
  Consultar_Livro();

  FModo := modoLeitura;
  lblModoLivro.Caption := 'Modo: Leitura';
end;

procedure TFormCadastroLivro.btnL_IncluirClick(Sender: TObject);
begin
  pgcLivros.ActivePage := tbLCadastro;

  btnL_Excluir.Visible := False;

  btnListaAutores.Visible := True;
  btnListaEditoras.Visible:= True;
  

  lblModoLivro.Caption := 'Modo: Inclusão';
  FModo := modoInclusao;
  edtNome_Livro.Clear;
  edtL_AnoLivro.Clear;
  edtAutor_Livro.Clear;
  edtL_EditoraLivro.Clear;
  edtNome_Livro.SetFocus;
end;

procedure TFormCadastroLivro.btnL_ProximoClick(Sender: TObject);
begin
  DataModule1.qryLivros.Next;
  Consultar_Livro;
end;

procedure TFormCadastroLivro.btnL_SalvarClick(Sender: TObject);
begin
  if FModo = modoinclusao then
  begin
    FreeAndNil(FLivro);
    FLivro := TLivro.Create;
  end;
  FeedModel_Livro;

  try
    FLivro.Gravar;
    ShowMessage('Registro Salvo com Sucesso.');
  except on E: Exception do
    begin
      ShowMessage(E.Message);
      Exit;
    end;
  end;
  if dbGridLivros.CanFocus then
    dbGridLivros.SetFocus;

  pgcLivros.ActivePage := tbLPesquisa;
  DataModule1.qryLivros.Refresh;
  Consultar_Livro;


  FModo := modoLeitura;
  lblModoLivro.Caption := 'Modo: Leitura';
end;

procedure TFormCadastroLivro.Consultar_Livro;
begin
  if Assigned (FLivro) then
    FreeAndNil(FLivro);
  if DataModule1.qryLivrosid_livro.AsInteger > 0 then
    begin
      FLivro := TLivroDAO.Carregar(DataModule1.qryLivros.FieldByName('id_livro').AsInteger);
      SyncView_Livro;
    end
end;

procedure TFormCadastroLivro.dbGridLivrosCellClick(Column: TColumn);
begin
  Consultar_Livro();
end;

procedure TFormCadastroLivro.dbGridLivrosColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  Consultar_Livro();
end;

procedure TFormCadastroLivro.dbGridLivrosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_down then
  begin
    if btnL_Proximo.Enabled then
      btnL_Proximo.Click;

    Abort;
  end;

  if Key = vk_up then
  begin
    if btnL_Anterior.Enabled then
      btnL_Anterior.Click;

    Abort;
  end;
end;

procedure TFormCadastroLivro.EdtsVisuais;
begin
  edtLVisualID.ReadOnly := True;
  edtLVisualAutor.ReadOnly := True;
  edtLVisualNome.ReadOnly := True;
  edtLVisualAno.ReadOnly := True;
  edtLVisualEditora.ReadOnly := True;

  edtId_Livro.ReadOnly := True;
end;

procedure TFormCadastroLivro.FeedModel_Livro;
begin
  FLivro.Nome := edtNome_Livro.Text;
  FLivro.AnoLivro := edtL_AnoLivro.Text;
  FLivro.AutorLivro := edtAutor_Livro.Text;
  FLivro.EditoraLivro := edtL_EditoraLivro.Text;
end;

procedure TFormCadastroLivro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FqryConsultaA);
  FreeAndNil(FqryConsultaE);
  FreeAndNil(FDataSA);
  FreeAndNil(FDataSE);
  FreeAndNil(Self.FLivro);
end;

procedure TFormCadastroLivro.FormCreate(Sender: TObject);
begin
  Self.FLivro := Nil;
  GridConsultaAutores();
  GridConsultaEditoras();
  tbLPesquisa.TabVisible := False;
  tbLCadastro.TabVisible := False;
  EdtsVisuais();
end;

procedure TFormCadastroLivro.SqlListarAutores;
begin
  FqryConsultaA.SQL.Text := 'SELECT id_autor, nome_autor FROM autores';
  FqryConsultaA.Open;
  dbGridALista.DataSource := FDataSA;
  dbGridALista.Visible := True;
end;

procedure TFormCadastroLivro.SqlListarEditoras;
begin
  FqryConsultaE.SQL.Text := 'SELECT id_editora, nome_editora FROM editoras';
  FqryConsultaE.Open;
  dbGridALista.DataSource := FDataSE;
  dbGridALista.Visible := True;
end;

procedure TFormCadastroLivro.GridConsultaAutores;
begin
  FqryConsultaA := TFDQuery.Create(Self);
  FqryConsultaA.Connection := DataModule1.conexao;

  FDataSA := TDataSource.Create(Self);
  FDataSA.DataSet := FqryConsultaA;
  //dbGridALista := FDataSA;
end;

procedure TFormCadastroLivro.GridConsultaEditoras;
begin
  FqryConsultaE := TFDQuery.Create(Self);
  FqryConsultaE.Connection := DataModule1.conexao;

  FDataSE := TDataSource.Create(Self);
  FDataSE.DataSet := FqryConsultaE;
  //dbgridALista := FDataSE;
end;

procedure TFormCadastroLivro.SyncView_Livro;
begin
  edtLVisualID.Text := '';
  edtLVisualNome.Text := '';
  edtLVisualAno.Text := '';
  edtLVisualAutor.Text := '';
  edtLVisualEditora.Text := '';

  edtId_Livro.Text := '';
  edtNome_Livro.Text := '';
  edtAutor_Livro.Text := '';
  edtL_AnoLivro.Text := '';
  edtL_EditoraLivro.Text := '';
  if Assigned(Self.FLivro) then
    begin
      edtLVisualID.Text := FLivro.ID.ToString;
      edtLVisualNome.Text := FLivro.Nome;
      edtLVisualAno.Text := FLivro.AnoLivro;
      edtLVisualAutor.Text := FLivro.AutorLivro;
      edtLVisualEditora.Text := FLivro.EditoraLivro;

      edtId_Livro.Text := FLivro.ID.ToString;
      edtNome_Livro.Text := FLivro.Nome;
      edtL_AnoLivro.Text := FLivro.AnoLivro;
      edtAutor_Livro.Text := FLivro.AutorLivro;
      edtL_EditoraLivro.Text := FLivro.EditoraLivro;
    end;
end;

end.
