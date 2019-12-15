unit User_class;

interface
  uses Human_class;
 type TRole = (Manager, Oper);
 type
 TUser = Class(Human)
       private
       id : integer;
       role :  TRole;
       public
        constructor Create(p_id : integer; p_role : integer);
        function get_role : TRole;
        function get_id : integer;

     End;
implementation

constructor TUser.Create(p_id: Integer; p_role: Integer);
begin
  id := p_id;
  case p_role of
   0 : role :=  manager;
   1 : role := oper;
  end;
{
  with dm.TWorkers do begin
      Refresh;
      Locate('ID',id,[]);
      name := FieldByName('NAME').Value;
      surname := FieldByName('SURNAME').Value;
      dob := FieldByName('DOB').Value;
      experience := FieldByName('EXPERIENCE').Value;
  end;


      }
end;

function TUser.get_role;
begin
  get_role := role;
end;

function TUser.get_id;
begin
  get_id := id;
end;

end.
