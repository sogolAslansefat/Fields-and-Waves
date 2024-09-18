
fs = [0 : 0.001 : 2].';

ALLzL = @(f) 25-50j./f;

ALLGammaLL = biliTrans(ALLzL(fs), z0);

ALLGammaL0 = ALLGammaLL.*((GammaL0./GammaLL).^fs);

ALLYinL0 = biliTrans(1, ALLGammaL0); 

ALLGammaS0 = GammaSS.*((GammaS0./GammaSS).^fs);

ALLYinS0 = biliTrans(1, ALLGammaS0);

ALLYin0 = ALLYinLO + ALLYinS0;

ALLGamma0 = biliTrans(1, ALLYin0); 

plot(fs, abs(ALLGamma0(:,1))) 

hold on 

plot(fs, abs(ALLGamma0(:,2))) 

PlotXLab = xlabel('$f/f_0$');
PlotYLab = ylabel("$\left|\Gamma_{in}\right|$"); 

Leg(1) = "$l_S$" + num2str(lenS(1),'%.2f') + "$\lambda$";
Leg(2) = "$l_S$" + num2str(lenS(1),'%.2f') + "$\lambda$";

Leg(1) = Leg(1) + " and $l_L$ = " + num2str(lenL(1),'%.2f') + "$\lambda$";
Leg(2) = Leg(2) + " and $l_L$ = " + num2str(lenL(2),'%.2f') + "$\lambda$";
PlotLeg = legend(Leg(1), Leg(2));

set([PlotLeg, PlotYLab, PlotXLab], 'Interpreter', 'latex'); 
set(PlotLeg, 'FontSize', 12); 
set([PlotYLab, PlotXLab], 'FontSize', 15); 

