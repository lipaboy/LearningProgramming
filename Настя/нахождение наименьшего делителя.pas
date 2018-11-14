var n, d : integer;
begin
  readln(n);
  d := 2;
  while(n mod d > 0)do
  begin
    d := d + 1;
  end;
  writeln(d);
end.