function Rejilla_SEL(handles,m,n)
    hold on
    xhnegro = [1:1:m];
    yhnegro = zeros(1,m);
    xvnegro = zeros(1,n);
    yvnegro = [1:1:n];
    xrojo = [1, 1, m, m];
    yrojo = [1, n, 1, n];
    xhverde = [2:1:m-1];
    yhverde = ones(1,m-2);
    xvverde = ones(1,n-2);
    yvverde = [2:1:n-1];
    xazul = [];
    yazul = [];
    x2 = [2:1:m-1];
    y2 = zeros(1,m-2);
    for i=2:n-1
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
    xticks(1:1:m)
    yticks(1:1:n)
    
    scatter(handles.axes1,xhnegro,yhnegro,'filled','black')
    scatter(handles.axes1,xhnegro,yhnegro+n+1,'filled','black')
    scatter(handles.axes1,xvnegro,yvnegro,'filled','black')
    scatter(handles.axes1,xvnegro+m+1,yvnegro,'filled','black')
    scatter(handles.axes1,xrojo,yrojo,'filled','r')
    scatter(handles.axes1,xhverde,yhverde,'filled','MarkerFaceColor',[0 .7 0])
    scatter(handles.axes1,xhverde,yhverde+n-1,'filled','MarkerFaceColor',[0 .7 0])
    scatter(handles.axes1,xvverde,yvverde,'filled','MarkerFaceColor',[0 .7 0])
    scatter(handles.axes1,xvverde+m-1,yvverde,'filled','MarkerFaceColor',[0 .7 0])
    scatter(handles.axes1,xazul,yazul,'filled','b')

    hold off
end


