s=tf('s');
H=470*s/(47*s+1)/(0.2*s+1);
bode(H,{0,1e8});
saveas(gcf,'p3_bode.eps');
nyquist(H);
saveas(gcf,'p3_nyquist.eps');