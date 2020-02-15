include "alldifferent.mzn";

int: S;
int: sizeSquare = S * S;
int: digs = ceil(log(10.0,int2float(sizeSquare))); % Para el output

array[1..sizeSquare,1..sizeSquare] of 0..sizeSquare: start;
array[1..sizeSquare,1..sizeSquare] of var 1..sizeSquare: result;

% El resultado debe tener los valores de la matriz inicial
constraint forall (i, j in 1..sizeSquare)(
  if start[i,j] > 0 then result[i,j] = start[i,j] else true endif);

% Por cada fila, cada elemento debe ser diferente
constraint forall (i in 1..sizeSquare)(
  alldifferent (j in 1..sizeSquare) (result[i,j]));

% Por cada colomna, cada elemento debe ser diferente
constraint forall (j in 1..sizeSquare)(
  alldifferent (i in 1..sizeSquare) (result[i,j]));

% Por cada subcuadro de la matriz, los elementos deben ser diferentes
constraint forall (I, J in 1..S)(
  alldifferent (i, j in 1..S) (result[(I-1)*S+i, (J-1)*S+j]));

solve satisfy;

output  [show_int(digs,result[i,j]) ++ " " ++ 
         if j == sizeSquare then "\n" else "" endif
         | i,j in 1..sizeSquare] ++ ["\n"];

