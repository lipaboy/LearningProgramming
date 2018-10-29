uses Graph3D;

// константы (инварианты или неизменяемые переменные)
const 
DLINA_ROKETKA = 3;
BALL_RADIUS = 0.5;

// переменные
var roketka1, roketka2 : BoxT;
var ball : SphereT;

begin

  // Создаём объекты сцены
  // Первая рокетка:
  //              координаты-длина рокетки--ширина-высота-цвет
  roketka1 := Box(0,-5, 0.5, DLINA_ROKETKA, 1,     1,     Colors.Orange);
  roketka2 := Box(0, 5, 0.5, DLINA_ROKETKA, 1,     1,     Colors.Green);
  ball :=  Sphere(0, 0, 0.5, BALL_RADIUS,                 Materials.Rainbow);
  
  // Присваиваем событию "Нажатие клавиши" определённое действие
  OnKeyDown := k -> 
    case k of
      Key.Left:
        if (roketka1.X < 5) then
          roketka1.MoveOn(1,0,0);
      Key.Right: 
        if (roketka1.X > -5) then
          roketka1.MoveOn(-1,0,0);
      Key.A: 
        if (roketka2.X < 5) then
          roketka2.MoveOn(1,0,0);
      Key.D: 
        if (roketka2.X > -5) then
          roketka2.MoveOn(-1,0,0);
    end;
  
end.