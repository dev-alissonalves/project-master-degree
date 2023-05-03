i = 1;
for i = 1 : length(mfr_final(:,i))
    medias(i,1) = mean(mfr_final(i,:));
end
% Eixos dos graficos e outros parametros
set(gca,'xtick',0 : 1 : 20);
xlim([0 21]);
%ylim([0 max(medias)]);
xlabel('NEURONS [1-20]');
ylabel('MEAN (SPIKES/BIN)');
bar(medias,'green','EdgeColor',[0 .9 .9],'LineWidth',1.5)
