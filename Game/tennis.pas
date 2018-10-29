uses Graph3D;

// константы (инварианты или неизменяемые переменные)
const 
DLINA_ROKETKA = 3;
BALL_RADIUS = 0.5;

// переменные
var roketka1, roketka2 : BoxT;
var ball : SphereT;

begin

  roketka1 := Box(0,-5,0.5, DLINA_ROKETKA,1,1,Colors.Orange);
  roketka2 := Box(0, 5,0.5, DLINA_ROKETKA,1,1,Colors.Green);
  ball := Sphere(0, 0, 0.5, BALL_RADIUS, Materials.Rainbow);
  
end.