uses GraphABC, 
      System, 
      PABCSystem,
      Timers;

const
  ROWS = 3;
  KEY_COUNT = 26;
  COLUMNS = 8;
  FRACTALS_COUNT = 50;
  ANGLE_FRAGMENTATION = 1000;
var keys: array of integer;

procedure AnimDrawingColorTouch(x0, y0 : integer);
begin
  var angles: array of integer;
  var vxFrags :array of real;
  var vyFrags : array of real;
  var xFrags :array of real;
  var yFrags : array of real;
  var xFrags2 :array of real;
  var yFrags2 : array of real;
  var speed: real;
  var acceleration: real;
  var duration: integer;
  
  SetLength(angles, FRACTALS_COUNT);
  SetLength(vxFrags, FRACTALS_COUNT);
  SetLength(vyFrags, FRACTALS_COUNT);
  SetLength(xFrags, FRACTALS_COUNT);
  SetLength(yFrags, FRACTALS_COUNT);
  SetLength(xFrags2, FRACTALS_COUNT);
  SetLength(yFrags2, FRACTALS_COUNT);
  speed := 3.0;
  acceleration := -5.0;
  duration := 50;
  
  for var i := 0 to FRACTALS_COUNT - 1 do
  begin
    angles[i] := Random(0, ANGLE_FRAGMENTATION);
    vxFrags[i] := cos(angles[i] / ANGLE_FRAGMENTATION * 2 * Pi);
    vyFrags[i] := sin(angles[i] / ANGLE_FRAGMENTATION * 2 * Pi);
    xFrags[i] := x0;
    yFrags[i] := y0;
    xFrags2[i] := x0;
    yFrags2[i] := y0;
  end;
  
  var timer1 : Timer;
  timer1 := new Timer(duration,  procedure () -> 
    begin 
      if (speed <= 0) then
      begin
        for var i := 0 to FRACTALS_COUNT - 1 do
        begin
          Pen.Color := clWhite;
          Line(round(xFrags2[i]), round(yFrags2[i]), 
            round(xFrags[i]), round(yFrags[i]));
        end;
        timer1.Stop;
      end;
        
      //Window.Clear;
      
      for var i := 0 to FRACTALS_COUNT - 1 do
      begin
        var x := xFrags[i] + speed * vxFrags[i];
        var y := yFrags[i] + speed * vyFrags[i];
        
        
        Line(round(xFrags2[i]), round(yFrags2[i]), 
          round(xFrags[i]), round(yFrags[i]), 
          clWhite);
        Line(round(xFrags[i]), round(yFrags[i]), round(x), round(y),
          RGB(0,0,0));
        
        
        xFrags2[i] := xFrags[i];
        yFrags2[i] := yFrags[i];
        xFrags[i] := x;
        yFrags[i] := y;
      end;
      
      //Redraw;
      speed := speed + acceleration * duration / 1000;
    end
  );
  
  timer1.Start;
end;

begin
  //LockDrawing;
  Window.Title := 'Launchpad';
  SetWindowSize(800,600);
  
  SetLength(keys, KEY_COUNT);
  for var i := 0 to keys.Length - 1 do
    keys[i] := VK_A + i;

  OnKeyDown := k -> 
    if (k - VK_A >= 0) and (k - VK_A < keys.Length) then
    begin
      var dy := Window.Height div (ROWS + 1);
      var dx := Window.Width div (COLUMNS + 1);
      var x0 := dx div 2;
      var y0 := dy div 2;
      AnimDrawingColorTouch(x0 + dx * ((k - VK_A) mod COLUMNS),
        y0 + dy * (ROWS - (k - VK_A) div COLUMNS));
    end;
end.