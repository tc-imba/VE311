V=[10 -10 -2 6 -6 -3 12 -25];
R=[5 5 2 3 3 8 10 10].*1000;
for i=1:8
    figure(i);
    clf;
    hold on;
    plotiv();
    b=V(i)/R(i);
    k=-b/V(i);
    x=-7:0.01:7;
    y=k.*x+b;
    plot(x,y,'Color','k');
    x=min(max(-4,V(i)),0.5);
    y=k*x+b;
    plot(x,y,'.','Color','k','MarkerSize',16);
    text(x+0.2,y+0.0002,['Q(' num2str(floor(y*1e6)/1e3) 'mA, ' num2str(x) 'V)']);
    hold off;
    saveas(gcf,['iv-' num2str(i) '.eps']);
end

function plotiv()
    line([-4 -4 0.5 0.5],[-0.005 0 0 0.005],'Color','k');
    grid on;
    axis([-7 7 -0.003 0.003]);
    xlabel('V_D(V)');
    ylabel('I_D(A)');
end