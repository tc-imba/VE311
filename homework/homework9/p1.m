figure(1);clf;
figure(2);clf;
RD={'1k','10k','100k','500k','1M'};
for i=0:4
    fid=fopen(['p1_',num2str(i),'.result']);
    x=[];y=[];
    while 1
        line=fgetl(fid);
        if ~ischar(line), break, end
        if isempty(line), continue, end
        if isempty(str2num(line(1))), continue, end
        data=sscanf(line,'%d %f %f');
        x=[x;data(2)];
        y=[y;20*log10(data(3)/10)];
    end
    figure(1);
    hold on;
    plot(x,y);
    hold off;
    figure(2);
    plot(x,y);
    set(gca,'XScale','log');
    axis([x(1) x(end) min(y) max(y)]);
    xlabel('$$f(Hz)$$','Interpreter','Latex');
    ylabel('$$A(dB)$$','Interpreter','Latex');
    [M,I]=max(y);
    title(['$$R_D=',char(RD(i+1)),'\Omega\quad\omega_0=',num2str(x(I)*2*pi),'\ rad/s$$'],'Interpreter','Latex');
    saveas(gcf,['p1_',num2str(i),'.eps'])
    fclose(fid);
end
figure(1);
set(gca,'XScale','log');
legend('1M','500k','100k','10k','1k');
axis([4*1e6 6*1e6 0 max(y)]);
xlabel('$$f(Hz)$$','Interpreter','Latex');
ylabel('$$A(dB)$$','Interpreter','Latex');
saveas(gcf,['p1.eps'])
%set(gca,'YScale','log')
