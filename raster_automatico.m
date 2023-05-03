%Developed by Alisson de Oliveira Alves - Bachelor in Computer Science
%M.Sc. in Neuroengineering - Edmond and Lily Safra International Institute

%Codigos para gerar Raster plot automatico
directory = uigetdir(); %Abre diretorio
files = dir([directory '/*.mat']); % Windows Pega todos os arquivos .mat da pasta e armazena em files

 %%RASTER PLOT - Primeira coluna
 subplot(2,3,1);
 for f = 1 : size(files, 1)
     load([directory '/' files(f, 1).name]) %Windows usa \ - Linux usa /%
     for j = 1 : size(TH_APs(1).times,1)
         plot(TH_APs(1).times,f*ones(size(TH_APs(1).times)),'k.','markerfacecolor','g');
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
 %xlabel('TIME [S]','FontWeight', 'bold');
 ylabel('NEURON #1 - TH', 'FontWeight', 'bold');

 %Segunda coluna
 subplot(2,3,2); 
 directory = uigetdir(); %Abre diretorio
 files = dir([directory '/*.mat']); % Windows Pega todos os arquivos .mat da pasta e armazena em files

for f = 1 : size(files, 1)
     load([directory '/' files(f, 1).name]) %Windows usa \ - Linux usa /%
     for j = 1 : size(TH_APs(1).times,1)
         plot(TH_APs(1).times,f*ones(size(TH_APs(1).times)),'k.','markerfacecolor','g');
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

 %Terceira coluna
 subplot(2,3,3);
 directory = uigetdir(); %Abre diretorio
 files = dir([directory '/*.mat']); % Windows Pega todos os arquivos .mat da pasta e armazena em files
 for f = 1 : size(files, 1)
     load([directory '/' files(f, 1).name]) %Windows usa \ - Linux usa /%
     for j = 1 : size(TH_APs(1).times,1)
         plot(TH_APs(1).times,f*ones(size(TH_APs(1).times)),'k.','markerfacecolor','g');
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