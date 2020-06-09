unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.Phys.MSAccDef, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSAcc, FireDAC.Comp.UI;

type
  TDataModule1 = class(TDataModule)
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    qryAutores: TFDQuery;
    DataSource1: TDataSource;
    qryAutoresid_autor: TFDAutoIncField;
    qryAutoresnome_autor: TStringField;
    qryAutoreshora_log: TTimeField;
    qryAutoresdata_log: TDateField;
    DataSource2: TDataSource;
    qryLivros: TFDQuery;
    qryEditoras: TFDQuery;
    conexao: TFDConnection;
    qryEditorasid_editora: TFDAutoIncField;
    qryEditorasnome_editora: TStringField;
    qryEditorascidade_editora: TStringField;
    qryEditorasestado_editora: TStringField;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    qryLivrosnome_livro: TStringField;
    qryLivrosid_livro: TFDAutoIncField;
    qryTESTE: TFDQuery;
    qryTESTEnome_livro: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}


end.
