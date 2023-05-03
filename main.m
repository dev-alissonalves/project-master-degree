%Developed by Alisson de Oliveira Alves - Bachelor in Computer Science
%Msc. in Neuroengineering - Edmond and Lily Safra International Institute

 directory = uigetdir(); %Abre diretorio
 files = dir([directory '/*.mat']); % Windows Pega todos os arquivos .mat da pasta e armazena em files

 %%RASTER PLOT
 %subplot(2,3,1);
 subplot(2,3,2);
 %subplot(2,3,3);
 for f = 1 : size(files, 1)
     load([directory '/' files(f, 1).name]) %Windows usa \ - Linux usa /%
     for j = 1 : size(Cor_APs(1).times,1)
         plot(Cor_APs(1).times,f*ones(size(Cor_APs(1).times)),'k.','markerfacecolor','g');
         hold on
     end
 end
 hold off
 % Eixos dos graficos e outros parametros
 set(gca,'ytick',0 : 10 : 101);
 set(gca,'xtick',0 : 0.5 : 2);
 xlim([0 2]);
 ylim([0 101]);
 ax = gca;
 ax.FontSize = 12;
 xlabel('TIME [S]','FontWeight', 'bold');
 ylabel('NEURON #1 - CTX', 'FontWeight', 'bold');

%%
directory = uigetdir(); %Abre diretorio
files = dir([directory '/*.mat']); % Windows Pega todos os arquivos .mat da pasta e armazena em files
trialsOfInterest = []; %Vetor que armazena os arquivos de cada trial 

%carrega todos os arquivos das trials e armazena em uma única estrutura trialsOfInterest
for t = 1 : size(files, 1)
    trialsOfInterest {t, 1} = load([directory '/' files(t, 1).name]); %Windows usa \ - Linux usa /%
end

    timesStampVector = []; %Vetor que recebe os times stamp de cada triaÃ§
    mfr = []; %vetor final que recebera o firing count
    FR = []; %vetor que recebe o firing rate
    binSize = 20;
    trialDuration = 2000;
    
    %contador que controla o indice de cada neuronio dentro da regiao
    cont = 1;
    
for i = 1 : size(trialsOfInterest) %percorre cada arquivo .mat referente as trials    
    for j = 1 : size(trialsOfInterest{i, 1}.GPe_APs(cont).times) %percorre cada regiao
        timesStampVector{i} = trialsOfInterest{i, 1}.GPe_APs(cont).times; %timesStampVector recebe em cada posicao os timestamp de cada trial da regiao percorrida
        mfr(:,i) = spike_mfr_ts(timesStampVector{i},binSize,0,'bin',trialDuration);
    end
end

x=0:binSize:trialDuration;
subplot(10,2,[1 2])
mfr2 = mfr';
FR = sum(mfr2);
mfr_final(cont,:) = FR;

plot(x, FR, 'k','LineWidth',3);
%xlim([0 2000]);
%ylim([0 200]);
%set(gca,'ytick',0 : 0 : 0);
%set(gca,'xtick',0 : 0 : 0);
xlabel('Time [ms]');
ylabel('NEURON #1 - GPE');

%TRANSPOR A MATRIZ PARA FICAR (OCORRÊNCIAS X VARIÁVEIS)
mfr_final = mfr_final';

%pca
 [coeff,score,latent,tsquared] = pca(mfr_final);
 PCA1 = mfr_final * (coeff(:,1));
 PCA2 = mfr_final * (coeff(:,2));
 PCA3 = mfr_final * (coeff(:,3));

%PLOTAR COMPONENTES PCA1XPC2XPC3
 plot3(PCA1,PCA2,PCA3, 'green', 'LineWidth', 1.5)
 xlabel('PC1');
 ylabel('PC2');
 zlabel('PC3');
%PCA
% PCAtseries = [];
% PCAtseries2 = [];
% PCAtseries3 = [];
% PCAIndex=1;
% 
% [coeff,score,latent,tsquared] = pca(FR);
%    
 %PCAtseries(1,:)=score(:,1);
 %PCAtseries2(1,:)=score(:,2);
 %PCAtseries3(1,:)=score(:,3);