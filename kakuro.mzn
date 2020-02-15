int: row;
int: column;
int: digs = ceil(log(10.0,int2float(row*column))); % Para el output

array[1..row, 1..column*2] of int: start;
array[1..row, 1..column] of var int: result;


constraint forall (i in 1..row)(forall(j in 1..column)(
      
    )
  )
  



