include "alldifferent.mzn";
array[int] of string: Personas;

int:n=length(Personas);

array[int,1..2] of int: Seguida;
int:nSeguida=length(Seguida) div 2;
array[int,1..2] of int: Separada;
int:nSeparada=length(Separada) div 2;
array[int,1..3] of int: Distancia;
int:nDistancia=length(Distancia) div 3;


array[1..n] of var 1..n: result;

constraint alldifferent(result);

constraint forall(i in 1..nSeguida)(
  result[Seguida[i,1]]=result[Seguida[i,2]]+1);

constraint forall(i in 1..nSeparada)(
  abs(result[Separada[i,1]]-result[Separada[i,2]])>1);

constraint forall(i in 1..nDistancia)(
  abs(result[Distancia[i,1]]-result[Distancia[i,2]])<=Distancia[i,3]);


solve satisfy;


