%----------------------------------------------%
% HALF SIGNAL
% BY LEANDRO DE SOUZA
%----------------------------------------------%
% signal = Nome do arquivo para ser divido
%----------------------------------------------%
function y = hs(signal)
n = [0:100];
% Abre o arquivo
full_fid = fopen(signal,'r');
% Le o arquivo e salva na variavel
full_signal = fread(full_fid,inf,'int16');
% Fecha o arquivo
fclose(full_fid);
% Divide o sinal por 2
y_half = full_signal/2;
% Separa o nome do arquivo pelo ponto
C = strsplit(signal,'.');
% Adiciona _half ao nome do arquivo
name = strcat(C(1,1),'_half.pcm');
% Salva o nome do arquivo na variavel
namen = string(name);
% Cria o arquivo com o nome armazenado na variavel
fid = fopen(namen,'w');
% Escreve no arquivo
fwrite(fid,y_half,'short');
% Fecha o arquivo
fclose(fid);
% Fim
end