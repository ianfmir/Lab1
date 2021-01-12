
m1 = 2.57;
k1 = 380.19;
b1 = 5.27;
m2 = 3.47;
k2 = 754.82;
b2 = 2.48;
k12 = 325.02;

K = 11340;

A = [m1 b1 k1+k12];
B = [m2 b2 k2+k12];


numG = K*[k12];
denG = conv(A,B);
denG(1,5) = denG(1,5) - k12^2;
G = tf(numG, denG)
%zpk(G)
%step(G)

figure
rlocus(G)
% rltool(G)
% figure 
% bode(G)

Kcr = 0.0303;
Wcr = 17.4;
Pcr = 2*pi/Wcr;
Kp = 0.45*Kcr;
Ti = Pcr/1.2;

%Kp = 0.1*Kp;

numC = [Kp Kp/Ti];
denC = [1 0];
C = tf(numC,denC)

sys = feedback(C,G,-1);
figure
step(sys)

H = 0.02;
sys2 = feedback(H,G,-1);
figure
step(sys2)
% 
% figure
% rlocus(G*C)
% 
% sys = feedback(G,C,-1);
% figure
% step(sys)



