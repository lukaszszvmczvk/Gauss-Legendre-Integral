function [] = test_num_3()

fprintf("Test sprawdza jak zmienia się bląd kwadratury, gdy zwiększana" + ...
    "\njest liczba podziałów przedziału ze względu na obie zmienne,\n" + ...
    "dla funkcji f(x,y) = |x|, czyli takiej która nie ma ciągłej " + ...
    "pochodnej.\n\n")
pause;
N = 1;

n = [1;2;4;8];
M = length(n);

f{1} = @(x,y) abs(x);

sol{1} = 2/3;

sol_str{1} = "2/3";

Fun{1} = "f(x,y) = |x|";

err = zeros(M,1);
ratio = zeros(M-1,1);

for i = 1:N
    for j = 1:M
        x = P2Z07_LSZ_integral(f{i},n(j),n(j));
        err(j) = abs(sol{i} - x);
        if (j>1)
            ratio(j-1) = err(1)/err(j);
        end
    end
    fprintf("Całka nr %d\n",i);
    fprintf("Funkcja podcałkowa: %s\n",Fun{i});
    fprintf("Rozwiązanie analityczne: %s\n",sol_str{i});
    tab = table;
    tab.n_x = n;
    tab.n_y = n;
    tab.blad = err;
    disp(tab);
   fprintf("Zwiększając liczbę podprzedziałów 2-krotnie błąd zmalał %2.4f" + ...
        "-krotnie\n",ratio(1));
    fprintf("Zwiększając liczbę podprzedziałów 4-krotnie błąd zmalał %2.4f" + ...
        "-krotnie\n",ratio(2));
    fprintf("Zwiększając liczbę podprzedziałów 8-krotnie błąd zmalał %2.4f" + ...
        "-krotnie\n",ratio(3));
    pause;
end

