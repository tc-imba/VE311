s=tf('s');
H=10/(3*s^2+11.5*s+15);
bode(H,{0,1e2});
saveas(gcf,'p2_2_bode.eps');
nyquist(H);
saveas(gcf,'p2_2_nyquist.eps');