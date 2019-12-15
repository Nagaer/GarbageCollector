object form_Add_Manager: Tform_Add_Manager
  Left = 0
  Top = 0
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1084#1072#1085#1072#1075#1077#1088#1072
  ClientHeight = 373
  ClientWidth = 608
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
    Left = 56
    Top = 221
    Width = 80
    Height = 13
    Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
  end
  object label_name: TLabeledEdit
    Left = 56
    Top = 80
    Width = 121
    Height = 21
    EditLabel.Width = 54
    EditLabel.Height = 13
    EditLabel.Caption = 'label_name'
    TabOrder = 0
  end
  object label_surname: TLabeledEdit
    Left = 56
    Top = 136
    Width = 121
    Height = 21
    EditLabel.Width = 69
    EditLabel.Height = 13
    EditLabel.Caption = 'label_surname'
    TabOrder = 1
  end
  object label_exp: TLabeledEdit
    Left = 56
    Top = 184
    Width = 121
    Height = 21
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'label_exp'
    TabOrder = 2
  end
  object dtp_DOB: TDateTimePicker
    Left = 56
    Top = 240
    Width = 186
    Height = 21
    Date = 43809.000000000000000000
    Time = 0.603868877311470000
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 352
    Top = 198
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 4
  end
end
