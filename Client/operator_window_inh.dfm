inherited Form_inh_operator: TForm_inh_operator
  Caption = 'Form_inh_operator'
  ClientHeight = 598
  ClientWidth = 861
  ExplicitWidth = 877
  ExplicitHeight = 637
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_orders: TPanel [0]
    Left = 600
    Top = 32
    Width = 265
    Height = 558
    Caption = 'Panel_orders'
    TabOrder = 0
  end
  object Button_update: TButton [1]
    Left = 392
    Top = 0
    Width = 107
    Height = 34
    Caption = 'Button_update'
    TabOrder = 1
    OnClick = Button_updateClick
  end
  object Panel_drivers: TPanel [2]
    Left = 8
    Top = 32
    Width = 593
    Height = 558
    Caption = 'Panel_drivers'
    TabOrder = 2
  end
  inherited IdUDPServer1: TIdUDPServer
    Left = 184
    Top = 528
  end
end
