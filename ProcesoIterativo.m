function ProcesoIterativo(handles,m,n)
    
    %Matriz V0: 
    V0=zeros(n,m);
    %condiciones de contorno:
    for i=2:n-1 %izquierda/derecha
        V0(i,1)=-1;
        V0(i,m)=-1;
    end
    for j=2:m-1 %arriba/abajo
        V0(1,j)=1;
        V0(n,j)=1;
    end

    %las cuatro esquinas
     V0(1,1)=(V0(1,2)+V0(2,1))/2;  %izquierda inferior
     V0(n,1)=(V0(n-1,1)+V0(n,2))/2;  %derecha inferior
     V0(1,m)=(V0(1,m-1)+V0(2,m))/2;  %izquierda superior
     V0(n,m)=(V0(n-1,m)+V0(n,m-1))/2;  %derecha superior

    V=V0;
    N=100; %máximo número de iteracciones
    for k=1:N
        contador=0;
        for i=2:n-1
            for j=2:m-1
                V(i,j)=(V0(i+1,j)+V0(i-1,j)+V0(i,j-1)+V0(i,j+1))/4;
                error=abs((V(i,j)-V0(i,j))/V(i,j));
                if error<0.0001
                    contador=contador+1;
                end
            end
        end
        if contador==(n-2)*(m-2) %termina el proceso iterativo
            break;
         end
        V0=V;
    end


    if k==N
        set(handles.edit3,"String","Se ha superado el máximo número de iteraciones");
    else
        set(handles.edit3,"String",num2str(V(2:n-1,2:m-1))) %puntos interiores
    end
end