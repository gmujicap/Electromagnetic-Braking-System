function campo = visualizeCampo(Ny, Nz, ymin, ymax, zmin, zmax, I, R, N, x, y, z)
    %Vectores creados para marcar los límites de la gráfica
    zv = linspace(zmin, zmax, Nz);
    yv = linspace(ymin, ymax, Ny);

    % creación de malla
    [Y, Z] = meshgrid(zv, yv); 

    %Matrices donde se almacenarán los valores de las componentes
    % de campo magnetico
    Bz = zeros(25,25);
    By = zeros(25,25);

    %Ciclo for que recorre las matrices, calculando el vector del campo
    %magnético para cada coordenada y lo almacena en los lugares
    %correspondientes de las matrices ya iniciadas
    for i = 1:size(Y)
        for j = 1:size(Z)
            B0 = getCampoMagnetico(I,R,N,0,Y(i,j),Z(i,j));
            Bz(i,j) = B0(3);
            By(i,j) = B0(2);
        end
    end

    %Se calcula la magnitud del vector, y se dividen los vectores del campo
    %magnético por su magnitud para obtener vectores unitarios
    magz = sqrt((Bz.^2)+(By.^2));
    U = Bz./magz;
    V = By./magz;

    %Se grafican los vectores unitarios obtenidos, así como una figura para
    %representar el anillo
    quiver(Y,Z,V,U)
    rectangle('Position', [-R/2 0 R 1], 'Curvature', [1 1], 'Facecolor', ...
    [1 0 0]);
end
