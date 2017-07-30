s=tf('s');
H=s*(s+10)*(1-s*1e-5)/(s+100)/(s+25)/(1+s*1e-5)/(1+s/4*1e-5);
bode(H,{0,1e8});
saveas(gcf,'p1_bode.eps');
nyquist(H);
saveas(gcf,'p1_nyquist.eps');