uses crt;
const
  N = 5;
  var
  lol:array[0..N - 1] of integer;
  i: integer;
begin
  clrscr;
  randomize;
  for i := 0 to N - 1 do
  begin
    lol[i] := random(100);
    write(lol[i], ' ');
  end;
  writeln();
  
  
  
end.