unit Order_class;

interface
  uses data_module,IBX.IBTable;

  type TOrder = Class
  private
    id : integer;
    status : integer;
  public
    constructor Create(row : TIBTable);
    procedure Edit(P_id: integer);
    destructor Destroy;
    function get_id : integer;
    function get_status : integer;

  End;
implementation

function TOrder.get_id;
begin
   get_id  := id;
end;

function TOrder.get_status ;
begin
   get_status := status;
end;
constructor TOrder.Create(row : TIBTable);
begin

end;

procedure TOrder.Edit(P_id: Integer);
begin
  id := p_id;
end;

destructor TOrder.Destroy;
begin

end;


end.