function [] = test3()

fprintf("Test przedstawia zależność błędu kwadatury od liczby podziałów" + ...
    "\nprzedziału [-1,1] ze względu na obie zmienne. Ponadto ukazany jest" + ...
    "\nstosunek tych błędów co obrazuje w jakim tempie się one " + ...
    "zmniejszają.\nZwiększając liczbe podziałów n-krotnie błąd powinien " + ...
    "zmaleć n^6-krotnie.\n" + ...
    "Badane są następujące liczby podziałów [-1,1] ze względu na obie" + ...
    "\nzmienne: N = 4, 8, 16.\n\n")
pause;

M = 5;
N = [4; 8; 16];

f{1} = @(x,y) cos(x+y).*(sin(x)).^2;
f{2} = @(x,y) y.^2.*cos(x) + x.^2.*sin(y);
f{3} = @(x,y) sqrt(x + y + 4);
f{4} = @(x,y) x.^2.*y.^4;
f{5} = @(x,y) exp(x+y);

sol{1} = (1/8)*(4*sin(1) - cos(1) + cos(3));
sol{2} = 8*cos(1) - 4;
sol{3} = (10/3)*sqrt(5) - 2*sqrt(3);
sol{4} = 1/210;
sol{5} = exp(1) - 1/exp(1);

sol_str{1} = "(1/8)*(4*sin(1) - cos(1) + cos(3))";
sol_str{2} = "8*cos(1) - 4";
sol_str{3} = "(10/3)*sqrt(5) - 2*sqrt(3)";
sol_str{4} = "1/210";
sol_str{5} = "exp(1) - 1/exp(1)";

Fun{1} = "f(x,y) = cos(x+y)*(sin(x))^2";
Fun{2} = "f(x,y) = y^2*cos(x) + x^2*sin(y)";
Fun{3} = "f(x,y) = sqrt(x + y + 4)";
Fun{4} = "f(x,y) = x^2*y^4";
Fun{5} = "f(x,y) = exp(x+y)";

x = zeros(3,1);
ratio = zeros(2,1);
for i = 1:M
    x(1) = P2Z07_LSZ_integral(f{i},N(1),N(1));
    x(2) = P2Z07_LSZ_integral(f{i},N(2),N(2));
    x(3) = P2Z07_LSZ_integral(f{i},N(3),N(3));
    error = abs(x-sol{i});
    ratio(1) = error(1)/error(2);
    ratio(2) = error(1)/error(3);
    fprintf("Całka nr %d\n",i);
    fprintf("Funkcja podcałkowa: %s\n",Fun{i});
    fprintf("Rozwiązanie analityczne: %s\n",sol_str{i});
    tab = table;
    tab.n = N;
    tab.m = N;
    tab.blad = error;
    disp(tab);
    fprintf("Zwiększając liczbę podprzedziałów 2-krotnie błąd zmalał %2.4f" + ...
        "-krotnie\n",ratio(1));
    fprintf("Zwiększając liczbę podprzedziałów 4-krotnie błąd zmalał %4.4f" + ...
        "-krotnie\n\n",ratio(2));
    pause;
end

end

