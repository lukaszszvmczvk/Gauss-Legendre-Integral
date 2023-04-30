clearvars;

N = 60;
x1 = P2Z07_LSZ_integral(@(x,y) x.^8,1,1);
x2 = P2Z07_LSZ_integral(@(x,y) x.^8,100,1);
wynik = 2/45;
blad1 = abs(wynik - x1);
blad2 = abs(wynik - x2);