object FormRelatorio: TFormRelatorio
  Left = 0
  Top = 0
  Caption = 'FormRelatorio'
  ClientHeight = 664
  ClientWidth = 826
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object rlRelatorio: TRLReport
    Left = 8
    Top = 39
    Width = 794
    Height = 1123
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    Visible = False
    OnNeedData = rlRelatorioNeedData
    OnPageEnding = rlRelatorioPageEnding
    OnPageStarting = rlRelatorioPageStarting
    object bndHeader: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 48
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object trlPanelNome: TRLPanel
        Left = 1
        Top = 1
        Width = 716
        Height = 22
        Align = faClientTop
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Borders.Style = bsClear
        Transparent = False
        object RLLabel1: TRLLabel
          Left = 0
          Top = 0
          Width = 716
          Height = 21
          Align = faClient
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Caption = 'LIVRARIA AMOR DE LER'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
      object RLPanel2: TRLPanel
        Left = 664
        Top = 23
        Width = 53
        Height = 24
        Align = faRightBottom
        object RLSystemInfo1: TRLSystemInfo
          Left = 15
          Top = 9
          Width = 38
          Height = 15
          Align = faRightBottom
          Info = itHour
          Text = ''
        end
      end
      object RLPanel1: TRLPanel
        Left = 611
        Top = 22
        Width = 53
        Height = 25
        Align = faRightBottom
        object RLSystemInfo2: TRLSystemInfo
          Left = 17
          Top = 10
          Width = 36
          Height = 15
          Align = faRightBottom
          Text = ''
        end
      end
      object RLPanel7: TRLPanel
        Left = 1
        Top = 22
        Width = 612
        Height = 25
        Align = faLeftBottom
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLLabel5: TRLLabel
          Left = 222
          Top = 0
          Width = 264
          Height = 26
          Alignment = taCenter
          Caption = 'RELA'#199#195'O EDITORAS x LIVROS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object bndHeaderEditoras: TRLBand
      Left = 38
      Top = 102
      Width = 718
      Height = 21
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLPanel5: TRLPanel
        Left = 49
        Top = 1
        Width = 313
        Height = 19
        Align = faLeft
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object trlNomeEditora: TRLLabel
          Left = 0
          Top = 0
          Width = 312
          Height = 19
          Align = faClient
          Caption = 'NOME DA EDITORA'
          Color = 10724259
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
      end
      object RLPanel10: TRLPanel
        Left = 1
        Top = 1
        Width = 48
        Height = 19
        Align = faLeft
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object RLLabel3: TRLLabel
          Left = 0
          Top = 0
          Width = 47
          Height = 19
          Align = faClient
          Alignment = taCenter
          Caption = 'ID'
          Color = 10724259
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
      end
      object RLPanel12: TRLPanel
        Left = 362
        Top = 1
        Width = 289
        Height = 19
        Align = faLeft
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object RLLabel7: TRLLabel
          Left = 0
          Top = 0
          Width = 288
          Height = 19
          Align = faClient
          Caption = 'CIDADE'
          Color = 10724259
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
      end
      object RLPanel13: TRLPanel
        Left = 651
        Top = 1
        Width = 67
        Height = 19
        Align = faLeft
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object RLLabel8: TRLLabel
          Left = 0
          Top = 0
          Width = 66
          Height = 19
          Align = faClient
          Caption = 'UF'
          Color = 10724259
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
      end
    end
    object bndFooter: TRLBand
      Left = 38
      Top = 282
      Width = 718
      Height = 30
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLPanel3: TRLPanel
        Left = 654
        Top = -2
        Width = 64
        Height = 32
        Align = faRightBottom
        object RLSystemInfo3: TRLSystemInfo
          Left = 0
          Top = 17
          Width = 64
          Height = 15
          Align = faBottom
          Info = itLastPageNumber
          Text = ''
        end
      end
      object RLPanel4: TRLPanel
        Left = 565
        Top = -2
        Width = 64
        Height = 32
        Align = faRightBottom
        object RLSystemInfo4: TRLSystemInfo
          Left = -16
          Top = 17
          Width = 80
          Height = 15
          Align = faRightBottom
          Info = itPageNumber
          Text = ''
        end
      end
      object RLLabel2: TRLLabel
        Left = 629
        Top = 15
        Width = 25
        Height = 15
        Align = faRightBottom
        Caption = '/'
      end
    end
    object bndSeparar: TRLBand
      Left = 38
      Top = 86
      Width = 718
      Height = 16
    end
    object bndDadosLivros: TRLBand
      Left = 38
      Top = 164
      Width = 718
      Height = 19
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = False
      object RLPanel9: TRLPanel
        Left = 49
        Top = 0
        Width = 313
        Height = 19
        Align = faLeft
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object trlNomeLivro: TRLLabel
          Left = 0
          Top = 0
          Width = 312
          Height = 19
          Align = faClient
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Caption = 'Nome do Livro'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          BeforePrint = trlNomeLivroBeforePrint
        end
      end
      object RLPanel11: TRLPanel
        Left = 1
        Top = 0
        Width = 48
        Height = 19
        Align = faLeft
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object RLLabel6: TRLLabel
          Left = 0
          Top = 0
          Width = 47
          Height = 19
          Align = faClient
          Alignment = taRightJustify
          BeforePrint = RLLabel6BeforePrint
        end
      end
      object RLPanel14: TRLPanel
        Left = 362
        Top = 0
        Width = 74
        Height = 19
        Align = faLeft
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object RLLabel9: TRLLabel
          Left = 0
          Top = 0
          Width = 73
          Height = 19
          Align = faClient
          Alignment = taCenter
          Caption = 'Ano'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          BeforePrint = RLLabel9BeforePrint
        end
      end
      object RLPanel15: TRLPanel
        Left = 436
        Top = 0
        Width = 281
        Height = 19
        Align = faRight
        object RLLabel10: TRLLabel
          Left = 0
          Top = 0
          Width = 281
          Height = 19
          Align = faClient
          Caption = 'autor_livro'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          BeforePrint = RLLabel10BeforePrint
        end
      end
    end
    object bndHeaderTotalL: TRLBand
      Left = 38
      Top = 183
      Width = 718
      Height = 21
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLPanel6: TRLPanel
        Left = 435
        Top = 1
        Width = 219
        Height = 19
        Align = faRight
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object RLLabel4: TRLLabel
          Left = 1
          Top = 0
          Width = 217
          Height = 19
          Align = faClient
          Caption = 'TOTAL DE LIVROS DA EDITORA:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLPanel8: TRLPanel
        Left = 654
        Top = 1
        Width = 63
        Height = 19
        Align = faRight
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object TotalLivrosE: TRLLabel
          Left = -7
          Top = 0
          Width = 77
          Height = 18
          Align = faCenter
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          BeforePrint = TotalLivrosEBeforePrint
        end
      end
    end
    object bndSeparar2: TRLBand
      Left = 38
      Top = 204
      Width = 718
      Height = 21
    end
    object bndHeaderLivros: TRLBand
      Left = 38
      Top = 143
      Width = 718
      Height = 21
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLPanel16: TRLPanel
        Left = 1
        Top = 0
        Width = 48
        Height = 20
        Align = faLeft
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object RLLabel11: TRLLabel
          Left = 0
          Top = 0
          Width = 47
          Height = 20
          Align = faClient
          Alignment = taCenter
          Caption = 'ID'
          Color = 15263976
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
      end
      object RLPanel17: TRLPanel
        Left = 49
        Top = 0
        Width = 313
        Height = 20
        Align = faLeft
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object RLLabel12: TRLLabel
          Left = 0
          Top = 0
          Width = 312
          Height = 20
          Align = faClient
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Caption = 'NOME DO LIVRO'
          Color = 15263976
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
      end
      object RLPanel18: TRLPanel
        Left = 362
        Top = 0
        Width = 74
        Height = 20
        Align = faLeft
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object RLLabel13: TRLLabel
          Left = 0
          Top = 0
          Width = 73
          Height = 20
          Align = faClient
          Alignment = taCenter
          Caption = 'ANO'
          Color = 15263976
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
      end
      object RLPanel19: TRLPanel
        Left = 436
        Top = 0
        Width = 281
        Height = 20
        Align = faRight
        object RLLabel14: TRLLabel
          Left = 0
          Top = 0
          Width = 281
          Height = 20
          Align = faClient
          Caption = 'AUTOR DO LIVRO'
          Color = 15263976
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
      end
    end
    object bndDadosEditora: TRLBand
      Left = 38
      Top = 123
      Width = 718
      Height = 20
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLPanel20: TRLPanel
        Left = 1
        Top = 0
        Width = 48
        Height = 19
        Align = faLeft
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object RLLabel15: TRLLabel
          Left = 0
          Top = 0
          Width = 47
          Height = 19
          Align = faClient
          Alignment = taRightJustify
          Caption = 'ID'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = False
          BeforePrint = RLLabel15BeforePrint
        end
      end
      object RLPanel21: TRLPanel
        Left = 362
        Top = 0
        Width = 289
        Height = 19
        Align = faLeft
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object RLLabel16: TRLLabel
          Left = 0
          Top = 0
          Width = 288
          Height = 19
          Align = faClient
          Caption = 'CIDADE'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = False
          BeforePrint = RLLabel16BeforePrint
        end
      end
      object RLPanel22: TRLPanel
        Left = 651
        Top = 0
        Width = 66
        Height = 19
        Align = faRight
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLLabel17: TRLLabel
          Left = 0
          Top = 0
          Width = 66
          Height = 19
          Align = faClient
          Alignment = taJustify
          Caption = 'UF'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = False
          BeforePrint = RLLabel17BeforePrint
        end
      end
      object RLPanel23: TRLPanel
        Left = 49
        Top = 0
        Width = 313
        Height = 19
        Align = faLeft
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        object RLLabel18: TRLLabel
          Left = 0
          Top = 0
          Width = 312
          Height = 19
          Align = faClient
          Caption = 'NOME DA EDITORA'
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Transparent = False
          BeforePrint = RLLabel18BeforePrint
        end
      end
    end
    object bndTotalEditoras: TRLBand
      Left = 38
      Top = 225
      Width = 718
      Height = 19
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = False
      object RLPanel24: TRLPanel
        Left = 447
        Top = 1
        Width = 233
        Height = 18
        Align = faRight
        object RLLabel19: TRLLabel
          Left = 0
          Top = 0
          Width = 233
          Height = 18
          Align = faClient
          Alignment = taRightJustify
          Caption = 'TOTAL DE EDITORAS:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLPanel27: TRLPanel
        Left = 680
        Top = 1
        Width = 37
        Height = 18
        Align = faRight
        object RLLabel22: TRLLabel
          Left = -155
          Top = 0
          Width = 192
          Height = 18
          Align = faRight
          Alignment = taRightJustify
          BeforePrint = RLLabel22BeforePrint
        end
      end
    end
    object bndTotalLivros: TRLBand
      Left = 38
      Top = 244
      Width = 718
      Height = 19
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = False
      object RLPanel25: TRLPanel
        Left = 446
        Top = 0
        Width = 233
        Height = 19
        Align = faRight
        object RLLabel20: TRLLabel
          Left = 0
          Top = 0
          Width = 233
          Height = 19
          Align = faRight
          Alignment = taRightJustify
          Caption = 'TOTAL DE LIVROS:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLPanel28: TRLPanel
        Left = 679
        Top = 0
        Width = 38
        Height = 19
        Align = faRight
        object RLLabel23: TRLLabel
          Left = -154
          Top = 0
          Width = 192
          Height = 19
          Align = faRight
          Alignment = taRightJustify
          BeforePrint = RLLabel23BeforePrint
        end
      end
    end
    object bndMediaLivros: TRLBand
      Left = 38
      Top = 263
      Width = 718
      Height = 19
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLPanel26: TRLPanel
        Left = 446
        Top = 0
        Width = 233
        Height = 18
        Align = faRight
        object RLLabel21: TRLLabel
          Left = 0
          Top = 0
          Width = 233
          Height = 18
          Align = faClient
          Alignment = taCenter
          Caption = 'M'#201'DIA DE LIVROS POR EDITORA:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLPanel29: TRLPanel
        Left = 679
        Top = 0
        Width = 38
        Height = 18
        Align = faRight
        object RLLabel24: TRLLabel
          Left = -154
          Top = 0
          Width = 192
          Height = 18
          Align = faRight
          Alignment = taRightJustify
          BeforePrint = RLLabel24BeforePrint
        end
      end
    end
  end
  object btnRelatorioE: TButton
    Left = 8
    Top = 8
    Width = 113
    Height = 25
    Caption = 'Imprimir Relat'#243'rio'
    TabOrder = 1
    OnClick = btnRelatorioEClick
  end
end
