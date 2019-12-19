object dm_add: Tdm_add
  OldCreateOrder = False
  Height = 354
  Width = 554
  object spAdd_Car: TIBStoredProc
    Database = dm_db.IBDatabase_edit
    Transaction = dm_db.IBTransaction_edit
    StoredProcName = 'ADD_CAR'
    Left = 152
    Top = 184
    ParamData = <
      item
        DataType = ftWideString
        Name = 'MARKA'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'NUMBER'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'MODEL'
        ParamType = ptInput
      end>
  end
  object spEdit_Car: TIBStoredProc
    Database = dm_db.IBDatabase_edit
    Transaction = dm_db.IBTransaction_edit
    StoredProcName = 'EDIT_CAR'
    Left = 216
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'MARKA'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'NUMBER'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'MODEL'
        ParamType = ptInput
      end>
  end
  object spEdit_Worker: TIBStoredProc
    Database = dm_db.IBDatabase_edit
    Transaction = dm_db.IBTransaction_edit
    StoredProcName = 'EDIT_WORKER'
    Left = 232
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ROLE_'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EXPERIENCE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DOB'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'SURNAME'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'NAME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOGIN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PASSWORD_'
        ParamType = ptInput
      end>
  end
  object spAdd_Address: TIBStoredProc
    Database = dm_db.IBDatabase_edit
    Transaction = dm_db.IBTransaction_edit
    StoredProcName = 'ADD_ADDRESS'
    Left = 368
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'CITY'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STREET'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMBER_HOUSE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLOOR_'
        ParamType = ptInput
      end>
  end
  object spAdd_Order: TIBStoredProc
    Database = dm_db.IBDatabase_edit
    Transaction = dm_db.IBTransaction_edit
    StoredProcName = 'ADD_ORDER'
    Left = 328
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RESULT'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'ID_OPERATOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_CUSTOMER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'WEIGHT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FROM_ID_ADDREESS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TO_ID_ADDRESS'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATE_OF_DELIVERY'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMBER_STEVEDORE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PRICE'
        ParamType = ptInput
      end>
  end
  object spAdd_Customer: TIBStoredProc
    Database = dm_db.IBDatabase_edit
    Transaction = dm_db.IBTransaction_edit
    StoredProcName = 'ADD_CUSTOMER'
    Left = 288
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SURNAME'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_ADDRESS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHONE_NUMBER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'RESULT'
        ParamType = ptOutput
      end>
  end
  object spAdd_Worker: TIBStoredProc
    Database = dm_db.IBDatabase_edit
    Transaction = dm_db.IBTransaction_edit
    StoredProcName = 'ADD_WORKER'
    Left = 144
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ROLE_'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EXPERIENCE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DOB'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SURNAME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOGIN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PASSWORD_'
        ParamType = ptInput
      end>
  end
end
