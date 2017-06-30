M=csvread('scope_37.csv',2,0);

figure(1);

plot(M(:,1),M(:,2));
hold on;
plot(M(:,1),M(:,3));
hold off;
xlabel('t(s)');
ylabel('U(V)');
axis([-0.025 0.025 -1.5 1.5]);
title('AC CSV');
saveas(gcf,'imgs/ac-csv.eps');

figure(2);

I=M(:,2)./10000;
V=M(:,3)-M(:,2);
plot(V,I,'.');

xlabel('U(V)');
ylabel('I(A)');
axis([-1 0.5 -1e-5 6e-5]);
title('AC IV-Characteristics');
saveas(gcf,'imgs/ac-iv.eps');

figure(3);

V0=1:-0.1:0.1;
V1=[540.5 538 530.5 525 501 478.5 394.5 292 193 90.5]./1000;
I=(V0-V1)./10000;
plot(V1,I,'x','MarkerSize',15);

xlabel('U(V)');
ylabel('I(A)');
title('DC IV-Characteristics');
saveas(gcf,'imgs/dc-iv.eps');
