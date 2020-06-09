object FormCadastroLivro: TFormCadastroLivro
  Left = 0
  Top = 0
  Caption = 'Cadastro de Livros'
  ClientHeight = 430
  ClientWidth = 803
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
    Left = 688
    Top = 20
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
  object btnConsultarLivros: TButton
    Left = 8
    Top = 8
    Width = 150
    Height = 25
    Caption = 'Abrir Consulta'
    TabOrder = 0
    OnClick = btnConsultarLivrosClick
  end
  object pgcLivros: TPageControl
    Left = 8
    Top = 39
    Width = 785
    Height = 378
    ActivePage = tbLPesquisa
    TabOrder = 1
    object tbLPesquisa: TTabSheet
      Caption = 'tbLPesquisa'
      object pnlLivros: TPanel
        Left = 0
        Top = 0
        Width = 858
        Height = 353
        TabOrder = 0
        object Label3: TLabel
          Left = 8
          Top = 8
          Width = 56
          Height = 13
          Caption = 'ID do Livro:'
        end
        object Label4: TLabel
          Left = 74
          Top = 8
          Width = 72
          Height = 13
          Caption = 'Nome do Livro:'
        end
        object Label5: TLabel
          Left = 507
          Top = 8
          Width = 60
          Height = 13
          Caption = 'ID do Autor:'
        end
        object Label8: TLabel
          Left = 399
          Top = 8
          Width = 102
          Height = 13
          Caption = 'Ano  de Lan'#231'amento:'
        end
        object Label9: TLabel
          Left = 578
          Top = 8
          Width = 67
          Height = 13
          Caption = 'ID da Editora:'
        end
        object edtLVisualID: TEdit
          Left = 8
          Top = 27
          Width = 51
          Height = 21
          TabOrder = 0
        end
        object edtLVisualAutor: TEdit
          Left = 507
          Top = 27
          Width = 65
          Height = 21
          TabOrder = 1
        end
        object dbGridLivros: TDBGrid
          Left = 8
          Top = 53
          Width = 758
          Height = 257
          DataSource = DataModule1.DataSource2
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = dbGridLivrosCellClick
          OnColumnMoved = dbGridLivrosColumnMoved
          OnKeyDown = dbGridLivrosKeyDown
        end
        object edtLVisualNome: TEdit
          Left = 71
          Top = 27
          Width = 322
          Height = 21
          TabOrder = 3
        end
        object edtLVisualAno: TEdit
          Left = 399
          Top = 27
          Width = 102
          Height = 21
          TabOrder = 4
          Text = 'edtLVisualAno'
        end
        object edtLVisualEditora: TEdit
          Left = 578
          Top = 27
          Width = 67
          Height = 21
          TabOrder = 5
          Text = 'edtLVisualEditora'
        end
        object pnlL_Operacoes: TPanel
          Left = -4
          Top = 313
          Width = 785
          Height = 39
          TabOrder = 6
          object btnL_Incluir: TButton
            Left = 62
            Top = 3
            Width = 49
            Height = 25
            Caption = 'Incluir'
            TabOrder = 0
            OnClick = btnL_IncluirClick
          end
          object btnL_Alterar: TButton
            Left = 12
            Top = 3
            Width = 50
            Height = 25
            Caption = 'Alterar'
            TabOrder = 1
            OnClick = btnL_AlterarClick
          end
        end
        object btnL_Anterior: TButton
          Left = 661
          Top = 23
          Width = 52
          Height = 25
          Caption = 'Anterior'
          TabOrder = 7
          OnClick = btnL_AnteriorClick
        end
        object btnL_Proximo: TButton
          Left = 714
          Top = 23
          Width = 52
          Height = 25
          Caption = 'Proximo'
          TabOrder = 8
          OnClick = btnL_ProximoClick
        end
      end
    end
    object tbLCadastro: TTabSheet
      Caption = 'tbLCadastro'
      ImageIndex = 1
      object Label1: TLabel
        Left = 11
        Top = 26
        Width = 56
        Height = 13
        Caption = 'ID do Livro:'
      end
      object Label2: TLabel
        Left = 85
        Top = 26
        Width = 72
        Height = 13
        Caption = 'Nome do Livro:'
      end
      object Label6: TLabel
        Left = 13
        Top = 90
        Width = 99
        Height = 13
        Caption = 'Ano do Lan'#231'amento:'
      end
      object Label7: TLabel
        Left = 133
        Top = 90
        Width = 60
        Height = 13
        Caption = 'ID do Autor:'
      end
      object Label10: TLabel
        Left = 214
        Top = 90
        Width = 67
        Height = 13
        Caption = 'ID da Editora:'
      end
      object pnlL_Confirmar: TPanel
        Left = 303
        Top = 286
        Width = 169
        Height = 41
        TabOrder = 0
        object btnL_Salvar: TButton
          Left = 86
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Salvar'
          TabOrder = 0
          OnClick = btnL_SalvarClick
        end
        object btnL_Cancelar: TButton
          Left = 5
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 1
          OnClick = btnL_CancelarClick
        end
      end
      object edtId_Livro: TEdit
        Left = 11
        Top = 45
        Width = 54
        Height = 21
        TabOrder = 1
        Text = 'edtId_Livro'
      end
      object edtNome_Livro: TEdit
        Left = 83
        Top = 45
        Width = 389
        Height = 21
        TabOrder = 2
        Text = 'edtNome_Livro'
      end
      object edtL_AnoLivro: TEdit
        Left = 13
        Top = 109
        Width = 99
        Height = 21
        TabOrder = 3
        Text = 'edtL_AnoLivro'
      end
      object edtAutor_Livro: TEdit
        Left = 133
        Top = 109
        Width = 60
        Height = 21
        TabOrder = 4
        Text = 'edtAutor_Livro'
      end
      object edtL_EditoraLivro: TEdit
        Left = 214
        Top = 109
        Width = 67
        Height = 21
        TabOrder = 5
        Text = 'edtL_EditoraLivro'
      end
      object btnListaAutores: TButton
        Left = 380
        Top = 107
        Width = 92
        Height = 25
        Caption = 'Lista de Autores'
        TabOrder = 6
        OnClick = btnListaAutoresClick
        OnKeyDown = btnListaAutoresKeyDown
      end
      object btnListaEditoras: TButton
        Left = 380
        Top = 143
        Width = 92
        Height = 25
        Caption = 'Lista de Editoras'
        TabOrder = 7
        OnClick = btnListaEditorasClick
      end
      object pnlAConsulta: TPanel
        Left = 478
        Top = 3
        Width = 296
        Height = 336
        TabOrder = 8
        object dbGridALista: TDBGrid
          Left = 8
          Top = 10
          Width = 281
          Height = 319
          DataSource = DataModule1.DataSource1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Visible = False
        end
      end
      object btnL_Excluir: TButton
        Left = 380
        Top = 3
        Width = 92
        Height = 25
        Caption = 'Excluir Registro'
        TabOrder = 9
        OnClick = btnL_ExcluirClick
      end
    end
  end
end
