function [] = test_num_2()

fprintf("Test porównuje błąd bezwzględny złożonej 3-punktowej kwadratury\n" + ...
    "Gaussa-Legendre'a z błędem złożonej kwadratury Simpsona. Test " + ...
    "prezentuje\nzestawienie tych błędów dla 5 różnych funkcji i różnej " + ...
    "liczby\npodziałów przedziału ze względnu na obie zmienne. Dla wielomianów" + ...
    "\nstopnia <4 obie metody powinny być dokładne.\n\n")
pause;

N = 5;
n = [1;2;4;8;16;32;64];
M = length(n);

f{1} = @(x,y) 4*x.^3;
f{2} = @(x,y) 2*x.^4 + x.^2.*y.^2;
f{3} = @(x,y) sqrt(exp(x+y));
f{4} = @(x,y) (sin(x)).^2.*cos(y);
f{5} = @(x,y) exp(x-y);

sol{1} = 0;
sol{2} = 13/45;
sol{3} = 2*(exp(1)-1)/sqrt(exp(1));
sol{4} = (16/3)*(sin(1/2))^4;
sol{5} = exp(1) - 1/exp(1);

sol_str{1} = "0";
sol_str{2} = "13/45";
sol_str{3} = "2*(exp(1)-1)/sqrt(exp(1))";
sol_str{4} = "(16/3)*(sin(1/2))^4";
sol_str{5} = "exp(1) - 1/exp(1)";

Fun{1} = "f(x,y) = 4*x^3";
Fun{2} = "f(x,y) = 2*x^4 + x^2*y^2";
Fun{3} = "f(x,y) = sqrt(exp(x+y))";
Fun{4} = "f(x,y) = cos(y)*(sin(x))^2";
Fun{5} = "f(x,y) = exp(x-y)";

err_gauss = zeros(M,1);
err_simp = zeros(M,1);
for i = 1:N
    for j = 1:M
        x1 = P2Z07_LSZ_integral(f{i},n(j),n(j));
        x2 = simpson_integral(f{i},n(j),n(j));
        err_gauss(j) = abs(sol{i} - x1);
        err_simp(j) = abs(sol{i} - x2);
    end
    fprintf("Całka nr %d\n",i);
    fprintf("Funkcja podcałkowa: %s\n",Fun{i});
    fprintf("Rozwiązanie analityczne: %s\n",sol_str{i});
    tab = table;
    tab.n = n;
    tab.m = n;
    tab.blad_simp = err_simp;
    tab.blad_gauss = err_gauss;
    disp(tab);
    pause;
end

end % function

