object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 342
  Width = 650
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 
      'C:\Users\dupel\OneDrive\'#1056#1072#1073#1086#1095#1080#1081' '#1089#1090#1086#1083'\'#1055#1056#1054#1045#1050#1058' '#1044#1045#1051#1060#1048'\Local_DB\FREIG' +
      'HT_TAXI.fdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction_read
    ServerType = 'IBServer'
    Left = 112
    Top = 80
  end
  object IBTransaction_read: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'no_rec_version')
    Left = 224
    Top = 88
  end
  object Torders: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ORDERS'
    UniDirectional = False
    Left = 328
    Top = 56
  end
  object TDrivers: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'WORKERS'
    UniDirectional = False
    Left = 328
    Top = 136
  end
  object spEDIT_ORDER_SET_DRIVER: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction_read
    StoredProcName = 'EDIT_ORDER_SET_DRIVER'
    Left = 296
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_DRIVER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_ORDER'
        ParamType = ptInput
      end>
  end
end
