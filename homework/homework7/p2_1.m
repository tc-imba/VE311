s=tf('s');
H=4e-3*s/(1.2e-8*s^3+6e-6*s^2+7e-3*s+2);
bode(H,{0,1e5});
saveas(gcf,'p2_1_bode.eps');
nyquist(H);
saveas(gcf,'p2_1_nyquist.eps');