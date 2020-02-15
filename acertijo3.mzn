include "alldifferent.mzn";

int: Juan = 1;
int: Oscar = 2;
int: Dario = 3;

var 1..3: Gonzalez;
var 1..3: Garcia;
var 1..3: Lopez;

var 1..3: pop;
var 1..3: jazz;
var 1..3: clasica;

array[1..3] of var 24..26: edades;
%var 24..26: edadJuan;
%var 24..26: edadOscar;
%var 24..26: edadDario;

constraint alldifferent ([Garcia, Lopez, Gonzalez]);
constraint alldifferent ([jazz, pop, clasica]);
%constraint alldifferent ([veintiCuatro, veintiCinco, veintiSeis]);

%Gonzales le gusta la musica clasica
constraint Gonzalez = clasica;

%Juan es más viejo que gonzalez
constraint Juan != Gonzalez;
constraint ((edades[Juan] = 25 /\ edades[Gonzalez] = 24) \/ 
            (edades[Juan] = 26 /\ (edades[Gonzalez] = 25 \/ edades[Gonzalez] = 24)));

%constraint Juan != veintiCuatro;
%constraint Gonzalez != veintiSeis;

constraint pop != Garcia;

constraint (Juan=pop -> edades[Juan]!=24) \/ (Oscar=pop -> edades[Oscar]!=24) \/ (Dario=pop -> edades[Dario]!=24);


constraint edades[Oscar] = 25;
constraint Oscar != Lopez;
constraint Dario != jazz;



