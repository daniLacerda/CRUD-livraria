program ufProjeto;

uses
  Vcl.Forms,
  FrmAutor in 'FrmAutor.pas' {FormCadastroAutor},
  Autor.Model in 'Autor.Model.pas',
  Livro.Model in 'Livro.Model.pas',
  uDataModule in 'uDataModule.pas' {DataModule1: TDataModule},
  uInicio in 'uInicio.pas' {Livraria},
  FrmLivro in 'FrmLivro.pas' {FormCadastroLivro},
  uModoTela in 'uModoTela.pas',
  FrmEditora in 'FrmEditora.pas' {FormCadastroEditora},
  Editora.Model in 'Editora.Model.pas',
  FrmRelatorio in 'FrmRelatorio.pas' {FormRelatorio};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := Debughook<>0;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLivraria, Livraria);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFormCadastroLivro, FormCadastroLivro);
  Application.CreateForm(TFormCadastroEditora, FormCadastroEditora);
  Application.CreateForm(TFormRelatorio, FormRelatorio);
  Application.Run;

end.
