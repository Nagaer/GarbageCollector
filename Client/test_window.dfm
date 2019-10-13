object form_test: Tform_test
  Left = 0
  Top = 0
  Caption = 'form_test'
  ClientHeight = 576
  ClientWidth = 852
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
    Top = 39
    Width = 49
    Height = 13
    Caption = #1042#1086#1076#1080#1090#1077#1083#1080
  end
  object Label2: TLabel
    Left = 744
    Top = 61
    Width = 37
    Height = 13
    Caption = #1047#1072#1082#1072#1079#1099
  end
  object ListDrivers: TListBox
    Left = 0
    Top = 108
    Width = 153
    Height = 377
    Style = lbOwnerDrawVariable
    Items.Strings = (
      'one'
      'two'
      'three')
    TabOrder = 0
    OnDragDrop = ListDriversDragDrop
    OnDragOver = ListDriversDragOver
    OnDrawItem = ListDriversDrawItem
    OnMeasureItem = ListDriversMeasureItem
  end
  object HeaderControl1: THeaderControl
    Left = 0
    Top = 0
    Width = 852
    Height = 33
    Sections = <>
  end
  object ListOrders: TListBox
    Left = 688
    Top = 96
    Width = 164
    Height = 377
    DragMode = dmAutomatic
    ItemHeight = 13
    Items.Strings = (
      '1'
      '2'
      '3')
    TabOrder = 2
  end
  object ListQueue: TListBox
    Left = 152
    Top = 108
    Width = 121
    Height = 97
    Columns = 2
    ItemHeight = 13
    Items.Strings = (
      '12 23'
      '12'
      ' 1')
    TabOrder = 3
    OnDragDrop = ListQueueDragDrop
    OnDragOver = ListQueueDragOver
  end
  object ListViewQueue: TListView
    Left = 288
    Top = 319
    Width = 250
    Height = 150
    Columns = <>
    DragMode = dmAutomatic
    TabOrder = 4
    ViewStyle = vsReport
    OnDragDrop = ListViewQueueDragDrop
    OnDragOver = ListViewQueueDragOver
  end
  object Panel1: TPanel
    Left = 0
    Top = 69
    Width = 153
    Height = 44
    Caption = 'Panel1'
    TabOrder = 5
  end
  object DBGrid1: TDBGrid
    Left = 279
    Top = 152
    Width = 320
    Height = 120
    DataSource = DataSource1
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 424
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 7
    OnClick = Button1Click
  end
  object DataSource1: TDataSource
    DataSet = dm.Torders
    Left = 448
    Top = 184
  end
end
