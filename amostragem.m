% AMOSTRAGEM SENO
% PROCESSAMENTO DIGITAL DE SINAIS
% WALTER ANTÔNIO GONTIJO

close all
clear all
clc

% PARÂMETROS
A = 1;
F0 = 100;
FS = 8000;
n = [0:100];

% SENO
Y = A*sin((2*pi*F0*n)/FS);

% GRÁFICO
stem(n,Y);
title('Seno Discreto');
grid on;

% SALVANDO ARQUIVO
fid = fopen('sin_100.pcm','w');
fwrite(fid,Y,'short');
fclose(fid);
