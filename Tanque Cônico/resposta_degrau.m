u = out.dados.signals(2).values;
y = out.dados.signals(1).values;
t = out.dados.time;

vfinal = mean(y(3500,:));
pc10 = (20-4)*0.6*0.1;
v10pctinf = 13.6-pc10;
v10pctsup = 13.6+pc10;
delta = (13.6-10.4)*0.05;
delta5sup = 13.6+delta;
delta5inf = 13.6-delta;

figure
hold on
leg(1) = plot(t,y,'b','DisplayName','resposta do sistema');
leg(2) = plot(t,u,'m','linewidth',1.5,'DisplayName','entrada degrau');
leg(3) = plot(t,v10pctinf*(ones(length(t(:,1)),1)),'k--','DisplayName','erro requisito');
leg(4) = plot(t,delta5inf*(ones(length(t(:,1)),1)),'c:','linewidth',1.3,'DisplayName','+-5%');
plot(t,v10pctsup*(ones(length(t(:,1)),1)),'k--');
plot(t,delta5sup*(ones(length(t(:,1)),1)),'c:','linewidth',1.3);


xlabel('tempo (s)'); ylabel('corrente (mA)');
title({'Resposta ao degrau com controlador $C_{2}(s)$'},'interpreter','latex','fontsize', 13)
% $C_{2}(s)$
legend(leg)