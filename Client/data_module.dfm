object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 472
  Width = 716
  object Torders: TIBTable
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ORDERS'
    UniDirectional = False
    Left = 512
    Top = 72
  end
  object TWorkers: TIBTable
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'WORKERS'
    UniDirectional = False
    Left = 512
    Top = 120
  end
  object spEDIT_ORDER_SET_DRIVER: TIBStoredProc
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    StoredProcName = 'EDIT_ORDER_SET_STATUS'
    Left = 272
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_ORDER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NEW_STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_WORKERS'
        ParamType = ptInput
      end>
  end
  object spAdd_order: TIBStoredProc
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    StoredProcName = 'ADD_ORDER'
    Left = 344
    Top = 136
    ParamData = <
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
        DataType = ftTimeStamp
        Name = 'FROM_ID_ADDREESS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TO_ID_ADDRESS'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATE_OF_DELIVERY'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'WHO_DRIVER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_OPERATOR'
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
      end
      item
        DataType = ftInteger
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATE_ORDER_COMPLETION'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATE_ORDER_CANCELLATION '
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'RESULT'
        ParamType = ptOutput
      end>
  end
  object TVehicle: TIBTable
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'GARAGE'
    UniDirectional = False
    Left = 512
    Top = 168
  end
  object TNew_day_car_delivery: TIBTable
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'NEW_DAY_CAR_DRIVER'
    UniDirectional = False
    Left = 592
    Top = 168
  end
  object QDriver_id_from_vehicle_day: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select ID_DRIVER, DATE_ from new_day_car_driver'
      'where id_car = :IN_ID_VEHICLE and date_ = :IN_DATE;')
    Left = 104
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_ID_VEHICLE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'IN_DATE'
        ParamType = ptInput
      end>
  end
  object spBegin_day_driver: TIBStoredProc
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    StoredProcName = 'BEGIN_DAY_DRIVER'
    Left = 424
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_WORKER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_CAR'
        ParamType = ptInput
      end>
  end
  object spLogin: TIBStoredProc
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    StoredProcName = 'LOGIN'
    Left = 272
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OUT_SUCCESS'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'OUT_ROLE'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'OUT_WORKER_ID'
        ParamType = ptOutput
      end
      item
        DataType = ftWideString
        Name = 'IN_PASSWORD'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'IN_LOGIN'
        ParamType = ptInput
      end>
  end
  object QDrivers: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        '   select * from workers w join logging_in l on w.id = l.id wher' +
        'e w.role_ = 2;')
    Left = 72
    Top = 144
  end
  object QManagers: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        '   select * from workers w join logging_in l on w.id = l.id wher' +
        'e w.role_ = 0;')
    Left = 72
    Top = 48
  end
  object QOperators: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        '   select * from workers w join logging_in l on w.id = l.id wher' +
        'e w.role_ = 1;')
    Left = 72
    Top = 96
  end
  object QCustomers: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from customers;')
    Left = 64
    Top = 192
  end
  object TAddress_In: TIBTable
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ADDRESS'
    UniDirectional = False
    Left = 592
    Top = 72
  end
  object TAddress_Out: TIBTable
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ADDRESS'
    UniDirectional = False
    Left = 592
    Top = 120
  end
  object QCustomer_By_Id: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select * from customers where id = :ID_CUSTOMER;')
    Left = 152
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_customer'
        ParamType = ptInput
      end>
  end
  object QCar_By_Id: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from garage where id = :id_car;')
    Left = 136
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_car'
        ParamType = ptInput
      end>
  end
  object QOrder_By_Id: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from orders where id = :id_order;')
    Left = 136
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_order'
        ParamType = ptInput
      end>
  end
  object QAddress_By_Id: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from address where id = :id_address;')
    Left = 64
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_address'
        ParamType = ptInput
      end>
  end
  object spEdit_Order_Status: TIBStoredProc
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    StoredProcName = 'EDIT_ORDER_SET_STATUS'
    Left = 408
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_ORDER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NEW_STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_WORKERS'
        ParamType = ptInput
      end>
  end
  object QWorker_By_Id: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from workers where id = :id_worker;')
    Left = 136
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_worker'
        ParamType = ptUnknown
      end>
  end
  object QLogin_By_Id: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_edit
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from logging_in where id = :id_login;')
    Left = 136
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_login'
        ParamType = ptInput
      end>
  end
end
