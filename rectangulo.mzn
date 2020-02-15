int: W;
int: H;
array[int] of 0..H+W: Squares;


int: nSquare = length(Squares);

int: digs = ceil(log(10.0,int2float(nSquare))); % Para el output

array[1..nSquare] of var 1..W: x;
array[1..nSquare] of var 1..H: y;

% Los cuadrados deben ubicarse de tal manera
% que no queden por fuera del rectangulo

constraint forall(i in 1..nSquare)(
  x[i] <= W-Squares[i]+1);

constraint forall(i in 1..nSquare)(
  y[i] <= H-Squares[i]+1);

% Los cuadrados no deben solaparse, debe pasar que la posición
% en la que se encuentre un cuadrado esté antes o después en X
% o en Y de otro cuadrado
constraint forall(i,j in 1..nSquare where i<j)(
  x[i]+Squares[i]<=x[j] \/ x[j]+Squares[j]<=x[i] \/ y[i]+Squares[i]<=y[j] \/ y[j]+Squares[j]<=y[i]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redundancia
% Cada punto a lo largo del eje X debe tener la misma altura en Y,
% debe ser H
constraint forall(point in 1..W)(
    H=sum(i in 1..nSquare)(Squares[i] * (bool2int( (x[i]<=point) /\ x[i]>=point-Squares[i]+1)))
  );

% Cada punto a lo largo del eje Y debe tener el mismo ancho en X,
% debe ser W
constraint forall(point in 1..H)(
    W=sum(i in 1..nSquare)(Squares[i] * (bool2int( (y[i]<=H) /\ y[i]>=H-Squares[i]+1)))
  );

solve satisfy;

output  ["X posiciones: "] ++
        [show_int(digs,x[i]) ++ " "
         | i in 1..nSquare] ++ ["\n"] ++
         
        ["Y posiciones: "] ++
        [show_int(digs,y[i]) ++ " "
         | i in 1..nSquare] ++ ["\n"];


