%----------------------------------------------%
% IMPULSO UNITARIO
% BY LEANDRO DE SOUZA
%----------------------------------------------%
% n = Numero de amostragem
% w = Inicio do degrau
%----------------------------------------------%
function impulso(n,w)
% Eixo x
k = -10:1:n;
% Tamanho do eixo X
tam = length(k);
% Tamanho do vetor de saida
vet_out = zeros(tam,1);
% Laco de repeticao for do tamanho do vetor
for j = 1:tam
    % Se k for igual ao definido pro impulso
    if k(1,j) == w
        % Cria o impulso
        vet_out(j,1) = 1;
    end
end
% Plota o grafico
stem(k,vet_out);
% Nome do grafico
title('Impulso Unitário');
% Cria o arquivo degrau.pcm
fid = fopen('impulso.pcm','w');
% Escreve no arquivo
fwrite(fid,vet_out,'short');
% Fecha o arquivo
fclose(fid);
% Fim
end