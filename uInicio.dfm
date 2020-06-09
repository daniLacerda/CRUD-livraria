object Livraria: TLivraria
  Left = 0
  Top = 0
  Caption = 'Livraria'
  ClientHeight = 354
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 392
    Height = 338
    TabOrder = 0
    object Label1: TLabel
      Left = 152
      Top = 88
      Width = 81
      Height = 45
      Caption = 'Livraria'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Agency FB'
      Font.Style = []
      ParentFont = False
    end
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 8
    object Cadastrar2: TMenuItem
      Caption = 'Consultar'
      object Autores1: TMenuItem
        Caption = 'Autor'
        OnClick = Autores1Click
      end
      object Editoras2: TMenuItem
        Caption = 'Editora'
        OnClick = Editoras2Click
      end
      object Livros1: TMenuItem
        Caption = 'Livro'
        OnClick = Livros1Click
      end
    end
    object N1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Re1: TMenuItem
        Caption = 'Rela'#231#227'o Editora x Livros'
        OnClick = Re1Click
      end
    end
  end
end
