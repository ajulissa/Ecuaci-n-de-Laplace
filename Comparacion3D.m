function Comparacion3D(handles,m,n)
    h=0.5; 
    a=(m+1)*h;
    b=(n+1)*h;
    %matriz V
    A=zeros(n*m);
    D=diag(4*ones(1,m))+diag(-1*ones(1,m-1),1)+diag(-1*ones(1,m-1),-1);
    E=diag(-1*ones(1,m));
    for i=0:n-1
        A(1+i*m:(i+1)*m,1+i*m:(i+1)*m)=D;
    end
    for i=1:n-1
        A(1+i*m:(i+1)*m,1+(i-1)*m:m*i)=E;
        A(1+(i-1)*m:i*m,1+i*m:(i+1)*m)=E;
    end
    %condiciones de contorno
    VS=ones(1,m); %abajo
    VN=ones(1,m); %arriba
    VE=-ones(1,n); %derecha
    VO=-ones(1,n); %izquierda
    f=@(i,j) i+(j-1)*m;
    %Vector términos
    B=zeros(n*m,1);
    %puntos rojos
    B(f(1,1))=VO(1)+VS(1);
    B(f(m,1))=VS(m)+VE(1);
    B(f(1,n))=VN(1)+VO(n);
    B(f(m,n))=VN(m)+VE(n);
    %puntos azules
    for k=2:m-1
        B(f(k,1))=VS(k);
        B(f(k,n))=VN(k);
    end
    for k=2:n-1
        B(f(1,k))=VO(k);
        B(f(m,k))=VE(k);
    end
    X=A\B;
    N=100;
    g=@(x,y) laplace_potencial_4(x,y, N, a,b);
    hold on
    R=zeros(n,m);
    for j=1:n
        for i=1:m
            k=f(i,j);
            R(n+1-j,i)=X(k);
            z=g(i*h,j*h);
            plot3(handles.axes1,i*h,j*h,z,'o','markersize',3,'markeredgecolor','b','markerfacecolor','b')
            plot3(handles.axes1,i*h,j*h,X(k),'o','markersize',3,'markeredgecolor','r','markerfacecolor','r')
        end
    end
    %comparación con la solución analítica
    [x,y] = meshgrid(0:0.1:a, 0:0.1:b);
    z=laplace_potencial_4(x,y, N, a, b);
    mesh(handles.axes1,x,y,z)
    hold off
    xlabel('x')
    ylabel('y')
    zlabel('V(x,y)')
    title('Potencial')
    view(47,32)
end
