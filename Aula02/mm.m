%----------------------------------------------%
% MEDIA MOVEL
% BY LEANDRO DE SOUZA
%----------------------------------------------%
% signal = Nome do arquivo do sinal
%----------------------------------------------%
function mm(signal)
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
% Abre o arquivo do sinal
fid = fopen(signal,'r');
% Carrega os dados
fid_load = fread(fid,inf,'int16');
% Fecha o aquivo
fclose(fid);
% Verifica o tamanho do sinal
tam = length(fid_load);
% Cria um vetor do mesmo tamanho
vet_saida = zeros(tam,1);
% Separa o nome do arquivo pelo ponto
C = strsplit(signal,'.');
% Adiciona a extensao _mm no nome do arquivo
name = strcat(C(1,1),'_mm.pcm');
% Cria a variavel com o nome ja configurado
namen = string(name);
% Cria um arquivo com o nome configurado
fid_write = fopen(namen,'w');
% Laco de repeticao for de 1 ate o tamanho
for i = 1:tam
    % Le o dado da posicao (i,1) e salva em X(1,1)
    x(1,1) = fid_load(i,1);
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
    % Arredonda a saida
    saida = round(Acc);
    % Escreve no arquivo de saida
    fwrite(fid_write,saida,'short');
    % Salva a saida no vetor para plotar
    vet_saida(i,1) = saida;
end
% Fecha o arquivo de saida
fclose(fid_write);
% Plota o arquivo de entrada
plot(fid_load);
% Segura o grafico anterior
hold on;
% Plota o arquivo de saida
plot(vet_saida,'r');
% Fim
end