function srt = CalSRT(snr,res)
% psychometric fuction to fit the correct-snr data to get srt for
% individual subject

a0 = [0.1,-7];
[a,resnorm,residual,exitflag,output] = lsqcurvefit(@myfun,a0,snr,res);
srt = a(2);

figure
xx = -14:0.5:10;
yy = 100./(1+exp(-a(1)*(xx-a(2))));
hold on;
plot(snr,res,'ko','MarkerFaceColor','black');
plot(xx,yy,'Color','k','LineWidth',1.5);
axis([-14  6  0  100]);


