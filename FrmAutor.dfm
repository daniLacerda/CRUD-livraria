object FormCadastroAutor: TFormCadastroAutor
  Left = 0
  Top = 0
  Caption = 'FormCadastroAutor'
  ClientHeight = 466
  ClientWidth = 937
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lblModoAutor: TLabel
    Left = 628
    Top = 21
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
  object btnAbrirConsulta: TButton
    Left = 9
    Top = 8
    Width = 129
    Height = 25
    Caption = 'Abrir Consulta'
    TabOrder = 0
    OnClick = btnAbrirConsultaClick
  end
  object pgcPrincipal: TPageControl
    Left = 9
    Top = 40
    Width = 896
    Height = 389
    ActivePage = tbPesquisa
    TabOrder = 1
    object tbPesquisa: TTabSheet
      Caption = 'tbPesquisa'
      object pnlAutores: TPanel
        Left = 0
        Top = 0
        Width = 889
        Height = 537
        TabOrder = 0
        object Label1: TLabel
          Left = 6
          Top = 5
          Width = 60
          Height = 13
          Caption = 'ID do Autor:'
        end
        object Label2: TLabel
          Left = 72
          Top = 5
          Width = 76
          Height = 13
          Caption = 'Nome do Autor:'
        end
        object Label6: TLabel
          Left = 352
          Top = 5
          Width = 27
          Height = 13
          Caption = 'Hora:'
        end
        object Label7: TLabel
          Left = 416
          Top = 5
          Width = 27
          Height = 13
          Caption = 'Data:'
        end
        object pnlA_Operacoes: TPanel
          Left = 0
          Top = 312
          Width = 421
          Height = 41
          BevelOuter = bvSpace
          TabOrder = 0
          object btnA_Alterar: TButton
            Left = 6
            Top = 9
            Width = 51
            Height = 25
            Caption = 'Alterar'
            TabOrder = 0
            OnClick = btnA_AlterarClick
          end
          object btnA_Incluir: TButton
            Left = 57
            Top = 9
            Width = 51
            Height = 25
            Caption = 'Incluir'
            TabOrder = 1
            OnClick = btnA_IncluirClick
          end
        end
        object edtAVisualID: TEdit
          Left = 6
          Top = 24
          Width = 60
          Height = 21
          TabOrder = 1
        end
        object edtAVisualNome: TEdit
          Left = 72
          Top = 24
          Width = 274
          Height = 21
          TabOrder = 2
          OnChange = edtAVisualNomeChange
        end
        object btnVerLivros: TButton
          Left = 593
          Top = 21
          Width = 128
          Height = 25
          Caption = 'Ver Livro'
          TabOrder = 3
          OnClick = btnVerLivrosClick
        end
        object dbGridAutores: TDBGrid
          Left = 6
          Top = 51
          Width = 415
          Height = 255
          DataSource = DataModule1.DataSource1
          TabOrder = 4
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = dbGridAutoresCellClick
          OnColumnMoved = dbGridAutoresColumnMoved
          OnKeyDown = dbGridAutoresKeyDown
        end
        object edtAVisualHora: TEdit
          Left = 352
          Top = 24
          Width = 58
          Height = 21
          TabOrder = 5
          Text = 'edtAVisualHora'
        end
        object edtAVisualData: TEdit
          Left = 416
          Top = 24
          Width = 62
          Height = 21
          TabOrder = 6
          Text = 'edtAVisualData'
        end
        object btnA_Proximo: TButton
          Left = 534
          Top = 21
          Width = 53
          Height = 25
          Caption = 'Proximo'
          TabOrder = 7
          OnClick = btnA_ProximoClick
        end
        object btnA_Anterior: TButton
          Left = 481
          Top = 21
          Width = 53
          Height = 25
          Caption = 'Anterior'
          TabOrder = 8
          OnClick = btnA_AnteriorClick
        end
        object ScrollBoxA: TScrollBox
          Left = 427
          Top = 51
          Width = 454
          Height = 303
          TabOrder = 9
          object pnlABox: TPanel
            Left = 0
            Top = 0
            Width = 450
            Height = 47
            Align = alTop
            TabOrder = 0
            object Label9: TLabel
              Left = 3
              Top = 2
              Width = 72
              Height = 13
              Caption = 'Nome do Livro:'
            end
            object btnABox_Excluir: TButton
              Left = 377
              Top = 17
              Width = 47
              Height = 22
              Caption = 'Excluir'
              TabOrder = 0
            end
            object btnABox_Cancelar: TButton
              Left = 320
              Top = 17
              Width = 55
              Height = 22
              Caption = 'Cancelar'
              TabOrder = 1
            end
            object btnABox_Salvar: TButton
              Left = 266
              Top = 17
              Width = 55
              Height = 22
              Caption = 'Salvar'
              TabOrder = 2
            end
            object edtABox_nomeLivro: TEdit
              Left = 3
              Top = 18
              Width = 218
              Height = 21
              TabOrder = 3
              Text = 'edtABox_nomeLivro'
            end
            object edtABox_IDLivro: TEdit
              Left = 227
              Top = 18
              Width = 36
              Height = 21
              TabOrder = 4
              Text = 'edtABox_IDLivro'
            end
          end
        end
      end
    end
    object tbCadastro: TTabSheet
      Caption = 'tbCadastro'
      ImageIndex = 1
      object Label3: TLabel
        Left = 20
        Top = 29
        Width = 60
        Height = 13
        Caption = 'ID do Autor:'
      end
      object Label4: TLabel
        Left = 100
        Top = 29
        Width = 76
        Height = 13
        Caption = 'Nome do Autor:'
      end
      object Label5: TLabel
        Left = 452
        Top = 29
        Width = 27
        Height = 13
        Caption = 'Hora:'
      end
      object Label8: TLabel
        Left = 518
        Top = 29
        Width = 27
        Height = 13
        Caption = 'Data:'
      end
      object edtId_Autores: TEdit
        Left = 20
        Top = 48
        Width = 60
        Height = 21
        TabOrder = 0
        Text = 'edtId_Autores'
      end
      object edtNome_Autores: TEdit
        Left = 100
        Top = 48
        Width = 331
        Height = 21
        TabOrder = 1
        Text = 'edtNome_Autores'
      end
      object edtA_Data: TEdit
        Left = 518
        Top = 48
        Width = 67
        Height = 21
        TabOrder = 2
        Text = 'edtA_Data'
      end
      object edtA_Hora: TEdit
        Left = 452
        Top = 48
        Width = 53
        Height = 21
        TabOrder = 3
        Text = 'edtA_Hora'
      end
      object pnlA_Confirmar: TPanel
        Left = 418
        Top = 182
        Width = 167
        Height = 41
        BevelOuter = bvSpace
        TabOrder = 4
        object btnA_Cancelar: TButton
          Left = 5
          Top = 7
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 0
          OnClick = btnA_CancelarClick
        end
        object btnA_Salvar: TButton
          Left = 86
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Salvar'
          TabOrder = 1
          OnClick = btnA_SalvarClick
        end
      end
      object btnA_Excluir: TButton
        Left = 615
        Top = 3
        Width = 98
        Height = 25
        Caption = 'Excluir Registro'
        TabOrder = 5
        OnClick = btnA_ExcluirClick
      end
    end
  end
end
