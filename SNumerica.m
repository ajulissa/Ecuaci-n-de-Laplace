function SNumerica(handles,m,n)
    
    %Matriz A de dimensión n por m:
    A=zeros(n*m);
    %Matriz D:
    D=diag(4*ones(1,m))+diag(-1*ones(1,m-1),1)+diag(-1*ones(1,m-1),-1);
    %Mtariz E:
    E=diag(-1*ones(1,m));
    %Rellenando la matriz A:
    for i=0:n-1
        A(1+i*m:(i+1)*m,1+i*m:(i+1)*m)=D;
    end
    for i=1:n-1
        A(1+i*m:(i+1)*m,1+(i-1)*m:m*i)=E;
        A(1+(i-1)*m:i*m,1+i*m:(i+1)*m)=E;
    end

    f=@(i,j) i+(j-1)*m;
    %condiciones de contorno
    VS=ones(1,m); %abajo
    VN=ones(1,m); %arriba
    VE=-ones(1,n); %derecha
    VO=-ones(1,n); %izquierda
    %Vector términos independientes
    B=zeros(n*m,1);
    %puntos rojos
    B(f(1,1))=VO(1)+VS(1);
    B(f(m,1))=VS(m)+VE(1);
    B(f(1,n))=VN(1)+VO(n);
    B(f(m,n))=VN(m)+VE(n);
    %puntos verdes
    for k=2:m-1
        B(f(k,1))=VS(k);
        B(f(k,n))=VN(k);
    end
    for k=2:n-1
        B(f(1,k))=VO(k);
        B(f(m,k))=VE(k);
    end

    %Despejando el vector X:
    X=A\B;
    %R = X convertido a una matriz de m por n
    R=zeros(n,m);
    for j=1:n
        for i=1:m
            k=f(i,j);
            R(n+1-j,i)=X(k);
        end
    end
    
    set(handles.edit3,"String",num2str(R));
end
