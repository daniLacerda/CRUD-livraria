unit FrmEditora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, uDataModule, Editora.Model, uModoTela,
  FireDAC.Comp.Client;

type
  FEditora = TEditora;
  TFormCadastroEditora = class(TForm)
    pgcEditora: TPageControl;
    tbEPesquisa: TTabSheet;
    tbECadastro: TTabSheet;
    pnlEditoras: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    edtEVisualID: TEdit;
    edtEVisualUF: TEdit;
    pnlE_Operacoes: TPanel;
    btnE_Alterar: TButton;
    btnE_Incluir: TButton;
    edtEVisualNome: TEdit;
    edtEVisualCidade: TEdit;
    pnlL_Confirmar: TPanel;
    btnE_Salvar: TButton;
    btnE_Cancelar: TButton;
    Button1: TButton;
    btnEConsultar: TButton;
    edtId_Editora: TEdit;
    edtNome_Editora: TEdit;
    edtE_Cidade: TEdit;
    edtUF_Editora: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblModoLivro: TLabel;
    btnE_Anterior: TButton;
    btnE_Proximo: TButton;
    btnE_Excluir: TButton;
    dbGridEditora: TDBGrid;
    btnEVerLivros: TButton;
    dbGridELivros: TDBGrid;
    procedure dbGridEditoraCellClick(Column: TColumn);
    procedure dbGridEditoraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbGridEditoraColumnMoved(Sender: TObject;
      FromIndex, ToIndex: Integer);
    procedure btnEConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnE_AnteriorClick(Sender: TObject);
    procedure btnE_ProximoClick(Sender: TObject);
    procedure btnE_AlterarClick(Sender: TObject);
    procedure btnE_CancelarClick(Sender: TObject);
    procedure btnE_IncluirClick(Sender: TObject);
    procedure btnE_SalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnE_ExcluirClick(Sender: TObject);
    procedure btnEVerLivrosClick(Sender: TObject);
    procedure btnEVerLivrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FModo : TModo;
    FEditora : TEditora;
    FQueryL : TFDQuery;
    DataSL : TDataSource;
    procedure Consultar;
    procedure SyncView;
    procedure FeedModel;
    procedure EdtsVisuais;
    procedure QueryListaLivros;
    procedure SqlListarLivros;
  public
    { Public declarations }
  end;

var
  FormCadastroEditora: TFormCadastroEditora;

implementation

{$R *.dfm}

procedure TFormCadastroEditora.btnEConsultarClick(Sender: TObject);
begin
  pgcEditora.ActivePage := tbEPesquisa;
  DataModule1.qryEditoras.Active := Active;
  DataModule1.qryEditoras.FetchAll;
  DataModule1.qryEditoras.First;
  pnlEditoras.Visible := True;

  Consultar();


  if dbGridEditora.CanFocus then
    dbGridEditora.SetFocus;

end;

procedure TFormCadastroEditora.btnEVerLivrosClick(Sender: TObject);
begin
  SqlListarLivros();
end;

procedure TFormCadastroEditora.btnEVerLivrosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
  Self.Close;
end;

procedure TFormCadastroEditora.btnE_AlterarClick(Sender: TObject);
begin
    pgcEditora.ActivePage := tbECadastro;
    btnE_Excluir.Visible := True;

    if edtNome_Editora.CanFocus then
      edtNome_Editora.SetFocus;

    lblModoLivro.Caption := 'Modo: Alteração';
    FModo := modoAlteracao;
end;

procedure TFormCadastroEditora.btnE_AnteriorClick(Sender: TObject);
begin
  DataModule1.qryEditoras.Prior;
  Consultar();
end;

procedure TFormCadastroEditora.btnE_IncluirClick(Sender: TObject);
begin

  pgcEditora.ActivePage := tbECadastro;



  btnE_Excluir.Visible := False;
  FModo := modoInclusao;



  if edtNome_Editora.CanFocus then
    edtNome_Editora.SetFocus;


  edtId_Editora.Clear;
  edtNome_Editora.Clear;
  edtE_Cidade.Clear;
  edtUF_Editora.Clear;

end;

procedure TFormCadastroEditora.btnE_ProximoClick(Sender: TObject);
begin
  DataModule1.qryEditoras.Next;
  Consultar();
end;

procedure TFormCadastroEditora.btnE_CancelarClick(Sender: TObject);
begin
  pgcEditora.ActivePage := tbEPesquisa;
  //tbEPesquisa.TabVisible := True;
  //tbECadastro.TabVisible := False;
  Consultar();

  FModo := modoLeitura;
  lblModoLivro.Caption := 'Modo: Leitura';
end;

procedure TFormCadastroEditora.btnE_ExcluirClick(Sender: TObject);
begin
  Consultar();
  try
    FEditora.Deletar;
  except on E: Exception do
    raise Exception.Create('Erro ao Excluir o Registro.');
  end;
  pgcEditora.ActivePage := tbEPesquisa;

  DataModule1.qryEditoras.Refresh;
  ShowMessage('Registro Excluido com Sucesso');
  Consultar();

  FModo := modoLeitura;
  lblModoLivro.Caption := 'Modo: Leitura';
end;

procedure TFormCadastroEditora.btnE_SalvarClick(Sender: TObject);
begin
  if FModo = modoinclusao then
  begin
    FreeAndNil(FEditora);
    FEditora := TEditora.Create;
  end;
  FeedModel();

  try
    FEditora.Gravar;
    ShowMessage(' Registro Salvo com sucesso.');
  except on E: Exception do
    begin
      ShowMessage(E.Message);
      Exit;
    end;
  end;
  if dbGridEditora.CanFocus then
    dbGridEditora.SetFocus;

  DataModule1.qryEditoras.Refresh;
  Consultar();
  pgcEditora.ActivePage := tbEPesquisa;

  FModo := modoLeitura;
  lblModoLivro.Caption := 'Modo: Leitura';
end;

procedure TFormCadastroEditora.Consultar;
begin
    if Assigned (FEditora) then
        FreeAndNil(FEditora);
  if DataModule1.qryEditorasid_editora.AsInteger <= 0 then Exit;

  FEditora := TEditoraDAO.Carregar(DataModule1.qryEditoras.FieldByName('id_editora').AsInteger);
  SyncView();
end;

procedure TFormCadastroEditora.dbGridEditoraCellClick(Column: TColumn);
begin
  Consultar();
end;

procedure TFormCadastroEditora.dbGridEditoraColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  Consultar();
end;

procedure TFormCadastroEditora.dbGridEditoraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_down then
  begin
    if btnE_Proximo.Enabled then
      btnE_Proximo.Click;

    Abort;
  end;

  if Key = vk_up then
  begin
    if btnE_Anterior.Enabled then
      btnE_Anterior.Click;

    Abort;
  end;
end;

procedure TFormCadastroEditora.EdtsVisuais;
begin
  edtEVisualID.ReadOnly := True;
  edtEVisualNome.ReadOnly := True;
  edtEVisualCidade.ReadOnly := True;
  edtEVisualUF.ReadOnly := True;

  edtId_Editora.ReadOnly := True;
end;

procedure TFormCadastroEditora.FeedModel;
begin
  FEditora.Nome := edtNome_Editora.Text;
  FEditora.Cidade := edtE_Cidade.Text;
  FEditora.UF := edtUF_Editora.Text;
end;

procedure TFormCadastroEditora.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FQueryL);
  FreeAndNil(DataSL);
  FreeAndNil(Self.FEditora);
end;

procedure TFormCadastroEditora.FormCreate(Sender: TObject);
begin
  Self.FEditora := nil;
  QueryListaLivros();

  pgcEditora.ActivePage := tbEPesquisa;
  tbEPesquisa.TabVisible := False;
  tbECadastro.TabVisible := False;

  EdtsVisuais();
end;

procedure TFormCadastroEditora.QueryListaLivros;
begin
  FQueryL := TFDQuery.Create(Self);
  FQueryL.Connection := DataModule1.conexao;

  DataSL := TDataSource.Create(Self);
  DataSL.DataSet := FQueryL;

  dbGridELivros.DataSource := DataSL;
end;

procedure TFormCadastroEditora.SqlListarLivros;
begin
  FQueryL.SQL.Text :=
    ('SELECT * FROM livros WHERE editora_livro =' + IntToStr(FEditora.ID)  + '');
  FQueryL.Open;
end;

procedure TFormCadastroEditora.SyncView;
begin
  edtEVisualID.Text := '';
  edtEVisualNome.Text := '';
  edtEVisualCidade.Text := '';
  edtEVisualUF.Text := '';

  edtId_Editora.Text := '';
  edtNome_Editora.Text :='';
  edtE_Cidade.Text := '';
  edtUF_Editora.Text := '';

  if Assigned(Self.FEditora) then
    edtEVisualID.Text := FEditora.ID.ToString;
    edtEVisualNome.Text := FEditora.Nome;
    edtEVisualCidade.Text := FEditora.Cidade;
    edtEVisualUF.Text := FEditora.UF;

    edtId_Editora.Text := FEditora.ID.ToString;
    edtNome_Editora.Text := FEditora.Nome;
    edtE_Cidade.Text := FEditora.Cidade;
    edtUF_Editora.Text := FEditora.UF;
end;

end.
