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

var 1..3: veintiCuatro;
var 1..3: veintiCinco;
var 1..3: veintiSeis;

constraint alldifferent ([Garcia, Lopez, Gonzalez]);
constraint alldifferent ([jazz, pop, clasica]);
constraint alldifferent ([veintiCuatro, veintiCinco, veintiSeis]);

%Gonzales le gusta la musica clasica
constraint Gonzalez = clasica;

%Juan es más viejo que gonzalez
constraint Juan != Gonzalez;
constraint ((Juan = veintiCinco /\ Gonzalez = veintiCuatro) \/ 
            (Juan = veintiSeis /\ (Gonzalez = veintiCinco \/ Gonzalez = veintiCuatro)));

%constraint Juan != veintiCuatro;
%constraint Gonzalez != veintiSeis;

constraint pop != Garcia;
constraint pop != veintiCuatro;
constraint Oscar = veintiCinco;
constraint Oscar != Lopez;
constraint Dario != jazz;



