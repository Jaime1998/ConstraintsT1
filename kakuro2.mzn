include "alldifferent.mzn";

int: row;
int: column;

array[int, 1..4] of int: horizontal;
int: nHorizontal = length(horizontal) div 4;

array[int, 1..4] of int: vertical;
int: nVertical= length(vertical) div 4;

% Variables
array[1..row, 1..column] of var 1..100: result;

constraint forall(i in 1..nHorizontal)(
  alldifferent([result[horizontal[i,2], j] | j in horizontal[i, 3]..horizontal[i,4]]));

constraint forall(i in 1..nHorizontal)(
  horizontal[i, 1] = sum(j in horizontal[i, 3]..horizontal[i, 4]) (result[horizontal[i, 2], j]));

constraint forall(i in 1..nVertical)(
  alldifferent([result[j, vertical[i,2]] | j in vertical[i, 3]..vertical[i,4]]));

constraint forall(i in 1..nVertical)(
  vertical[i, 1] = sum(j in vertical[i, 3]..vertical[i, 4]) (result[j, vertical[i, 2]]));


  
