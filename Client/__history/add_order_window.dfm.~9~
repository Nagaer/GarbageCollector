object Form_add_order: TForm_add_order
  Left = 0
  Top = 0
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079
  ClientHeight = 468
  ClientWidth = 717
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 440
    Top = 104
    Width = 77
    Height = 13
    Caption = #1044#1072#1090#1072' '#1076#1086#1089#1090#1072#1074#1082#1080
  end
  object Label2: TLabel
    Left = 440
    Top = 189
    Width = 48
    Height = 13
    Caption = #1042#1077#1089' '#1075#1088#1091#1079#1072
  end
  object Label3: TLabel
    Left = 440
    Top = 248
    Width = 90
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1075#1088#1091#1079#1095#1080#1082#1086#1074
  end
  object Label4: TLabel
    Left = 440
    Top = 294
    Width = 26
    Height = 13
    Caption = #1062#1077#1085#1072
  end
  object Label5: TLabel
    Left = 8
    Top = 294
    Width = 31
    Height = 13
    Caption = #1050#1091#1076#1072'?'
  end
  object Label6: TLabel
    Left = 8
    Top = 150
    Width = 44
    Height = 13
    Caption = #1054#1090#1082#1091#1076#1072'?'
  end
  object Label7: TLabel
    Left = 24
    Top = 8
    Width = 47
    Height = 13
    Caption = #1047#1072#1082#1072#1079#1095#1080#1082
  end
  object DBGrid_customers: TDBGrid
    Left = 8
    Top = 24
    Width = 320
    Height = 120
    DataSource = DataSource_customers
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SURNAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PHONE_NUMBER'
        Visible = True
      end>
  end
  object DBGrid_from_address: TDBGrid
    Left = 8
    Top = 168
    Width = 320
    Height = 120
    DataSource = DataSource_from_address
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CITY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STREET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMBER_HOUSE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FLOOR_'
        Visible = True
      end>
  end
  object DBGrid_to_address: TDBGrid
    Left = 8
    Top = 313
    Width = 320
    Height = 120
    DataSource = DataSource_to_address
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CITY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STREET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMBER_HOUSE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FLOOR_'
        Visible = True
      end>
  end
  object dtp_delivery: TDateTimePicker
    Left = 440
    Top = 123
    Width = 186
    Height = 21
    Date = 43814.000000000000000000
    Time = 0.569593310188793100
    TabOrder = 3
  end
  object label_weight: TEdit
    Left = 440
    Top = 208
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'label_weight'
  end
  object label_stevedore: TEdit
    Left = 440
    Top = 267
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'label_stevedore'
  end
  object label_price: TEdit
    Left = 440
    Top = 313
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'label_price'
  end
  object BitBtn1: TBitBtn
    Left = 486
    Top = 407
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 7
  end
  object Button1: TButton
    Left = 334
    Top = 64
    Width = 114
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
    TabOrder = 8
    OnClick = Button1Click
  end
  object DataSource_customers: TDataSource
    DataSet = dm.QCustomers
    Left = 344
    Top = 112
  end
  object DataSource_from_address: TDataSource
    DataSet = dm.TAddress_In
    Left = 360
    Top = 232
  end
  object DataSource_to_address: TDataSource
    DataSet = dm.TAddress_Out
    Left = 360
    Top = 352
  end
end
