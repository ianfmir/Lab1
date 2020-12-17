%plota só a resposta do modelo e sistema

%valor final do sistema
vfinal = mean(out.dados.signals(1).values(out.dados.time>10));
%valor final do modelo
vfinalmodelo = mean(out.dados.signals(2).values(out.dados.time>10));

%plot sistema
plot(out.dados.time,out.dados.signals(1).values,'linewidth',1.3)
hold on 
%plot valor final do sistema
plot([0 13],vfinal*[1 1],'r--');

%plot valores da modelagem
plot(out.dados.time,out.dados.signals(2).values,'m:','linewidth',1.5)

%plot limites de +- 2% do valor final do sistema
plot([0 13],vfinal*1.02*[1 1],'k--','linewidth',1);
plot([0 13],vfinal*0.98*[1 1],'k--','linewidth',1);

%parametros do grafico
xlim([0 13]);
xlabel('tempo (s)');
ylabel('counts');
title('Resposta ao degrau do carrinho 1 mola $k_{12}$ com modelo teste 3','interpreter','latex','fontsize', 18)
legend('sistema','valor final','modelo','criterio 2%')


K = 11340;

%criterio de 2% para tempo de acomodacao
ST = 0.02;

%funcao de transferencia do modelo
num = 0.39;
den = [1 1.38 132.25];
sys = tf(K*num,den);
S = stepinfo(sys,'SettlingTimeThreshold',ST)

%Encontra os valores de pico do sistema e do modelo
maxsys = max(out.dados.signals(1).values)
maxmodel = max(out.dados.signals(2).values)
erro_percentual_pico = abs(maxmodel-maxsys)/maxsys*100

quadratic_sum = sum((out.dados.signals(1).values-out.dados.signals(2).values).^2)
a = size(out.dados.signals(1).values);
raiz_erro_quadratico_medio = sqrt(quadratic_sum/a(1,1))
