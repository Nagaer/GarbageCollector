unit Driver_class;

interface
uses human_class, IBX.IBtable, IBX.IBQuery;
 type TDriver = class(Human)
  id : integer;
  status : integer;
  name : string;
  surname : string;
 public
  constructor Create(row : TIBQuery);
    procedure Edit(P_id: integer);
    destructor Destroy;
    function get_id : integer;
    function get_status : integer;
    function get_name : string;
    function get_surname : string;
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

function TDriver.get_name;
begin
   get_name  := name;
end;

function TDriver.get_surname ;
begin
   get_surname := surname;
end;

constructor TDriver.Create(row : TIBQuery);
begin
    id := row.FieldByName('ID').AsInteger;
    status := row.FieldByName('STATUS').AsInteger;
    name := row.FieldByName('NAME').Value;
    surname := row.FieldByName('SURNAME').Value;
end;

procedure TDriver.Edit(P_id: Integer);
begin
  id := p_id;
end;

destructor TDriver.Destroy;
begin


end;

end.
