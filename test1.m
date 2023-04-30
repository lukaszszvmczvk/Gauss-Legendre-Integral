function [] = test1()

fprintf("Test zestawia wartość całki wyznacznonej za pomocą złożonej" + ...
    "\nkwadratury Gaussa-Legendre'a (3-punktowej) na obszarze\n" + ...
    "D = {(x,y) in R^2: |x| + |y| <= 1} z " + ...
    "rozwiązaniem\nanalitycznym tej całki. Przedstawiony jest również błąd" + ...
    "\nbezwzględny tego rozwiąznia.\n\n")
pause;
N = 9;

f{1} = @(x,y) 1;
f{2} = @(x,y) x+y;
f{3} = @(x,y) cos(x+y).*(sin(x)).^2;
f{4} = @(x,y) exp(x-y);
f{5} = @(x,y) 3*x.^4.*y.^2 + 2*x.*y;
f{6} = @(x,y) sqrt(exp(x+y));
f{7} = @(x,y) x.^3 + y.^2 + x.*y;
f{8} = @(x,y) cos(x).*exp(y);
f{9} = @(x,y) log(x+y+3);

sol{1} = 2;
sol{2} = 0;
sol{3} = (1/8)*(4*sin(1) - cos(1) + cos(3));
sol{4} = exp(1) - 1/exp(1);
sol{5} = 1/70;
sol{6} = 2*(exp(1)-1)/sqrt(exp(1));
sol{7} = 1/3;
sol{8} = 2*cosh(1) - 2*cos(1);
sol{9} = log(64)-2;

sol_str{1} = "2";
sol_str{2} = "0";
sol_str{3} = "(1/8)*(4*sin(1) - cos(1) + cos(3))";
sol_str{4} = "exp(1) - 1/exp(1)";
sol_str{5} = "1/70";
sol_str{6} = "2*(exp(1)-1)/sqrt(exp(1))";
sol_str{7} = "1/3";
sol_str{8} = "2*cosh(1) - 2*cos(1)";
sol_str{9} = "log(64)-2";

Fun{1} = "f(x,y) = 1";
Fun{2} = "f(x,y) = x + y";
Fun{3} = "f(x,y) = cos(x+y)*(sin(x))^2";
Fun{4} = "f(x,y) =  exp(x-y)";
Fun{5} = "f(x,y) = 3*x^4*y^2 + 2*x*y";
Fun{6} = "f(x,y) = sqrt(exp(x+y))";
Fun{7} = "f(x,y) = x^3 + y^2 + xy";
Fun{8} = "f(x,y) = cos(x)*exp(y)";
Fun{9} = "f(x,y) = log(x+y+3)";

n{1} = [5,5];
n{2} = [2,2];
n{3} = [25,21];
n{4} = [100,100];
n{5} = [75,25];
n{6} = [10,10];
n{7} = [1,1];
n{8} = [10,15];
n{9} = [2,3];

for i = 1:N
    x = P2Z07_LSZ_integral(f{i},n{i}(1),n{i}(2));
    fprintf("Całka nr %d\n",i);
    fprintf("Funkcja podcałkowa: %s\n",Fun{i});
    fprintf("Liczba podziałów ze względu na 1 zmienną: %d\n",n{i}(1));
    fprintf("Liczba podziałów ze względu na 2 zmienną: %d\n",n{i}(2));
    fprintf("Rozwiązanie analityczne: %s\n",sol_str{i});
    fprintf("Przybliżone rozwiązanie: %d\n",x);
    fprintf("Błąd bezwzględny: %d\n\n", abs(x-sol{i}));
    pause;
end

end

