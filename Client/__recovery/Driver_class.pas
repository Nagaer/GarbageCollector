unit Driver_class;

interface
uses human_class, IBX.IBtable,IBX.IbQuery;
 type TDriver = class(Human)
  id : integer;
  status : integer;
 public
  constructor Create(row : TIbQuery);
    procedure Edit(P_id: integer);
    destructor Destroy;
    function get_id : integer;
    function get_status : integer;
 end;
implementation
    function TDriver.get_id;
begin
   get_id  := id;
end;

function TDriver.get_status ;
begin
   get_status := status;
end;
constructor TDriver.Create(row : TIbQuery);
begin
    id := row.FieldByName('ID').AsInteger;
    status := row.FieldByName('STATUS').AsInteger;
end;

procedure TDriver.Edit(P_id: Integer);
begin
  id := p_id;
end;

destructor TDriver.Destroy;
begin


end;

end.
