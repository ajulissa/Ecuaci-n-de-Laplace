function z = laplace_potencial_4(x,y, N, a, b)
    
    z=0;
    for n=0:N
        z1=(sinh((2*n+1)*pi*(a-x)/b)+sinh((2*n+1)*pi*x/b)).*sin((2*n+1)*pi*y/b)/sinh((2*n+1)*pi*a/b);
        z2=(sinh((2*n+1)*pi*(b-y)/a)+sinh((2*n+1)*pi*y/a)).*sin((2*n+1)*pi*x/a)/sinh((2*n+1)*pi*b/a);
        z=z+(z2-z1)*4/((2*n+1)*pi);
    end
    
end
