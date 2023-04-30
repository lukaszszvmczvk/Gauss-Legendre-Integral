function [] = test2()

fprintf("Test przedstawia wartość błędu bezwzględnego dla całki, której\n" + ...
    "funkcją podcałkową jest wielomian. Dla wielomianów stopnia <6 " + ...
    "złożona\nkwadratura Gaussa-Legendre'a (3-punktowa) powinna być " + ...
    "dokładna.\n\n")
pause;
N = 8;
n = [1;10;100];

f{1} = @(x,y) 1;
f{2} = @(x,y) x;
f{3} = @(x,y) y.^2;
f{4} = @(x,y) x.^2.*y + x.*y;
f{5} = @(x,y) x.^2.*y.^2 + x + y;
f{6} = @(x,y) x.^5 + 4*x.^2.*y.^2 + x.*y;
f{7} = @(x,y) 2*x.^2.*y.^4 + 3*x.*y.^2;
f{8} = @(x,y) x.^7 + x.^2.*y.^4;

sol{1} = 2;
sol{2} = 0;
sol{3} = 1/3;
sol{4} = 0;
sol{5} = 1/45;
sol{6} = 4/45;
sol{7} = 1/105;
sol{8} = 1/210;

sol_str{1} = "2";
sol_str{2} = "0";
sol_str{3} = "1/3";
sol_str{4} = "0";
sol_str{5} = "1/45";
sol_str{6} = "4/45";
sol_str{7} = "1/105";
sol_str{8} = "1/210";

Fun{1} = "f(x,y) = 1";
Fun{2} = "f(x,y) = x";
Fun{3} = "f(x,y) = y^2";
Fun{4} = "f(x,y) = x^2*y + x*y";
Fun{5} = "f(x,y) = x^2.*y^2 + x + y";
Fun{6} = "f(x,y) = x^5 + 4*x^2*y^2 + x*y";
Fun{7} = "f(x,y) = 2*x^2*y^4 + 3*x*y^2";
Fun{8} = "f(x,y) = x^7 + x^2*y^4";

for i = 1:N
    x = zeros(3,1);
    x(1) = P2Z07_LSZ_integral(f{i},n(1),n(1));
    x(2) = P2Z07_LSZ_integral(f{i},n(2),n(2));
    x(3) = P2Z07_LSZ_integral(f{i},n(3),n(3));
    error = abs(x - sol{i});

    fprintf("Wielomian stopnia: %d\n",i-1);
    fprintf("Funkcja podcałkowa: %s\n",Fun{i});
    fprintf("Rozwiązanie analityczne: %s\n",sol_str{i});
    tab = table;
    tab.n = n;
    tab.m = n;
    tab.blad = error;
    disp(tab);
    pause;
end

end

