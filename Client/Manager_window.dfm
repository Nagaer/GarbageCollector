object Form_manager: TForm_manager
  Left = 5
  Top = 206
  Caption = #1054#1082#1085#1086' '#1084#1077#1085#1077#1076#1078#1077#1088#1072
  ClientHeight = 401
  ClientWidth = 1112
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label_drivers: TLabel
    Left = 288
    Top = 0
    Width = 56
    Height = 13
    Caption = #1042#1086#1076#1080#1090#1077#1083#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label_cars: TLabel
    Left = 8
    Top = 0
    Width = 48
    Height = 13
    Caption = #1052#1072#1096#1080#1085#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label_managers: TLabel
    Left = 500
    Top = 0
    Width = 70
    Height = 13
    Caption = #1052#1077#1085#1077#1076#1078#1077#1088#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label_operators: TLabel
    Left = 576
    Top = 0
    Width = 65
    Height = 13
    Caption = #1054#1087#1077#1088#1072#1090#1086#1088#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid_drivers: TDBGrid
    Left = 247
    Top = 19
    Width = 250
    Height = 174
    DataSource = DataSource_drivers
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SURNAME'
        Title.Alignment = taCenter
        Title.Caption = #1060#1072#1084#1080#1083#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #1048#1084#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 54
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DOB'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1087#1088#1080#1085#1103#1090#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 31
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EXPERIENCE'
        Title.Alignment = taCenter
        Title.Caption = #1054#1087#1099#1090' '#1088#1072#1073#1086#1090#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        Visible = True
      end>
  end
  object DBGrid_cars: TDBGrid
    Left = 8
    Top = 19
    Width = 233
    Height = 174
    DataSource = DataSource_cars
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MARKA'
        Title.Alignment = taCenter
        Title.Caption = #1052#1072#1088#1082#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'MODEL'
        Title.Alignment = taCenter
        Title.Caption = #1052#1086#1076#1077#1083#1100
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NUMBER'
        Title.Alignment = taCenter
        Title.Caption = #1053#1086#1084#1077#1088
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Visible = True
      end>
  end
  object DBGrid_managers: TDBGrid
    Left = 8
    Top = 199
    Width = 233
    Height = 202
    DataSource = DataSource_managers
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SURNAME'
        Title.Alignment = taCenter
        Title.Caption = #1060#1072#1084#1080#1083#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #1048#1084#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DOB'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1087#1088#1080#1085#1103#1090#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EXPERIENCE'
        Title.Alignment = taCenter
        Title.Caption = #1054#1087#1099#1090' '#1088#1072#1073#1086#1090#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Visible = True
      end>
  end
  object DBGrid_operators: TDBGrid
    Left = 247
    Top = 199
    Width = 250
    Height = 202
    DataSource = DataSource_operators
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SURNAME'
        Title.Alignment = taCenter
        Title.Caption = #1060#1072#1084#1080#1083#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #1048#1084#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DOB'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1087#1088#1080#1085#1103#1090#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EXPERIENCE'
        Title.Alignment = taCenter
        Title.Caption = #1054#1087#1099#1090' '#1088#1072#1073#1086#1090#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -9
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 280
    Top = 256
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      object menu_diver: TMenuItem
        Caption = #1042#1086#1076#1080#1090#1077#1083#1100
        OnClick = menu_diverClick
      end
      object menu_operator: TMenuItem
        Caption = #1054#1087#1077#1088#1072#1090#1086#1088
        OnClick = menu_operatorClick
      end
      object menu_manager: TMenuItem
        Caption = #1052#1077#1085#1077#1076#1078#1077#1088
        OnClick = menu_managerClick
      end
      object menu_car: TMenuItem
        Caption = #1052#1072#1096#1080#1085#1072
        OnClick = menu_carClick
      end
      object menu_customer: TMenuItem
        Caption = #1047#1072#1082#1072#1079#1095#1080#1082
        OnClick = menu_customerClick
      end
      object menu_address: TMenuItem
        Caption = #1040#1076#1088#1077#1089
        OnClick = menu_addressClick
      end
    end
    object menu_edit: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      object menu_edit_driver: TMenuItem
        Caption = #1042#1086#1076#1080#1090#1077#1083#1100
        OnClick = menu_edit_driverClick
      end
      object menu_edit_operator: TMenuItem
        Caption = #1054#1087#1077#1088#1072#1090#1086#1088
        OnClick = menu_edit_operatorClick
      end
      object menu_edit_manager: TMenuItem
        Caption = #1052#1077#1085#1077#1076#1078#1077#1088
        OnClick = menu_edit_managerClick
      end
      object menu_edit_car: TMenuItem
        Caption = #1052#1072#1096#1080#1085#1072
        OnClick = menu_edit_carClick
      end
    end
    object menu_distr_cars: TMenuItem
      Caption = #1056#1072#1089#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1074#1086#1076#1080#1090#1077#1083#1077#1081' '
      OnClick = menu_distr_carsClick
    end
    object menu_update: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = menu_updateClick
    end
    object menu_orders: TMenuItem
      Caption = #1047#1072#1082#1072#1079#1099
      OnClick = menu_ordersClick
    end
  end
  object DataSource_drivers: TDataSource
    DataSet = dm.QDrivers
    OnDataChange = DataSource_driversDataChange
    Left = 424
    Top = 120
  end
  object DataSource_cars: TDataSource
    DataSet = dm.TVehicle
    OnDataChange = DataSource_carsDataChange
    Left = 144
    Top = 136
  end
  object DataSource_managers: TDataSource
    DataSet = dm.QManagers
    OnDataChange = DataSource_managersDataChange
    Left = 120
    Top = 280
  end
  object DataSource_operators: TDataSource
    DataSet = dm.QOperators
    OnDataChange = DataSource_operatorsDataChange
    Left = 368
    Top = 280
  end
end
