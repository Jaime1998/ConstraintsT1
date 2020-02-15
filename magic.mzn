include "count.mzn";

int: n;
array[0..n-1] of var 0..n-1: magic;


% Restringe magic[k] a que tenga k ocurrencias en el arreglo magic
constraint forall(i in 0..n-1)(
  count(magic, i, magic[i]));

% Redundancia
constraint n=(sum(i in 0..n-1) (magic[i]));
constraint n=(sum(i in 0..n-1) (i*magic[i]));

solve satisfy;