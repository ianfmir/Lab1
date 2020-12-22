%calcula o valor final do sistema
%alterar o valor do tempo de estado estacionário
%dados é o nome da variavel que armazena os dados gerados pelo simulink
%vfinal = mean(out.dados.signals(1).values(out.dados.time>6));

%plota o resultado da simulação
subplot(2,1,1);
plot(out.dados.time,out.dados.signals(1).values,'linewidth',1.3)
hold on
plot(out.dados.time,out.dados.signals(3).values,'r:','linewidth',1.5)
ylim([0 2500]);
xlim([0 12]);
xlabel('tempo (s)');
ylabel('counts');
title({'Resposta ao degrau do carrinho 1'},'interpreter','latex','fontsize', 18)
legend('carrinho 1','entrada','FontSize',13)

subplot(2,1,2);
plot(out.dados.time,out.dados.signals(2).values,'linewidth',1.3)
hold on
plot(out.dados.time,out.dados.signals(3).values,'r:','linewidth',1.5)
ylim([-1200 2500]);
xlim([0 12]);
xlabel('tempo (s)');
ylabel('counts');
title({'Resposta ao degrau do carrinho 2'},'interpreter','latex','fontsize', 18)
legend('carrinho 2', 'entrada','FontSize',13)



