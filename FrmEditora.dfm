object FormCadastroEditora: TFormCadastroEditora
  Left = 0
  Top = 0
  Caption = 'Cadastro de Editoras'
  ClientHeight = 392
  ClientWidth = 811
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblModoLivro: TLabel
    Left = 642
    Top = 12
    Width = 66
    Height = 13
    Caption = 'Modo: Leitura'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object pgcEditora: TPageControl
    Left = 8
    Top = 31
    Width = 796
    Height = 353
    ActivePage = tbEPesquisa
    TabOrder = 0
    object tbEPesquisa: TTabSheet
      AlignWithMargins = True
      Caption = 'tbEPesquisa'
      object pnlEditoras: TPanel
        Left = 0
        Top = 3
        Width = 787
        Height = 329
        TabOrder = 0
        object Label3: TLabel
          Left = 4
          Top = 5
          Width = 67
          Height = 13
          Caption = 'ID da Editora:'
        end
        object Label4: TLabel
          Left = 77
          Top = 5
          Width = 83
          Height = 13
          Caption = 'Nome da Editora:'
        end
        object Label5: TLabel
          Left = 485
          Top = 5
          Width = 17
          Height = 13
          Caption = 'UF:'
        end
        object Label8: TLabel
          Left = 372
          Top = 5
          Width = 37
          Height = 13
          Caption = 'Cidade:'
        end
        object edtEVisualID: TEdit
          Left = 6
          Top = 24
          Width = 65
          Height = 21
          TabOrder = 0
        end
        object edtEVisualUF: TEdit
          Left = 480
          Top = 24
          Width = 43
          Height = 21
          TabOrder = 1
        end
        object pnlE_Operacoes: TPanel
          Left = 4
          Top = 279
          Width = 519
          Height = 41
          TabOrder = 2
          object btnE_Alterar: TButton
            Left = 2
            Top = 8
            Width = 50
            Height = 25
            Caption = 'Alterar'
            TabOrder = 0
            OnClick = btnE_AlterarClick
          end
          object btnE_Incluir: TButton
            Left = 52
            Top = 8
            Width = 49
            Height = 25
            Caption = 'Incluir'
            TabOrder = 1
            OnClick = btnE_IncluirClick
          end
        end
        object edtEVisualNome: TEdit
          Left = 77
          Top = 24
          Width = 291
          Height = 21
          TabOrder = 3
        end
        object edtEVisualCidade: TEdit
          Left = 372
          Top = 24
          Width = 105
          Height = 21
          TabOrder = 4
          Text = 'edtEVisualCidade'
        end
        object btnE_Anterior: TButton
          Left = 529
          Top = 22
          Width = 52
          Height = 25
          Caption = 'Anterior'
          TabOrder = 5
          OnClick = btnE_AnteriorClick
        end
        object btnE_Proximo: TButton
          Left = 581
          Top = 22
          Width = 52
          Height = 25
          Caption = 'Proximo'
          TabOrder = 6
          OnClick = btnE_ProximoClick
        end
        object dbGridEditora: TDBGrid
          Left = 6
          Top = 50
          Width = 517
          Height = 231
          DataSource = DataModule1.DataSource3
          ReadOnly = True
          TabOrder = 7
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = dbGridEditoraCellClick
          OnColumnMoved = dbGridEditoraColumnMoved
          OnKeyDown = dbGridEditoraKeyDown
        end
        object btnEVerLivros: TButton
          Left = 639
          Top = 22
          Width = 138
          Height = 25
          Caption = 'Ver Livros desta Editora'
          TabOrder = 8
          OnClick = btnEVerLivrosClick
          OnKeyDown = btnEVerLivrosKeyDown
        end
        object dbGridELivros: TDBGrid
          Left = 529
          Top = 51
          Width = 250
          Height = 265
          DataSource = DataModule1.DataSource4
          TabOrder = 9
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
    end
    object tbECadastro: TTabSheet
      Caption = 'tbECadastro'
      ImageIndex = 1
      object Label1: TLabel
        Left = 11
        Top = 37
        Width = 67
        Height = 13
        Caption = 'ID da Editora:'
      end
      object Label2: TLabel
        Left = 101
        Top = 37
        Width = 83
        Height = 13
        Caption = 'Nome da Editora:'
      end
      object Label6: TLabel
        Left = 359
        Top = 37
        Width = 37
        Height = 13
        Caption = 'Cidade:'
      end
      object Label7: TLabel
        Left = 551
        Top = 37
        Width = 17
        Height = 13
        Caption = 'UF:'
      end
      object pnlL_Confirmar: TPanel
        Left = 403
        Top = 157
        Width = 169
        Height = 41
        TabOrder = 0
        object btnE_Salvar: TButton
          Left = 86
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Salvar'
          TabOrder = 0
          OnClick = btnE_SalvarClick
        end
        object btnE_Cancelar: TButton
          Left = 5
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 1
          OnClick = btnE_CancelarClick
        end
        object Button1: TButton
          Left = -336
          Top = -328
          Width = 75
          Height = 25
          Caption = 'Button1'
          TabOrder = 2
        end
      end
      object edtId_Editora: TEdit
        Left = 11
        Top = 56
        Width = 67
        Height = 21
        TabOrder = 1
        Text = 'edtId_Editora'
      end
      object edtNome_Editora: TEdit
        Left = 101
        Top = 56
        Width = 236
        Height = 21
        TabOrder = 2
        Text = 'edtNome_Editora'
      end
      object edtE_Cidade: TEdit
        Left = 359
        Top = 56
        Width = 178
        Height = 21
        TabOrder = 3
        Text = 'edtE_Cidade'
      end
      object edtUF_Editora: TEdit
        Left = 551
        Top = 56
        Width = 50
        Height = 21
        TabOrder = 4
        Text = 'edtUF_Editora'
      end
      object btnE_Excluir: TButton
        Left = 566
        Top = 6
        Width = 103
        Height = 25
        Caption = 'Excluir Registro'
        TabOrder = 5
        OnClick = btnE_ExcluirClick
      end
    end
  end
  object btnEConsultar: TButton
    Left = 7
    Top = 4
    Width = 130
    Height = 25
    Caption = 'Abrir Consulta'
    TabOrder = 1
    OnClick = btnEConsultarClick
  end
end
