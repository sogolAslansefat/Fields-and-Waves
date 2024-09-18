clc
format shortG
z_l = 25-50j;
z_0 = 50;

bili = @(x, y) (x-y)./(x+y);

GammaL_l =bili(z_l, z_0);

[cirR(1), cirR(2), cirR(3)] = R_curve(1);

[xout,yout] = circcirc(cirR(1), cirR(2), cirR(3), 0, 0, abs(GammaL_l));

GammaL_0 = -1*(xout + 1j*yout);

Yin_l = bili(1, GammaL_0);

B = imag(Yin_l);

GammaS_0 = bili(1, -1j*B);

GammaS_s = -1;

Ls = mod(angle(GammaS_0./GammaS_s), 2*pi)./(4*pi)

Ll = mod(angle(GammaL_0./GammaL_l), 2*pi)./(4*pi)

%%
fs = [0 : 0.001 : 2].';

z_l2 = 25-50j./fs;
z_02 = 50;

bili = @(x, y) (x-y)./(x+y);

GammaL_l2 =bili(z_l2, z_02);

GammaL_02 = GammaL_l2.*((GammaL_0./GammaL_l).^fs);

Yin_l2 = bili(1, GammaL_02);

GammaS_02 = GammaS_s.*((GammaS_0./GammaS_s).^fs);

Yin_s2 = bili(1, GammaS_02);

Yin_2 = Yin_l2 + Yin_s2;

Gammain = bili(1, Yin_2);

plot(fs, abs(Gammain(:,1)))

hold on

plot(fs, abs(Gammain(:,2)))

xlabel('f/f_0')
ylabel('|Reflection coefficient|')

Leg(1) = "l_s = " + num2str(Ls(1),'%.2f') + "\lambda";
Leg(2) = "l_s = " + num2str(Ls(2),'%.2f') + "\lambda";

Leg(1) = Leg(1) + " and l_l = " + num2str(Ll(1),'%.2f') + "\lambda";
Leg(2) = Leg(2) + " and l_l = " + num2str(Ll(2),'%.2f') + "\lambda";

legend(Leg(1), Leg(2))




