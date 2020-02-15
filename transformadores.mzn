% Lectura del archivo
enum Transformadores;
array[Transformadores] of int: Precios;

enum Recursos;
array[Recursos] of int: Capacidad;
array[Transformadores, Recursos] of int: Costo;

% Variables
array[Transformadores] of var int: construccion;
array[Recursos] of var int: uso;

constraint forall(i in Transformadores)(
  construccion[i]>=0);


% El uso de un recurso es la suma de todas las construcciones
% que se han hecho de un transformador multiplicado por el 
% recurso requerido para construir dicho transformador
constraint forall(i in Recursos)(
  uso[i] = sum(j in Transformadores) (Costo[j,i]*construccion[j]));
  
constraint forall(i in Recursos)(
  uso[i] <= Capacidad[i]);

% Funcion objetivo
var int: f = sum(i in Transformadores) (Precios[i]*construccion[i]);

solve maximize f;

output [ "\(i) = \(construccion[i]); \n" | i in Transformadores] ++
       [ "\(j) = \(uso[j]); \n" | j in Recursos] ++
       [ "Utilidad = \(f)"];


