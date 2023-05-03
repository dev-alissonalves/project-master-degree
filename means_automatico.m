%% (SUBPLOT 1)GERA MEDIAS COM GRAFICO DE BARRAS DE CADA REGIAO
%Coluna 1 - (Saudável)
i = 1;
for i = 1 : length(mfr_final(:,i))
    medias(i,1) = mean(mfr_final(i,:));
end

subplot(2,3,4);
media = mean(medias);
desvio = std(medias);

bar(medias,'blue','EdgeColor','k','LineWidth',1.0)
set(gca,'xtick',0 : 1 : 10);
xlim([0 11]);
ylim([0 60]);
ax = gca;
ax.FontSize = 12;
ylabel('MEAN SPIKES/BIN','FontWeight', 'bold');
clc, clear all;
%% (SUBPLOT 2)
%Coluna 2 - (Parkinson)
i = 1;
for i = 1 : length(mfr_final(:,i))
    medias(i,1) = mean(mfr_final(i,:));
end

subplot(2,3,5);
media = mean(medias);
desvio = std(medias);

bar(medias,'red','EdgeColor','k','LineWidth',1.0)
set(gca,'xtick',0 : 1 : 10);
xlim([0 11]);
ylim([0 60]);
ax = gca;
ax.FontSize = 12;
xlabel('NEURONS [1-10]','FontWeight', 'bold');
clc, clear all;
%% (SUBPLOT 3)
%Coluna 3 (Parkinson + STIM)
i = 1;
for i = 1 : length(mfr_final(:,i))
    medias(i,1) = mean(mfr_final(i,:));
end

subplot(2,3,6);
media = mean(medias);
desvio = std(medias);

bar(medias,'green','EdgeColor','k','LineWidth',1.0)
set(gca,'xtick',0 : 1 : 10);
xlim([0 11]);
ylim([0 60]);
ax = gca;
ax.FontSize = 12;
clc, clear all;

%% GERA SERIES TEMPORAIS COM GRAFICOS DE LINHA
directory = uigetdir(); %Abre diretorio
files = dir([directory '/*.mat']); % Windows Pega todos os arquivos .mat da pasta e armazena em files
trialsOfInterest = []; %Vetor que armazena os arquivos de cada trial 
%carrega todos os arquivos das trials e armazena em uma única estrutura trialsOfInterest
timesStampVector = []; %Vetor que recebe os times stamp de cada triaÃ§
mfr = []; %vetor final que recebera o firing count
FR = []; %vetor que recebe o firing rate
binSize = 20; %Tamanho do janelamento
trialDuration = 2000; %Duração do experimento
cont = 20;%contador que controla o indice de cada neuronio dentro da regiao

%laço responsavel por colocar todos dados agrupados numa unica estrutura (Trialsofinterest)
for t = 1 : size(files, 1)
    trialsOfInterest{t, 1} = load([directory '/' files(t, 1).name]); %Windows usa \ - Linux usa /%
end

for i = 1 : size(trialsOfInterest) %percorre cada arquivo .mat referente as trials    
    for j = 1 : size(trialsOfInterest{i, 1}.Cor_APs(cont).times) %percorre cada regiao
        timesStampVector{i} = trialsOfInterest{i, 1}.Cor_APs(cont).times; %timesStampVector recebe em cada posicao os timestamp de cada trial da regiao percorrida
        mfr(:,i) = spike_mfr_ts(timesStampVector{i},binSize,0,'bin',trialDuration);
    end
end
x=0:binSize:trialDuration;
subplot(20,2,[39 40]);
mfr2 = mfr';
FR = sum(mfr2);
mfr_final(cont,:) = FR;
plot(x, FR, 'k','LineWidth',1.3);
ax = gca;
ax.FontSize = 12;
%set(gca,'ytick',0 : 0 : 0);
%set(gca,'xtick',0 : 0 : 0);
xlabel('Time [ms]','FontWeight', 'bold');
%ylabel('SPIKES/BIN - Temporal Series Neurons [1-20]','FontWeight', 'bold');
clc, clear all
%% PROCESSA O PCA E GERA GRAFICO 3D COM COMPONENTES
%TRANSPOR A MATRIZ PARA FICAR (OCORRÊNCIAS X VARIÁVEIS)
mfr_final = mfr_final';

%pca
 [coeff,score,latent,tsquared] = pca(mfr_final);
 PCA1 = mfr_final * (coeff(:,1));
 PCA2 = mfr_final * (coeff(:,2));
 PCA3 = mfr_final * (coeff(:,3));

%PLOTAR COMPONENTES PCA1XPC2XPC3
 ax = gca;
 ax.FontSize = 14;
 plot3(PCA1,PCA2,PCA3, 'red', 'LineWidth', 1.3)
 xlabel('PC1','FontWeight', 'bold');
 ylabel('PC2','FontWeight', 'bold');
 zlabel('PC3','FontWeight', 'bold');
 clc, clear all, hold on;