object form_Add_Operator: Tform_Add_Operator
  Left = 0
  Top = 0
  Caption = 'form_Add_Operator'
  ClientHeight = 361
  ClientWidth = 602
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
    Left = 40
    Top = 197
    Width = 80
    Height = 13
    Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
  end
  object label_name: TLabeledEdit
    Left = 40
    Top = 56
    Width = 121
    Height = 21
    EditLabel.Width = 54
    EditLabel.Height = 13
    EditLabel.Caption = 'label_name'
    TabOrder = 0
  end
  object label_surname: TLabeledEdit
    Left = 40
    Top = 112
    Width = 121
    Height = 21
    EditLabel.Width = 69
    EditLabel.Height = 13
    EditLabel.Caption = 'label_surname'
    TabOrder = 1
  end
  object label_exp: TLabeledEdit
    Left = 40
    Top = 160
    Width = 121
    Height = 21
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'label_exp'
    TabOrder = 2
  end
  object dtp_DOB: TDateTimePicker
    Left = 40
    Top = 216
    Width = 186
    Height = 21
    Date = 43809.000000000000000000
    Time = 0.603868877311470000
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 336
    Top = 174
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 4
  end
end
