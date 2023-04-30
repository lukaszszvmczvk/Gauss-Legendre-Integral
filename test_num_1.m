function [] = test_num_1()
fprintf("Test sprawdza jak zmienia się błąd bezwględny kwadratury, gdy\n" + ...
    "zwiększana jest liczba podziałów przedziału ze względu na tylko jedną" + ...
    "\nzmienną. Liczba podziałów względem pierwszej zmiennej jest " + ...
    "ustalona na 4" + ...
    "\nnatomiast ze względu na drugą zmienną testowane liczby podziałów" + ...
    "\nto: 4, 8, 16. Badanie tej zależności jest przeprowadzone na 5 " + ...
    "funkcjach,\nktóre były badane w teście 3.\n\n")
pause;

M = 5;
N = 3;
n1 = [4; 4; 4];
n2 = [4; 8; 16];

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

error1 = zeros(3,1);

for i = 1:M
    fprintf("Całka nr %d\n",i);
    fprintf("Funkcja podcałkowa: %s\n",Fun{i});
    fprintf("Rozwiązanie analityczne: %s\n",sol_str{i});
    for j = 1:N
        x = P2Z07_LSZ_integral(f{i},n1(j),n2(j));
        error1(j) = abs(x-sol{i});
    end
    tab = table;
    tab.n = n1;
    tab.m = n2;
    tab.blad = error1;
    disp(tab); 
    pause;
end

end

