function Rejilla_PIterativo(handles,m,n)
    hold on
    xhnegro = [2:1:m+1];
    yhnegro = ones(1,m);
    xvnegro = ones(1,n);
    yvnegro = [2:1:n+1];
    xrojo = [1, 1, m+2, m+2];
    yrojo = [1, n+2, 1, n+2];
    xazul = [];
    yazul = [];
    x2 = [2:1:m+1];
    y2 = zeros(1,m);
    for i=2:n+1
        xazul = [xazul, x2];
        yazul = [yazul, y2+i];
    end
    
    grid on
    ax = gca % Get handle to current axes.
    ax.XColor = 'black'; % Red
    ax.YColor = 'black'; % Blue
    ax.GridAlpha = 1;  % Make grid lines less transparent.
    ax.GridColor = [0, 0, 0]; % Dark Green.
    
    xlabel('Ancho de recinto: m')
    ylabel('Alto de recinto: n')
    xticks(1:1:m+2)
    yticks(1:1:n+2)
    
    scatter(handles.axes1,xhnegro,yhnegro,'filled','black')
    scatter(handles.axes1,xhnegro,yhnegro+n+1,'filled','black')
    scatter(handles.axes1,xvnegro,yvnegro,'filled','black')
    scatter(handles.axes1,xvnegro+m+1,yvnegro,'filled','black')
    scatter(handles.axes1,xrojo,yrojo,'filled','r')
    scatter(handles.axes1,xazul,yazul,'filled','b')

    hold off
end

