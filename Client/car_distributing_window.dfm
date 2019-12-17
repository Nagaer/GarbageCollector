inherited Form_car_distributing: TForm_car_distributing
  Caption = #1056#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077' '#1084#1072#1096#1080#1085
  ClientHeight = 452
  ClientWidth = 758
  Menu = MainMenu1
  ExplicitWidth = 774
  ExplicitHeight = 511
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_driver: TPanel [0]
    Left = 0
    Top = -8
    Width = 410
    Height = 470
    Caption = #1055#1072#1085#1077#1083#1100' '#1079#1072#1082#1072#1079#1086#1074
    ParentBackground = False
    TabOrder = 0
  end
  object Panel_vehicle: TPanel [1]
    Left = 416
    Top = 0
    Width = 339
    Height = 454
    Caption = #1055#1072#1085#1077#1083#1100' '#1084#1072#1096#1080#1085
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 336
    Top = 184
    object menu_update: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = menu_updateClick
    end
    object menu_data: TMenuItem
      Caption = #1044#1072#1090#1072
      OnClick = menu_dataClick
    end
  end
end
