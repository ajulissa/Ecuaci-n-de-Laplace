function Comparacion2D(handles,m,n)
    h=0.5; 
    a=(m+1)*h;
    b=(n+1)*h;
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
    %puntos verdes
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
    %figure
    %subplot(handles.axes3,2,1,1)
    gy=@(y) g(2*h,y);
    hold on
    fplot(handles.axes3,gy,[0,b])
    i=2;
    for j=1:n
        k=f(i,j);
        line(handles.axes3,[j*h,j*h],[0,X(k)], 'color','r')
        plot(handles.axes3,j*h,X(k),'o','markersize',3,'markeredgecolor','r','markerfacecolor','r')
    end
    hold off
    grid on
    xlabel('y')
    ylabel('V(2h,y)')
    title('Comparación')
    %subplot(handles.axes3,2,1,2)
    gx=@(x) g(x,2*h);
    hold on
    fplot(handles.axes4,gx,[0,a])
    j=2;
    for i=1:m
        k=f(i,j);
        line(handles.axes4,[i*h,i*h],[0,X(k)], 'color','r')
        plot(handles.axes4,i*h,X(k),'o','markersize',3,'markeredgecolor','r','markerfacecolor','r')
    end
    hold off
    grid on
    xlabel('x')
    ylabel('V(x,2h)')
    title('Comparación')
end