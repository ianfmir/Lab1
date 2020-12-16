%calcula o valor final do sistema
%alterar o valor do tempo de estado estacionário
%dados é o nome da variavel que armazena os dados gerados pelo simulink
vfinal = mean(out.dados.signals(1).values(out.dados.time>6));

%plota o resultado da simulação
subplot(2,1,1);
plot(out.dados.time,out.dados.signals(1).values,'linewidth',1.3)
hold on 
plot([0 10],vfinal*[1 1],'--');
plot([0 1485],'.');
xlim([0 8]);
xlabel('tempo (s)');
ylabel('counts');
title('Resposta ao degrau do carrinho 1 mola $k_1$','interpreter','latex','fontsize', 12)

%plota o degrau de entrada
subplot(2,1,2);
plot(out.dados.time,out.dados.signals(2).values,'linewidth',1.3)
hold on
aux = 50*ones(size(out.dados.signals(2).values));
plot(out.dados.time,aux,'--','linewidth',1.3);
ylim([-1 60]);
xlim([0 8]);
xlabel('tempo (s)');
ylabel('counts');
title('Entrada degrau','interpreter', 'latex','fontsize',12);