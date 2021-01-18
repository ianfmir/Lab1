close
clear all
clc

num = 0.0056838;
den = conv([1 0],[1 0.03372]);

G = tf(num,den);
zpk(G)
% rlocus(G)

%rltool(G)

%%
C = pidtune(G,'P')
Tref = getPIDLoopResponse(C,G,"closed-loop");
figure
step(Tref);

hold on

C = pidtune(G,'PI')
Tref = getPIDLoopResponse(C,G,"closed-loop");
step(Tref);

C = pidtune(G,'PID')
Tref = getPIDLoopResponse(C,G,"closed-loop");
step(Tref);

legend('P', 'PI', 'PID');