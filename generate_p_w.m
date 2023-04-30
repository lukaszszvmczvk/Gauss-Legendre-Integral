function [C,X,Y] = generate_p_w(n,m)
% Projekt 2, zadanie 07
% Łukasz Szymczyk, 320744
%
% Funkcja generuje macierz wag złożonej 3-punktowej kwadratury 
% Gaussa-Legendre'a na obszarze [-1,1], a także wektory węzłów na
% przedziale [-1,1] ze względu na obie zmienne.
% Wejście:
%   n     - liczba podziałów przedziału [-1,1], stosowana w złożonej 
%           kwadraturze po pierwszej zmiennej
%   m     - liczba podziałów przedziału [-1,1], stosowana w złożonej 
%           kwadraturze po drugiej zmiennej
% Wyjście:
%   C     - macierz rozmiaru [3*m x 3*n] zawierająca wagi złożonej 
%           kwadratury na obszarze [-1,1]x[-1,1]
%   X     - wektor rozmiaru [1 x 3*n] zawierający węzły złożonej
%           kwadratury na przedziale [-1,1]
%   Y     - wektor rozmiaru [3*m x 1] zawierający węzły złożonej
%           kwadratury na przedziale [-1,1]

% Węzły i współczynniki 3-punktowej kwadratury Gaussa-Legendre'a
W = [5/9 8/9 5/9];
P = [-sqrt(3/5) 0 sqrt(3/5)];

% Tworzenie macierzy współczynników 
A = repmat(W,1,n)';
B = repmat(W,1,m)';
C = B*A';

% Przeskalowanie węzłów do długości przedziału całkowania 
p1 = P/n;
p2 = P/m;

% Wyznaczenie węzłów względem pierwszej zmiennej
Z = linspace(-1,1,n+1);
X = zeros(1,3*n);
for i = 1:n
    X(3*(i-1)+1:3*i) = (Z(i)+Z(i+1))/2 + p1; 
end

% Wyznaczenie węzłów względem drugiej zmiennej
Z = linspace(-1,1,m+1);
Y = zeros(3*m,1);
for i = 1:m
    Y(3*(i-1)+1:3*i) = (Z(i)+Z(i+1))/2 + p2; 
end

end % function

