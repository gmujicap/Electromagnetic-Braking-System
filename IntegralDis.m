% formula integral discretizada

N = input("Ingresa cantidad de divisiones: ");
a = input("Ingresa límite inferior: ");
b = input("Ingresa límite superior: ");
suma = 0;
dx = ((b-a)/N);

f = @(x) sin(x);

for x = a:dx:b
    suma = suma + f(x) * dx;
end

disp(suma)