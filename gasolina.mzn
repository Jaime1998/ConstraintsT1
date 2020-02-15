% Lectura del archivo

enum Ingredientes;
array[Ingredientes] of float: Precios;

enum Caracteristicas;
array[Ingredientes, Caracteristicas] of float: CarIngredientes;
array[Caracteristicas, 1..2] of float: RequisitosGasolina;
int: nDesigualdades = length(RequisitosGasolina) div 2;

% Variables
array[Ingredientes] of var float: cantidades;

constraint forall(i in Ingredientes)(
  cantidades[i]>=0);

constraint forall(i in Caracteristicas where RequisitosGasolina[i, 1]>0)(
  RequisitosGasolina[i,2]<=sum(j in Ingredientes) (cantidades[j]*CarIngredientes[j,i]));
