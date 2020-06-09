unit uInicio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, FrmAutor, FrmLivro, FrmRelatorio,
  Vcl.Menus, FrmEditora;

type
  TLivraria = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    Cadastrar2: TMenuItem;
    Autores1: TMenuItem;
    Livros1: TMenuItem;
    Editoras2: TMenuItem;
    Label1: TLabel;
    N1: TMenuItem;
    Re1: TMenuItem;
    procedure Autores1Click(Sender: TObject);
    procedure Livros1Click(Sender: TObject);
    procedure Editoras2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Re1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Livraria: TLivraria;

implementation

{$R *.dfm}

procedure TLivraria.Autores1Click(Sender: TObject);
begin
  FormCadastroAutor := TFormCadastroAutor.Create(nil);

  try
    FormCadastroAutor.ShowModal;
  finally
    FreeAndNil(FormCadastroAutor);
  end;
end;


procedure TLivraria.Editoras2Click(Sender: TObject);
begin
  FormCadastroEditora := TFormCadastroEditora.Create(nil);
  try
    FormCadastroEditora.ShowModal;
  finally
    FreeAndNil(FormCadastroEditora);
  end;
end;

procedure TLivraria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
  Self.Close;
end;

procedure TLivraria.Livros1Click(Sender: TObject);
begin
  FormCadastroLivro := TFormCadastroLivro.Create(nil);
  try
    FormCadastroLivro.ShowModal;
  finally
    FreeAndNil(FormCadastroLivro);
  end;
end;

 

procedure TLivraria.Re1Click(Sender: TObject);
begin
  FormRelatorio := TFormRelatorio.Create(nil);
  try
    FormRelatorio.ShowModal;
  finally
    FreeAndNil(FormRelatorio);
  end;
end;

end.
