uses GraphABC;

var x, y: integer;

begin
  // установить размер окна (которое откроется при запуске программы)
  SetWindowSize(552, 552);
  
  for x:=0 to Window.Width - 1 do
    for y:=0 to Window.Height - 1 do
      SetPixel(x, y, RGB(2*x-y,x-3*y,x+y));
end.

