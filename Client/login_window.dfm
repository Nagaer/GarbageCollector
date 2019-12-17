object Login_Form: TLogin_Form
  Left = 0
  Top = 0
  Caption = #1054#1082#1085#1086' '#1083#1086#1075#1080#1085#1072
  ClientHeight = 230
  ClientWidth = 505
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
    Left = 232
    Top = 24
    Width = 33
    Height = 13
    Caption = #1042#1061#1054#1044
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 45
    Width = 72
    Height = 13
    Caption = #1040#1076#1088#1077#1089' '#1093#1086#1089#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 40
    Top = 91
    Width = 57
    Height = 13
    Caption = #1055#1091#1090#1100' '#1082' '#1073#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Edit_login: TEdit
    Left = 192
    Top = 64
    Width = 121
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'admin'
  end
  object Edit_password: TEdit
    Left = 192
    Top = 110
    Width = 121
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'admin'
  end
  object Button_log_in: TButton
    Left = 192
    Top = 152
    Width = 121
    Height = 49
    Caption = #1042#1086#1081#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button_log_inClick
  end
  object Edit_adress: TEdit
    Left = 40
    Top = 64
    Width = 121
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = '127.0.0.1'
  end
  object Edit_path: TEdit
    Left = 40
    Top = 110
    Width = 121
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = 
      'D:\Delphi Collector\GarbageCollector\FREIGHT_TAXI_actual_changes' +
      '.FDB'
  end
end
