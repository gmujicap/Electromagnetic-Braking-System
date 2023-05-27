function integral = getCampoMagnetico(I,R,N,x,y,z)
    %Declaración de las variables necesarias para el cálculo de la
    %integral. Suma sirve como acumulador. 
    suma = 0;
    a = 0;
    b = 2*pi;
    dx = ((b-a)/N);
    
    %Representación anónima de las diferentes expresiones pertenecientes a
    %la Ley de Biot-Savat. Son el vector de diferencial de segmento, el
    %vector de posición, y la magnitud de la distancia entre ambos, en ese
    %orden. 
    ds = @(T) [-sin(T) cos(T) 0];
    vectorP = @(x,y,z,R,T) [x-R*cos(T) y-R*sin(T) z];
    dist = @(x,y,z,R,T) (((x-R*cos(T))^2) + ((y-R*sin(T))^2) + (z^2))^(1.5);
    
    %La operación del integrando, que realiza un producto cruz y divide el
    %resultado por una magnitud. 
    f = @(T) (cross(ds(T),vectorP(x,y,z,R,T)))/dist(x,y,z,R,T);
    
    %Vector donde se guardarán los valores de las componentes del campo
    %magnético
    alt = [0,0,0];
    
    %Ciclo for que representa una integral discretizada, sumando el valor
    %de cierta cantidad de diferenciales
    for x = a:dx:b
        suma = suma + norm(f(x)) * dx;
        alt =  alt + f(x)*dx;
    end

    constante = ((10^(-7))*I*R);

    %Resultado final, un vector con las componentes del campo magnético
    integral = alt*constante;
end