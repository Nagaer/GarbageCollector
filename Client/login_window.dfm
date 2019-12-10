object Login_Form: TLogin_Form
  Left = 0
  Top = 0
  Caption = 'Login_Form'
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
    Top = 32
    Width = 28
    Height = 13
    Caption = #1042#1061#1054#1044
  end
  object Label2: TLabel
    Left = 72
    Top = 32
    Width = 31
    Height = 13
    Caption = #1040#1076#1088#1077#1089
  end
  object Edit_login: TEdit
    Left = 192
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 0
    Text = #1051#1086#1075#1080#1085
  end
  object Edit_password: TEdit
    Left = 192
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 1
    Text = #1055#1072#1088#1086#1083#1100
  end
  object Button_log_in: TButton
    Left = 192
    Top = 152
    Width = 121
    Height = 49
    Caption = #1042#1086#1081#1090#1080
    TabOrder = 2
    OnClick = Button_log_inClick
  end
  object Edit_adress: TEdit
    Left = 40
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 3
    Text = #1040#1076#1088#1077#1089
  end
end
