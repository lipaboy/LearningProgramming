uses Graph3D, Timers;

// константы (инварианты или неизменяемые переменные)
const 
DLINA_ROKETKA = 3;
BALL_RADIUS = 0.5;
GRANIZA_X1 = 5;
GRANIZA_X2 = -5;
GRANIZA_Y1 = 5;
GRANIZA_Y2 = -5;

// переменные
var roketka1, roketka2 : BoxT;
var ball : SphereT;
var vx, vy, speed, ugol : real;
var duration : integer;
var t1,t2 : Timer;
var a:integer;


procedure pusk();
begin
  ball.x:=ball.x+vx;
 if (ball.X >= 5)then
  vx:=-vx;
  if (ball.X <= -5)then
    vx:=-vx;
  

 
 ball.y:=ball.y+vy;
 if (ball.y >= 5)then
  vy:=-vy;
  if (ball.y <= -5)then
    vy:=-vy;
  
end;


procedure lol();
begin
  vx := vx + random(-1, 1)/100;
  vy := vy + random(-1, 1)/100;
end;




begin

  // Создаём объекты сцены
  // Первая рокетка:
  //              координаты-------------длина рокетки--ширина-высота-цвет
  roketka1 := Box(0,GRANIZA_Y2-0.8, 0.5, DLINA_ROKETKA, 1,     1,     Colors.Orange);
  roketka2 := Box(0,GRANIZA_Y1+0.8, 0.5, DLINA_ROKETKA, 1,     1,     Colors.Green);
  ball :=  Sphere(0, 0, 0.5, BALL_RADIUS,                 Materials.Rainbow);
  
  a := 0;
  // Присваиваем событию "Нажатие клавиши" определённое действие
  OnKeyDown := k -> 
    case k of
      Key.Up:
      begin
        
        if (a<5) then
        begin
         roketka1.MoveOn(1,0,0);
         a:=a+1;
        end;
      end;
      Key.Down:
      begin
        if (a>-5) then
        begin
         roketka1.MoveOn(-1,0,0);
         a:=a-1;
        end;
      end;
      Key.w:
      begin
       if (roketka2.X < 5)then
        roketka2.MoveOn(1,0,0);
      end;
      Key.s:
      begin
        if (roketka2.X > -5)then
          roketka2.MoveOn(-1,0,0);
      end;
    end;

  
  duration := 10;
  vx := 0.08;
  vy := 0.06;

  t1 := new Timer(duration, pusk);
  t1.Start;
  t2 := new Timer(300, lol);
  t2.Start;
  
end.