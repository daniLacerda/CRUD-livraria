unit FrmRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Vcl.StdCtrls, uDataModule, Editora.Model, Livro.Model,
  FireDAC.Comp.Client;

type
  TFormRelatorio = class(TForm)
    rlRelatorio: TRLReport;
    bndHeader: TRLBand;
    bndHeaderEditoras: TRLBand;
    bndFooter: TRLBand;
    trlPanelNome: TRLPanel;
    RLLabel1: TRLLabel;
    RLPanel2: TRLPanel;
    RLSystemInfo1: TRLSystemInfo;
    bndSeparar: TRLBand;
    RLPanel1: TRLPanel;
    RLSystemInfo2: TRLSystemInfo;
    btnRelatorioE: TButton;
    RLPanel3: TRLPanel;
    RLSystemInfo3: TRLSystemInfo;
    RLPanel4: TRLPanel;
    RLSystemInfo4: TRLSystemInfo;
    RLLabel2: TRLLabel;
    bndDadosLivros: TRLBand;
    RLPanel7: TRLPanel;
    RLLabel5: TRLLabel;
    RLPanel5: TRLPanel;
    trlNomeEditora: TRLLabel;
    bndHeaderTotalL: TRLBand;
    bndSeparar2: TRLBand;
    RLPanel6: TRLPanel;
    RLLabel4: TRLLabel;
    RLPanel8: TRLPanel;
    TotalLivrosE: TRLLabel;
    RLPanel9: TRLPanel;
    trlNomeLivro: TRLLabel;
    RLPanel10: TRLPanel;
    RLLabel3: TRLLabel;
    RLPanel11: TRLPanel;
    RLPanel12: TRLPanel;
    RLLabel7: TRLLabel;
    RLPanel13: TRLPanel;
    RLLabel8: TRLLabel;
    RLPanel14: TRLPanel;
    RLLabel9: TRLLabel;
    RLPanel15: TRLPanel;
    RLLabel10: TRLLabel;
    bndHeaderLivros: TRLBand;
    RLPanel16: TRLPanel;
    RLPanel17: TRLPanel;
    RLLabel12: TRLLabel;
    RLPanel18: TRLPanel;
    RLLabel13: TRLLabel;
    RLPanel19: TRLPanel;
    RLLabel14: TRLLabel;
    RLLabel11: TRLLabel;
    bndDadosEditora: TRLBand;
    RLPanel20: TRLPanel;
    RLLabel15: TRLLabel;
    RLPanel21: TRLPanel;
    RLLabel16: TRLLabel;
    RLPanel22: TRLPanel;
    RLLabel17: TRLLabel;
    RLPanel23: TRLPanel;
    RLLabel18: TRLLabel;
    RLLabel6: TRLLabel;
    bndTotalEditoras: TRLBand;
    RLPanel24: TRLPanel;
    RLLabel19: TRLLabel;
    bndTotalLivros: TRLBand;
    RLPanel25: TRLPanel;
    RLLabel20: TRLLabel;
    bndMediaLivros: TRLBand;
    RLPanel26: TRLPanel;
    RLLabel21: TRLLabel;
    RLPanel27: TRLPanel;
    RLPanel28: TRLPanel;
    RLPanel29: TRLPanel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    procedure btnRelatorioEClick(Sender: TObject);
    procedure rlRelatorioNeedData(Sender: TObject; var MoreData: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure trlNomeLivroBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLLabel15BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLLabel18BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLLabel17BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLLabel16BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLLabel6BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLLabel9BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLLabel10BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure TotalLivrosEBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLLabel22BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLLabel23BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLLabel24BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure rlRelatorioPageStarting(Sender: TObject);
    procedure rlRelatorioPageEnding(Sender: TObject);




  private
    { Private declarations }
    FLivro : TLivro;
    FEditora: TEditora;
    qryAutores: TFDQuery;
    qryEditora: TFDQuery;
    qryLivro : TFDQuery;
    qryRelatorio : TFDQuery;
    Check : Boolean;
    _numLivros : Integer;
    _totalEditoras : integer;
    _numEditora : Integer;
    _soma : Integer;
    _media : Double;
    procedure EsconderBandas;
    procedure PrintarBanda(ABanda : TRLBand);
    function GetSqlRelatorio: TFDQuery;
    procedure BandasDeResultados;


  public
    { Public declarations }
  end;

var
  FormRelatorio: TFormRelatorio;

implementation

{$R *.dfm}


procedure TFormRelatorio.btnRelatorioEClick(Sender: TObject);
begin
  Check := True;
  rlRelatorio.PreviewModal;
end;

procedure TFormRelatorio.rlRelatorioNeedData(Sender: TObject;
  var MoreData: Boolean);
var
_idEditora : integer;
_editora_livro : integer;

begin
  EsconderBandas();
  _idEditora := 0;
  _editora_livro := 0;

  MoreData := Check;

  if MoreData then
  begin
    _soma := 0;
    _numEditora := 1;

    GetSqlRelatorio();
    qryRelatorio.First;
    _idEditora := qryRelatorio.FieldByName('id_editora').AsInteger;

    PrintarBanda(bndHeaderEditoras);
    PrintarBanda(bndDadosEditora);
    PrintarBanda(bndHeaderLivros);

    while not qryRelatorio.Eof do
    begin
     // _editora_livro := qryRelatorio.FieldByName('editora_livro').AsInteger;

      if _idEditora <> qryRelatorio.FieldByName('id_editora').AsInteger then
      begin
        _numEditora := _numEditora + 1;

        PrintarBanda(bndHeaderTotalL);
        PrintarBanda(bndSeparar);
        PrintarBanda(bndHeaderEditoras);
        PrintarBanda(bndDadosEditora);
        PrintarBanda(bndHeaderLivros);
        _soma := 0;
      end;
      _idEditora := qryRelatorio.FieldByName('id_editora').AsInteger;
      _soma := _soma + 1;
      PrintarBanda(bndDadosLivros);

      qryRelatorio.Next;

    end;

    PrintarBanda(bndHeaderTotalL);
    _media := qryRelatorio.RecordCount / _numEditora;
    PrintarBanda(bndSeparar);
    PrintarBanda(bndTotalEditoras);
    PrintarBanda(bndTotalLivros);
    PrintarBanda(bndMediaLivros);
  end;
  Check := False;
end;

procedure TFormRelatorio.rlRelatorioPageEnding(Sender: TObject);
begin

  PrintarBanda(bndFooter);
end;

procedure TFormRelatorio.rlRelatorioPageStarting(Sender: TObject);
begin
    PrintarBanda(bndHeader);
    PrintarBanda(bndSeparar);
end;

procedure TFormRelatorio.TotalLivrosEBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := _soma.ToString;
end;

procedure TFormRelatorio.trlNomeLivroBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := qryRelatorio.FieldByName('nome_livro').AsString;
end;

procedure TFormRelatorio.EsconderBandas;
begin
  bndHeader.Visible        := False;
  bndHeaderEditoras.Visible   := False;
  bndDadosLivros.Visible         := False;
  bndFooter.Visible        := False;
  bndSeparar.Visible       := False;
  bndHeaderTotalL.Visible  := False;
  bndHeaderLivros.Visible          := False;
  bndDadosEditora.Visible         := False;
  bndSeparar2.Visible      := False;
  bndTotalEditoras.Visible := False;
  bndTotalLivros.Visible   := False;
  bndMediaLivros.Visible   := False;
end;


procedure TFormRelatorio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(qryLivro);
  FreeAndNil(qryEditora);
  FreeAndNil(qryAutores);
  FreeAndNil(qryRelatorio);
end;


function TFormRelatorio.GetSqlRelatorio : TFDQuery;
begin
  qryRelatorio := TFDQuery.Create(nil);
  qryRelatorio.Connection := DataModule1.conexao;
  qryRelatorio.SQL.Text := ('SELECT '+
                            ' CONCAT '+
                            '  (id_autor, " - ", nome_autor) AS Autor, '+
                            '  nome_autor,'+
                            '  id_livro,  '+
                            '  nome_livro,'+
                            '  ano_livro, '+
                            '  autor_livro,'+
                            '  editora_livro,'+
                            '  id_editora,   '+
                            '  nome_editora, '+
                            '  cidade_editora,'+
                            '  estado_editora '+
                            ' FROM           '+
                            '  livros         '+
                            ' LEFT JOIN      '+
                            '  editoras ON editoras.id_editora = livros.editora_livro  '+
                            ' LEFT JOIN                                                '+
                            '  autores ON livros.autor_livro = autores.id_autor        '+
                            ' ORDER BY                                                 '+
                            '  id_editora');

  qryRelatorio.Open;
  qryRelatorio.FetchAll;
  Result := qryRelatorio;
end;



procedure TFormRelatorio.BandasDeResultados;
begin
  PrintarBanda(bndSeparar);
  PrintarBanda(bndTotalEditoras);
  PrintarBanda(bndTotalLivros);
  PrintarBanda(bndMediaLivros);

end;

procedure TFormRelatorio.PrintarBanda(ABanda: TRLBand);
begin
    ABanda.Visible := True;
    rlRelatorio.PrintBand(ABanda);
    ABanda.Visible := False;
end;

procedure TFormRelatorio.RLLabel10BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := qryRelatorio.FieldByName('Autor').AsString;
end;

procedure TFormRelatorio.RLLabel15BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := qryRelatorio.FieldByName('id_editora').AsString;
end;

procedure TFormRelatorio.RLLabel16BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := qryRelatorio.FieldByName('cidade_editora').AsString;
end;

procedure TFormRelatorio.RLLabel17BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := qryRelatorio.FieldByName('estado_editora').AsString;
end;

procedure TFormRelatorio.RLLabel18BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := qryRelatorio.FieldByName('nome_editora').AsString;
end;


procedure TFormRelatorio.RLLabel22BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := _numEditora.toString;
end;


procedure TFormRelatorio.RLLabel23BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := qryRelatorio.RecordCount.ToString;
end;

procedure TFormRelatorio.RLLabel24BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := FormatFloat('###,###,##0.0', _media);

end;

procedure TFormRelatorio.RLLabel6BeforePrint(Sender: TObject; var AText: string;
  var PrintIt: Boolean);
begin
  AText := qryRelatorio.FieldByName('id_livro').AsString;
end;

procedure TFormRelatorio.RLLabel9BeforePrint(Sender: TObject; var AText: string;
  var PrintIt: Boolean);
begin
AText := qryRelatorio.FieldByName('ano_livro').AsString;
end;

end.
