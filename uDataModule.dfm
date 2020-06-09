object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 293
  Width = 395
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 305
    Top = 176
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 304
    Top = 224
  end
  object qryAutores: TFDQuery
    Active = True
    Connection = conexao
    SQL.Strings = (
      'select * from autores')
    Left = 71
    Top = 15
    object qryAutoresid_autor: TFDAutoIncField
      FieldName = 'id_autor'
      Origin = 'id_autor'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryAutoresnome_autor: TStringField
      FieldName = 'nome_autor'
      Origin = 'nome_autor'
      Required = True
      Size = 30
    end
    object qryAutoreshora_log: TTimeField
      FieldName = 'hora_log'
      Origin = 'hora_log'
    end
    object qryAutoresdata_log: TDateField
      FieldName = 'data_log'
      Origin = 'data_log'
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = qryAutores
    Left = 119
    Top = 16
  end
  object DataSource2: TDataSource
    AutoEdit = False
    DataSet = qryLivros
    Left = 16
    Top = 128
  end
  object qryLivros: TFDQuery
    ActiveStoredUsage = [auRunTime]
    Active = True
    Connection = conexao
    SQL.Strings = (
      'Select id_livro, nome_livro from livros')
    Left = 16
    Top = 72
    object qryLivrosid_livro: TFDAutoIncField
      FieldName = 'id_livro'
      Origin = 'id_livro'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryLivrosnome_livro: TStringField
      FieldName = 'nome_livro'
      Origin = 'nome_livro'
      Required = True
      Size = 40
    end
  end
  object qryEditoras: TFDQuery
    Active = True
    Connection = conexao
    SQL.Strings = (
      'select * from editoras')
    Left = 336
    Top = 24
    object qryEditorasid_editora: TFDAutoIncField
      FieldName = 'id_editora'
      Origin = 'id_editora'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryEditorasnome_editora: TStringField
      FieldName = 'nome_editora'
      Origin = 'nome_editora'
      Required = True
      Size = 30
    end
    object qryEditorascidade_editora: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cidade_editora'
      Origin = 'cidade_editora'
      Size = 25
    end
    object qryEditorasestado_editora: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'estado_editora'
      Origin = 'estado_editora'
      Size = 2
    end
  end
  object conexao: TFDConnection
    Params.Strings = (
      'Database=dblivraria'
      'User_Name=root'
      'Password=D40351038'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 16
    Top = 16
  end
  object DataSource3: TDataSource
    AutoEdit = False
    DataSet = qryEditoras
    Left = 280
    Top = 24
  end
  object DataSource4: TDataSource
    DataSet = qryLivros
    Left = 128
    Top = 224
  end
  object qryTESTE: TFDQuery
    Active = True
    Connection = conexao
    SQL.Strings = (
      'select nome_livro from livros')
    Left = 152
    Top = 136
    object qryTESTEnome_livro: TStringField
      FieldName = 'nome_livro'
      Origin = 'nome_livro'
      Required = True
      Size = 40
    end
  end
end
