u = out.dados.signals(2).values;
y = out.dados.signals(1).values;
t = out.dados.time;

vfinal = mean(y(3500,:));
pc10 = (20-4)*0.6*0.1;
v10pctinf = 13.6-pc10;
v10pctsup = 13.6+pc10;

figure
hold on
plot(t,y,'b:','linewidth',1);
plot(t,u,'m','linewidth',1.5);
plot(t,v10pctinf*(ones(length(t))),'k--','linewidth',1);
plot(t,v10pctsup*(ones(length(t))),'k--','linewidth',1);
% legend('resposta sistema','entrada','-10%','+10%');

% xlabel('tempo (s)');
% ylabel('corrente (mA)');
% title({'Resposta ao degrau com controlador P'},'interpreter','latex','fontsize', 18)
% legend('resposta do sistema','entrada degrau','-10%','+10%','FontSize',13)

%%

numGA = [1.27];
denGA = [285 1];
GA = tf(numGA,denGA);

% opt = stepDataOptions('InputOffset',13.6);
figure
step(GA);