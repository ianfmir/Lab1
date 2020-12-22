%Encontra os parametros da resposta ao degrau do sistema com os dados gerados pelo simulink

To = 2; %inicio do degrau
Ti = 25; %Ti regime permanente
Tf = 31; %Tf regime permanente

%valor final do sistema
vfinal = mean(out.dados.signals(2).values(fix(Ti/0.0042):fix(Tf/0.0042)));

%valor final da entrada
vfinalentrada = mean(out.dados.signals(3).values(fix(Ti/0.0042):fix(Tf/0.0042)));

%plot resposta ao degrau e entrada degrau
plot(out.dados.time,out.dados.signals(2).values,'linewidth',1.3)
hold on
plot(out.dados.time,out.dados.signals(3).values,'r:','linewidth',1.5)

%plot valor final do sistema modelo
plot([0 62],vfinal*[1 1],'g-');

%plot limites de +- 2% do valor final do sistema
plot([0 62],vfinal*1.02*[1 1],'k--','linewidth',1);
plot([0 62],vfinal*0.98*[1 1],'k--','linewidth',1);

%indices usados para encontrar o tempo de acomodacao
index1 = fix(15/0.0042); %15 = tempo antes do cruzamento com 0.98 do valor final
index2 = fix(20/0.0042); %20 = tempo depois do cruzamento com 0.98 do valor final

j = 1;
for i=index1:index2
    if (out.dados.signals(2).values(i) > vfinal*0.975 && out.dados.signals(2).values(i) < vfinal*0.985)
        pontos(j) = out.dados.time(i);
        j = j+1;
    end; 
end;

tempo_acomodacao = mean(pontos);
tempo_acomodacao = tempo_acomodacao - To;

erro = abs(vfinal - vfinalentrada)/vfinalentrada*100;

ylim([0 2500]);
xlim([0 62]);
xlabel('tempo (s)');
ylabel('counts');
title({'Resposta ao degrau do carrinho 2'},'interpreter','latex','fontsize', 18)
legend('carrinho 2', 'entrada','valor final sistema','critério 2%','FontSize',10)
