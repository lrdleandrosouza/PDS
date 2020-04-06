%----------------------------------------------%
% MEDIA MOVEL DEGRAU
% BY LEANDRO DE SOUZA
%----------------------------------------------%
% n = Numero de amostragem
% w = Localizacao do degrau
%----------------------------------------------%
function mm_degrau(n,w)
% Fecha tudo
close all;
% Limpa o console do matlab
clc;
% Recebe o valor de k
k = input('Digite o número de amostras: ');
% Laco de repeticao for de 1 ate k
for i = 1:k
    % Inicia x com 0
    x(i,1) = 0;
    % Inicia o coef com 1/k
    coef(i,1) = (1/k);
end
% Eixo X
P = -10:1:n;
% Tamanho do eixo X
tam = length(P);
% Tamanho do vetor de saida do degrau
vet_out = zeros(tam,1);
% Tamanho do vetor de saida da media movel
vet_saida = zeros(tam,1);
% Laco de repeticao for do tamanho do vetor
for j = 1:tam
    % Se k for maior ou igual ao inicio do degrau
    if P(1,j) >= w
        % Cria o degrau
        vet_out(j,1) = 1;
    end
end
% Laco for para calculo da media movel
for i = 1:tam
    % Le o dado da posicao (i,1) e salva em X(1,1)
    x(1,1) = vet_out(i,1);
    % Variavel acumuladora
    Acc = 0;
    % Laco for para calcular o acumulador
    for j = 1:k
        % Calculo do acumulador
        Acc = Acc + coef(j,1)*x(j,1);
    end
    % Laco for para deslocamento
    for j = k:-1:2
        % Desloca o valor de posicao
        x(j,1) = x(j-1,1);
    end
    % Salva o acumulador na saida
    saida = Acc;
    % Salva a saida no vetor para plotar
    vet_saida(i,1) = saida;
end
% Plota o impulso
stem(P,vet_out)
% Segura o grafico
hold on;
% Plota a saida do media movel
stem(P,vet_saida,'r')
% Titulo do graico
title('Média Móvel por Degrau');
% Fim
end