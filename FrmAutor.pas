  unit FrmAutor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Phys.Intf, FireDAC.Phys,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Param, FireDAC.Phys.MySQLDef,
  uDataModule,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Phys.MySQL, FireDAC.Stan.Intf,
  FireDAC.Comp.UI, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys.MSAccDef,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSAcc, Autor.Model, Livro.Model, FrmLivro, uModoTela,
  Vcl.ComCtrls;

type

  TDataModule = class(TDataModule1);

    TPanelComReferencia = class(Tpanel)
    FLivro: TLivro;
    EdtNome : TEdit;
    BtnC : TButton;
    BtnS : TButton;

  end;

  TFormCadastroAutor = class(TForm)
    btnAbrirConsulta: TButton;
    lblModoAutor: TLabel;
    pgcPrincipal: TPageControl;
    tbPesquisa: TTabSheet;
    pnlAutores: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    pnlA_Operacoes: TPanel;
    btnA_Alterar: TButton;
    btnA_Incluir: TButton;
    edtAVisualID: TEdit;
    edtAVisualNome: TEdit;
    btnVerLivros: TButton;
    dbGridAutores: TDBGrid;
    edtAVisualHora: TEdit;
    edtAVisualData: TEdit;
    btnA_Proximo: TButton;
    btnA_Anterior: TButton;
    tbCadastro: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    edtId_Autores: TEdit;
    edtNome_Autores: TEdit;
    edtA_Data: TEdit;
    edtA_Hora: TEdit;
    pnlA_Confirmar: TPanel;
    btnA_Cancelar: TButton;
    btnA_Salvar: TButton;
    btnA_Excluir: TButton;
    ScrollBoxA: TScrollBox;
    pnlABox: TPanel;
    Label9: TLabel;
    btnABox_Excluir: TButton;
    btnABox_Cancelar: TButton;
    btnABox_Salvar: TButton;
    edtABox_nomeLivro: TEdit;
    edtABox_IDLivro: TEdit;

    procedure btnAbrirConsultaClick(Sender: TObject);
    procedure btnA_ProximoClick(Sender: TObject);
    procedure btnA_AnteriorClick(Sender: TObject);
    procedure btnA_AlterarClick(Sender: TObject);
    procedure btnA_IncluirClick(Sender: TObject);
    procedure btnA_ExcluirClick(Sender: TObject);
    procedure btnA_SalvarClick(Sender: TObject);
    procedure btnA_CancelarClick(Sender: TObject);
    procedure btnVerLivrosClick(Sender: TObject);
    procedure btnL_AnteriorClick(Sender: TObject);
    procedure btnL_ProximoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbGridAutoresCellClick(Column: TColumn);
    procedure dbGridAutoresColumnMoved(Sender: TObject;
      FromIndex, ToIndex: Integer);
    procedure dbGridAutoresKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAVisualNomeChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtAVisualIDKeyPress(Sender: TObject; var Key: Char);
    procedure edtAVisualNomeKeyPress(Sender: TObject; var Key: Char);
    procedure edtAVisualHoraKeyPress(Sender: TObject; var Key: Char);
    procedure edtAVisualDataKeyPress(Sender: TObject; var Key: Char);
    procedure edtId_AutoresKeyPress(Sender: TObject; var Key: Char);
    procedure edtNome_AutoresKeyPress(Sender: TObject; var Key: Char);
    procedure edtA_HoraKeyPress(Sender: TObject; var Key: Char);
    procedure edtA_DataKeyPress(Sender: TObject; var Key: Char);
    procedure dbGridAutoresKeyPress(Sender: TObject; var Key: Char);
  private
    FAutor: TAutor;
    FModo: TModo;
    FLivro: TLivro;
    FQueryL : TFDQuery;
    DataSL : TDataSource;
    arrPnlABox : array of TPanelComReferencia;
    procedure Consultar_Autor;
    procedure Consultar_Livro;
    procedure ConexaoBD;
    procedure AfterScrollDS(ADataSet: TDataSet);
    procedure SyncView;
    procedure FeedModel;
    procedure EdtsVisuaisA;
    procedure QueryListaLivros;
    procedure SqlListarLivros;
    procedure LimparScrollBox(AScrollBox : TScrollBox);
    procedure MeuClickExcluir(Sender : TObject);
    procedure MeuClickSalvar(Sender : TObject);
    procedure MeuClickCancelar(Sender : TObject);
    procedure OnChangeDoEdit(Sender : TObject);

    { Private declarations }
  public
  _NLivro : String;
    { Public declarations }
  end;


var
  FormCadastroAutor: TFormCadastroAutor;

implementation

{$R *.dfm}

procedure TFormCadastroAutor.ConexaoBD;
begin
  if DataModule1.conexao.Connected = False then
  begin
    DataModule1.conexao.Connected := True;
    //ShowMessage('Banco de Dados Conectado.');
  end
  else
  begin
    DataModule1.conexao.Connected := False;
    //ShowMessage('Banco de Dados Desconectado.');
  end;
end;

procedure TFormCadastroAutor.btnL_AnteriorClick(Sender: TObject);
begin
  DataModule1.qryLivros.Prior;
end;

procedure TFormCadastroAutor.btnA_AlterarClick(Sender: TObject);
begin

  pgcPrincipal.ActivePage := tbCadastro;

    if edtNome_Autores.CanFocus then
      edtNome_Autores.SetFocus;

    lblModoAutor.Caption := 'Modo: Alteração';
    FModo := modoAlteracao;

end;

procedure TFormCadastroAutor.btnA_AnteriorClick(Sender: TObject);
begin
  DataModule1.qryAutores.Prior;
  Consultar_Autor;
end;

procedure TFormCadastroAutor.btnA_CancelarClick(Sender: TObject);
begin
  pgcPrincipal.ActivePage := tbPesquisa;

  Consultar_Autor;

  FModo := modoLeitura;
  lblModoAutor.Caption := 'Modo: Leitura';
end;

procedure TFormCadastroAutor.btnA_ExcluirClick(Sender: TObject);
begin
  Consultar_Autor;
  try
    FAutor.Deletar;
  except on E: Exception do
    raise Exception.Create('Erro ao excluir registro..' + E.Message);
  end;
  pgcPrincipal.ActivePage := tbPesquisa;

  DataModule1.qryAutores.Refresh;
  ShowMessage('Registro excluido com sucesso.') ;
  Consultar_Autor();

  FModo := modoLeitura;
  lblModoAutor.Caption := 'Modo: Leitura';
end;

procedure TFormCadastroAutor.btnA_IncluirClick(Sender: TObject);
begin
    pgcPrincipal.ActivePage := tbCadastro;

    edtA_Hora.Clear;
    edtA_Data.Clear;
    btnA_Excluir.Visible := False;
    edtId_Autores.Clear;
    edtNome_Autores.Clear;
    if edtNome_Autores.CanFocus then
      edtNome_Autores.SetFocus;

    FModo := modoInclusao;
    lblModoAutor.Caption := 'Modo: Inclusão';

end;

procedure TFormCadastroAutor.btnA_ProximoClick(Sender: TObject);
begin
  DataModule1.qryAutores.Next;
  Consultar_Autor;
end;

procedure TFormCadastroAutor.btnA_SalvarClick(Sender: TObject);
begin
  if FModo = modoInclusao then
  begin
    FreeAndNil(FAutor);
    FAutor := TAutor.Create;
  end;
  FeedModel();

  try
    FAutor.Gravar;
    ShowMessage('Registro Salvo com Sucesso.');
  except on E: Exception do
    begin
      ShowMessage(E.Message);
      Exit;
    end
  end;
  if dbGridAutores.CanFocus then
    dbGridAutores.SetFocus;

  DataModule1.qryAutores.Refresh;
  Consultar_Autor;
  pgcPrincipal.ActivePage := tbPesquisa;

  FModo := modoLeitura;
  lblModoAutor.Caption := 'Modo: Leitura';

end;

procedure TFormCadastroAutor.btnL_ProximoClick(Sender: TObject);
begin
  DataModule1.qryLivros.Next;
end;

procedure TFormCadastroAutor.dbGridAutoresCellClick(Column: TColumn);
begin
  Consultar_Autor();
end;

procedure TFormCadastroAutor.dbGridAutoresColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
  Consultar_Autor();
end;

procedure TFormCadastroAutor.dbGridAutoresKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_down then
  begin
    if btnA_Proximo.Enabled then
      btnA_Proximo.Click;

    Abort;
  end;

  if Key = vk_up then
  begin
    if btnA_Anterior.Enabled then
      btnA_Anterior.Click;

    Abort;
  end;
end;

procedure TFormCadastroAutor.dbGridAutoresKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #27 then
  begin
    key := #0;
    Self.Close;
  end;
end;

procedure TFormCadastroAutor.edtAVisualDataKeyPress(Sender: TObject; var Key: Char);
begin
If key = #27 then
  begin
    key := #0;
    Self.Close;
  end;
end;

procedure TFormCadastroAutor.edtAVisualHoraKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #27 then
  begin
    key := #0;
    Self.Close;
  end;
end;

procedure TFormCadastroAutor.edtAVisualIDKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #27 then
  begin
    key := #0;
    Self.Close;
  end;
end;

procedure TFormCadastroAutor.edtAVisualNomeChange(Sender: TObject);
begin
  //SyncView();
end;

procedure TFormCadastroAutor.edtAVisualNomeKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #27 then
  begin
    key := #0;
    Self.Close;
  end;
end;

procedure TFormCadastroAutor.edtA_DataKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #27 then
  begin
    key := #0;
    Self.Close;
  end;
end;

procedure TFormCadastroAutor.edtA_HoraKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #27 then
  begin
    key := #0;
    Self.Close;
  end;
end;

procedure TFormCadastroAutor.edtId_AutoresKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #27 then
  begin
    key := #0;
    Self.Close;
  end;
end;

procedure TFormCadastroAutor.edtNome_AutoresKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key = #27 then
  begin
    key := #0;
    Self.Close;
  end;
end;

procedure TFormCadastroAutor.EdtsVisuaisA;
begin
  edtAVisualID.ReadOnly := True;
  edtAVisualNome.ReadOnly := True;
  edtAVisualHora.ReadOnly := True;
  edtAVisualData.ReadOnly := True;

  edtId_Autores.ReadOnly := True;
  edtA_Data.ReadOnly := True;
  edtA_Hora.ReadOnly := True;
end;

procedure TFormCadastroAutor.FeedModel;
begin
  FAutor.Nome := edtNome_Autores.Text;
end;

procedure TFormCadastroAutor.FormClose(Sender: TObject; var Action: TCloseAction);
begin


  FreeAndNil(DataSL);
  FreeAndNil(Self.FAutor);
  FreeAndNil(Self.FLivro);
end;

procedure TFormCadastroAutor.FormCreate(Sender: TObject);
begin
   Self.FLivro := Nil;

  if FQueryL = nil then
    QueryListaLivros;
  pnlABox.Free;

  QueryListaLivros();

  tbPesquisa.TabVisible := False;
  tbCadastro.TabVisible := False;
  EdtsVisuaisA();
end;

procedure TFormCadastroAutor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
  Self.Close;
end;

procedure TFormCadastroAutor.LimparScrollBox(AScrollBox: TScrollBox);
var
I : Integer;
begin
  for I := AScrollBox.ControlCount -1 downto 0 do
  begin
    AScrollBox.Controls[DataModule1.qryLivros.RecNo].Free;
  end;

end;

procedure TFormCadastroAutor.MeuClickCancelar(Sender: TObject);
begin
  arrPnlABox[TButton(Sender).Tag].EdtNome.Text := arrPnlABox[DataModule1.qryLivros.RecNo].FLivro.Nome;
  arrPnlABox[TButton(Sender).Tag].BtnC.Enabled := False;
  arrPnlABox[TButton(Sender).Tag].BtnS.Enabled := False;
end;

procedure TFormCadastroAutor.MeuClickExcluir(Sender: TObject);
begin
  arrPnlABox[TButton(Sender).Tag].FLivro.Deletar;
  arrPnlABox[TButton(Sender).Tag].Free;
  arrPnlABox[TButton(Sender).Tag] := nil;
end;

procedure TFormCadastroAutor.MeuClickSalvar(Sender: TObject);
begin
  arrPnlABox[TButton(Sender).Tag].FLivro.Nome := arrPnlABox[TButton(Sender).Tag].EdtNome.Text;
  arrPnlABox[TButton(Sender).Tag].FLivro.Gravar;
  DataModule1.qryLivros.Refresh;
  arrPnlABox[TButton(Sender).Tag].BtnC.Enabled := False;
  arrPnlABox[TButton(Sender).Tag].BtnS.Enabled := False;
end;

procedure TFormCadastroAutor.OnChangeDoEdit(Sender : TObject);
begin
  arrPnlABox[TButton(Sender).Tag].BtnC.Enabled := True;
  arrPnlABox[TButton(Sender).Tag].BtnS.Enabled := True;
end;

procedure TFormCadastroAutor.QueryListaLivros;
begin
  FQueryL := TFDQuery.Create(Self);
  FQueryL.Connection := DataModule1.conexao;

  DataSL := TDataSource.Create(Self);
  DataSL.DataSet := FQueryL;

end;

procedure TFormCadastroAutor.SqlListarLivros;
begin
  try
    DataModule1.qryLivros.SQL.Text :=
      ('SELECT '+
       ' id_livro '+
       ' nome_livro '+
       'FROM '+
       ' livros ');
    DataModule1.qryLivros.Open;
  except on
    E: Exception do
    raise Exception.Create('Erro ao consultar Livros [aqui].');
  end;
 { try
    FQueryL.SQL.Text :=
      ('SELECT '+
       ' nome_livro '+
       'FROM '+
       ' livros '+
       'WHERE '+
       ' autor_livro =' + IntToStr(FAutor.ID)  + '');
    FQueryL.Open;
  except on
    E: Exception do
    raise Exception.Create('Erro ao consultar Livros.');
  end; }
end;

procedure TFormCadastroAutor.SyncView;
begin
  edtAVisualID.Text := '';
  edtAVisualNome.Text := '';
  edtAVisualHora.Text := '';
  edtAVisualData.Text := '';

  edtId_Autores.Text := '';
  edtNome_Autores.Text := '';
  edtA_Hora.Text := '';
  edtA_Data.Text := '';
  if Assigned(Self.FAutor) then
    begin
      edtAVisualID.Text := FAutor.ID.ToString;
      edtAVisualNome.Text := FAutor.Nome;
      edtAVisualHora.Text := TimeToStr(FAutor.Hora);
      edtAVisualData.Text := DateToStr(FAutor.Data);

      edtId_Autores.Text := FAutor.ID.ToString;
      edtNome_Autores.Text := FAutor.Nome;
      edtA_Hora.Text := TimeToStr( FAutor.Hora);
      edtA_Data.Text := DateToStr(FAutor.Data);

    end;
end;

procedure TFormCadastroAutor.btnVerLivrosClick(Sender: TObject);
var
  I : Integer;
  _lbl : TLabel;
  _edt : TEdit;
  _edtID: TEdit;
  _btnE : TButton;
  _btnS : TButton;
  _btnC : TButton;
  _livro : TLivro;
  EdtNome : TEdit;
  BtnC : TButton;
  BtnS : TButton;
begin

  if StrToIntDef(edtAVisualID.Text, 0) <= 0 then
    Exit;

  for I := Low(arrPnlABox) to High(arrPnlABox) do
  begin
    arrPnlABox[i].Free;
  end;
   Finalize(arrPnlABox);

  DataModule1.qryLivros.Open;
  SetLength(arrPnlABox, DataModule1.qryLivros.RecordCount);
  DataModule1.qryLivros.First;



  while not DataModule1.qryLivros.Eof do
  //for I := ((FQueryL.RecordCount)-1) downto 0 do
  begin
    _livro := TLivro.Create;
    _Livro := TLivroDAO.Carregar(DataModule1.qryLivros.FieldByName('id_livro').AsInteger);
     EdtNome:= TEdit.Create(Self);

    arrPnlABox[DataModule1.qryLivros.RecNo] := TPanelComReferencia.Create(nil);
    arrPnlABox[DataModule1.qryLivros.RecNo].FLivro := _livro;
    arrPnlABox[DataModule1.qryLivros.RecNo].Caption :='';
    arrPnlABox[DataModule1.qryLivros.RecNo].Align := alTop;
    arrPnlABox[DataModule1.qryLivros.RecNo].Parent := ScrollBoxA;


    _lbl := TLabel.Create(arrPnlABox[DataModule1.qryLivros.RecNo]);
    _lbl.Parent := arrPnlABox[DataModule1.qryLivros.RecNo];
    _lbl.Caption := 'Nome do Livro';
    _lbl.Left := 3;
    _lbl.Top := 2;


    _edtID := TEdit.Create(arrPnlABox[DataModule1.qryLivros.RecNo]);
    _edtID.Parent := arrPnlABox[DataModule1.qryLivros.RecNo];
    _edtID.Text :=  DataModule1.qryLivros.FieldByName('id_livro').AsString;
    _edtID.Left := 227;
    _edtID.Top := 18;
    _edtID.Width := 36;
    _edtID.Height := 21;


    _edt := TEdit.Create(arrPnlABox[DataModule1.qryLivros.RecNo]);
    _edt.Parent := arrPnlABox[DataModule1.qryLivros.RecNo];
    _edt.Text :=  DataModule1.qryLivros.FieldByName('nome_livro').AsString;
    _edt.Left := 3;
    _edt.Top := 18;
    _edt.Width := 218;
    _edt.Height := 21;
    _edt.OnChange := OnChangeDoEdit;
    _edt.Tag := DataModule1.qryLivros.RecNo;

    arrPnlABox[DataModule1.qryLivros.RecNo].EdtNome := _edt;


    _btnE := TButton.Create(arrPnlABox[DataModule1.qryLivros.RecNo]);
    _btnE.Parent := arrPnlABox[DataModule1.qryLivros.RecNo];
    _btnE.Caption := 'Excluir';
    _btnE.Left := 377;
    _btnE.Top := 17;
    _btnE.Width := 47;
    _btnE.Height := 22;
    _btnE.Tag := DataModule1.qryLivros.RecNo; //DataModule1.qryLivros.FieldByName('id_livro').AsInteger;
    _btnE.OnClick := MeuClickExcluir;

    _btnC := TButton.Create(arrPnlABox[DataModule1.qryLivros.RecNo]);
    _btnC.Parent := arrPnlABox[DataModule1.qryLivros.RecNo];
    _btnC.Caption := 'Cancelar';
    _btnC.Left := 320;
    _btnC.Top := 17;
    _btnC.Width := 55;
    _btnC.Height := 22;
    _btnC.Tag := DataModule1.qryLivros.RecNo;
    _btnC.Enabled := False;
    _btnC.OnClick := MeuClickCancelar;
    arrPnlABox[DataModule1.qryLivros.RecNo].BtnC := _btnC;

    _btnS := TButton.Create(arrPnlABox[DataModule1.qryLivros.RecNo]);
    _btnS.Parent := arrPnlABox[DataModule1.qryLivros.RecNo];
    _btnS.Caption := 'Salvar';
    _btnS.Left := 266;
    _btnS.Top := 17;
    _btnS.Width := 55;
    _btnS.Height := 22;
    _btnS.Tag := DataModule1.qryLivros.RecNo;
    _btnS.Enabled := False;
    _btnS.OnClick := MeuClickSalvar;
    arrPnlABox[DataModule1.qryLivros.RecNo].BtnS := _btnS;
    DataModule1.qryLivros.Next;


  end;
  DataModule1.qryLivros.Refresh;
  //SqlListarLivros();
end;

procedure TFormCadastroAutor.Consultar_Autor;
begin
  if Assigned (FAutor) then
    FreeAndNil(FAutor);

  if DataModule1.qryAutoresid_autor.AsInteger <=0 then Exit ;

  FAutor := TAutorDAO.Carregar(DataModule1.qryAutores.FieldByName('id_autor').AsInteger);
  SyncView;
end;

procedure TFormCadastroAutor.Consultar_Livro;
begin
  if Assigned (FLivro) then
    FreeAndNil(FLivro);
  FLivro := TLivroDAO.Carregar(DataModule1.qryLivros.FieldByName('id_livro').AsInteger);
end;

procedure TFormCadastroAutor.AfterScrollDS(ADataSet: TDataSet);
begin
  SyncView;
  Consultar_Autor();
end;

procedure TFormCadastroAutor.btnAbrirConsultaClick(Sender: TObject);
begin
  pgcPrincipal.ActivePage := tbPesquisa;
  DataModule1.qryAutores.Active := Active;
  DataModule1.qryLivros.Active := Active;
  DataSL.Enabled := True;

  DataModule1.qryAutores.FetchAll;
  DataModule1.qryAutores.First;
  Consultar_Autor();


  btnAbrirConsulta.Enabled := False;

  if dbGridAutores.CanFocus then
    dbGridAutores.SetFocus;
end;

end.
