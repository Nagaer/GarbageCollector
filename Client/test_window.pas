unit test_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.ExtCtrls, data_module, Vcl.Grids,
  Vcl.DBGrids;

type
  Tform_test = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ListDrivers: TListBox;
    DataSource1: TDataSource;
    HeaderControl1: THeaderControl;
    ListOrders: TListBox;
    ListQueue: TListBox;
    ListViewQueue: TListView;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    procedure ListDriversDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ListDriversMeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure ListDriversDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListDriversDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListQueueDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListQueueDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListViewQueueDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListViewQueueDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_test: Tform_test;

implementation

{$R *.dfm}

procedure Tform_test.Button1Click(Sender: TObject);
begin
  dm.TOrders.Close;
  dm.TOrders.Open;

end;

procedure Tform_test.ListDriversDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  Y := (sender as TListBox).itemindex;
  ListDrivers.Items.Add(ListOrders.Items[ (Source as TListBox).itemindex]);
end;

procedure Tform_test.ListDriversDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  accept := sender is TlistBox;
end;

procedure Tform_test.ListDriversDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
  var
   pic : TPicture;
   myRect  : Trect;
   item : string;
  begin
      item := ListDrivers.items[index];

      myRect.Height := rect.Height * 2;
      with ListDrivers.Canvas Do
      begin
        brush.Color := clred;
        fillRect(Rect);
        font.Size := 16;
        font.Color := clGray;

        textOut(Rect.Left, Rect.Top, item);

      end;
end;

procedure Tform_test.ListDriversMeasureItem(Control: TWinControl;
  Index: Integer; var Height: Integer);
begin
  height := 30;
end;

procedure Tform_test.ListQueueDragDrop(Sender, Source: TObject; X,
  Y: Integer);
  var i : integer;
  res : string;
begin
  listQueue.Columns := listQueue.Columns + 1 ;
  for I := 0 to listQueue.Columns -1 do
    res := res + ' ' + ListOrders.Items[ (Source as TListBox).itemindex];
  listQueue.Items.Add(res)

end;

procedure Tform_test.ListQueueDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
    accept := sender is TListBox;
end;

procedure Tform_test.ListViewQueueDragDrop(Sender, Source: TObject; X,
  Y: Integer);
  var
  itm : TListColumn;
begin
    with   ListViewQueue do begin
             itm := Columns.Add;
             itm.Caption := 'Yo';
    end;
end;

procedure Tform_test.ListViewQueueDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  accept := true;
end;

end.
