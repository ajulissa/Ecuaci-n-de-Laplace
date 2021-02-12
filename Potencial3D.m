function Potencial3D(handles,m,n)
    h=0.5; 
    a=(m+1)*h;
    b=(n+1)*h;
    ...
    [x,y] = meshgrid(0:0.1:a, 0:0.1:b);
    N=100;
    z=laplace_potencial_4(x,y, N, a, b);
    mesh(handles.axes2,x,y,z)
    xlabel('x')
    ylabel('y')
    zlabel('V(x,y)')
    title('Potencial')
end