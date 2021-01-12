%plota só a resposta do modelo e sistema

%valor final do sistema
vfinal = mean(out.dados.signals(1).values(out.dados.time>10));
%valor final do modelo
vfinalmodelo = mean(out.dados.signals(2).values(out.dados.time>10));

%plot sistema
subplot(2,1,1);
plot(out.dados.time,out.dados.signals(1).values,'linewidth',1.3)
hold on 
%plot valor final do sistema
plot([0 10],vfinal*[1 1],'r--');
plot(out.dados.time,out.dados.signals(2).values,'m:','linewidth',1.5)
%plot limites de +- 2% do valor final do sistema
plot([0 13],vfinal*1.02*[1 1],'k--','linewidth',1);
plot([0 13],vfinal*0.98*[1 1],'k--','linewidth',1);


%parametros do grafico
xlim([0 6]);
xlabel('tempo (s)');
ylabel('counts');
title({'Resposta ao degrau do carrinho 1', 'mola $k_{12}$ teste 3'},'interpreter','latex','fontsize', 18)
legend('sistema','valor final','modelo','criterio 2%','FontSize',13)

%plota o degrau de entrada
subplot(2,1,2);
plot(out.dados.time,out.dados.signals(3).values,'linewidth',1.3)
hold on
aux =30*ones(size(out.dados.signals(3).values));
plot(out.dados.time,aux,'--','linewidth',1.3);
ylim([-1 40]);
xlim([0 6]);
xlabel('tempo (s)');
ylabel('counts');
title('Entrada degrau','interpreter', 'latex','fontsize',18);