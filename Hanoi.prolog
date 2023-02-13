%El 1 se refiere al caso donde nomás quede un disco en la torre X (origen)
%La torre origen es la que tiene el disco
%La torre destino es donde dejas el disco
%El último _ quiere decir que no importa la variable, es decir, solo importa la
%torre origen y la destino, da igual cuál sea la otra (son 3 torres)
move(1,Origen,Destino,_) :-
   write('Move top disk from '), %Se mueve el disco que está hasta arriba de la torre origen
   write(Origen), %Imprimes la torre de la que viene el disco
   write(' to '), %A la torre
   write(Destino), %Destino, donde ahora dejas el disco
   nl. %Esto es para dejar un espacio, es como un "enter"
%Mueve el numero de discos que le des de una torre origen a una destino
move(NumDiscos,Origen,Destino,Restante) :-
%Este solo se ejecuta cuando hay más de 1 disco, sino se ejecuta el de arriba
   NumDiscos>1,
%Solo se puede mover un disco por movimiento, los otros no
   DiscosNoMovibles is NumDiscos-1,
%Recursivamente vuelve invoca el algoritmo, con todos los discos menos el que movió
%y moviendolo del origen a la torre extra
   move(DiscosNoMovibles,Origen,Restante,Destino),
%Mueve el disco que hay, el que dejamos fuera del algoritmo arriba
   move(1,Origen,Destino,_),
%Mueve el disco de la torre extra al destino
   move(DiscosNoMovibles,Restante,Destino,Origen).
:- initialization(main).
%El algoritmo funciona recursivamente, utiliza la torre extra (la de en medio) como un
%lugar temporal para poder mover los discos
main :- move(3, first, last, mid).
