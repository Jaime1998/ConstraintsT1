include "alldifferent.mzn";

enum amigos = {Juan, Oscar, Dario};
enum apellidos = {Gonzalez, Garcia, Lopez};
enum generos = {clasica, pop, jazz};

array[amigos] of var 24..26: edad;
array[amigos] of var apellidos: apellido;
array[amigos] of var generos: musica;

%1
constraint edad[Juan] < edad[[i | i in amigos where apellidos[i]=Gonzalez][1]];





