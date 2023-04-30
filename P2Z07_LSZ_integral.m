function x = P2Z07_LSZ_integral(f,n,m)
% Projekt 2, zadanie 07
% Łukasz Szymczyk, 320744
%
% Funkcja przybliża wartość podwójnej całki, na obszarze
% D = {(x,y) in R^2: |x| + |y| <= 1} przez transformacje na kwadrat
% [-1,1] x [-1,1] i zastosowanie złożonych 3 - punktowych kwadratur 
% Gaussa - Legendre'a ze względu na każdą zmienną. 
% Wejście:
%   f     - uchwyt do funkcji dwóch zmiennych, z której jest liczona
%           całka, funkcja jest przystosowana do operacji wektorowych
%           tzn. operatory *, /, ^ są zastąpione przez .*, ./, >^
%   n     - liczba podziałów przedziału [-1,1], stosowana w złożonej 
%           kwadraturze po pierwszej zmiennej
%   m     - liczba podziałów przedziału [-1,1], stosowana w złożonej 
%           kwadraturze po drugiej zmiennej
% Wyjście:
%   x     - przybliżona wartość całki

% Wygenerowanie węzłów i wag
[C,X,Y] = generate_p_w(n,m);

% Wyznaczenie wartości całki 
suma = f((X+Y)/2, (X-Y)/2);
suma = suma.*C;
suma = sum(suma,"all");
x = suma/n/m/2;

end % function

