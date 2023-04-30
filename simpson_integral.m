function [x] = simpson_integral(f,n_x,n_y)
% Projekt 2, zadanie 07
% Łukasz Szymczyk, 320744
%
% Funkcja przybliża wartość podwójnej całki, na obszarze
% D = {(x,y) in R^2: |x| + |y| <= 1} przez transformacje na kwadrat
% [-1,1] x [-1,1] i złożonych kwadratur simpsona ze względu na każdą
% zmienną.
% Wejście:
%   f     - uchwyt do funkcji dwóch zmiennych, z której jest liczona
%           całka
%   n_x   - liczba podziałów przedziału [-1,1], stosowana w złożonej 
%           kwadraturze po zmiennej x 
%   n_y   - liczba podziałów przedziału [-1,1], stosowana w złożonej 
%           kwadraturze po zmiennej y 
% Wyjście:
%   x     - przybliżona wartość całki

% Zainicjalizowanie potrzebnych zmiennych
X = zeros(1,2*n_x+1);
Y = zeros(2*n_y+1,1);
A = zeros(2*n_x+1,1);
B = zeros(2*n_y+1,1);

% Wyznaczenie wezlow i wag ze wzgledu na 1 zmienna
z = 1/n_x;
for i = 1:(2*n_x+1)
    X(i) = -1 + (i-1)*z;
    if mod(i,2)==0
        A(i) = 4;
    else 
        A(i) = 2;
    end
end
A(1) = 1;
A(end) = 1;

% Wyznaczenie wezlow i wag ze wzgledu na 2 zmienna
z = 1/n_y;
for i = 1:(2*n_x+1)
    Y(i) = -1 + (i-1)*z;
    if mod(i,2)==0
        B(i) = 4;
    else 
        B(i) = 2;
    end
end
B(1) = 1;
B(end) = 1;

% Wyznacznie siatki wag
H1 = 2/n_x;
H2 = 2/n_y;
H = (H1*H2)/36;
C = H*B*A';

% Przybliżenie wartości całki
suma = f((X+Y)/2,(X-Y)/2);
suma = suma.*C;
suma = sum(suma,'all');
x = suma/2;

end % function

