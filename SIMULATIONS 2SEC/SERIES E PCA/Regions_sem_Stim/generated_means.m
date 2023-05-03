%Gerando medias da taxa de disparo de cada neuronio
i = 1;
for i = 1 : length(mfr_final(:,i))
    medias(i,1) = mean(mfr_final(i,:));
end

%Separando cada subplot de cada media com seu rasterplot associado
subplot(2,3,4);
subplot(2,3,5);
subplot(2,3,6);

media = mean(medias);
desvio = std(medias);
bar(medias,'red','EdgeColor',[0 .9 .9],'LineWidth',1.5)
set(gca,'xtick',0 : 2 : 20);
xlim([0 21]);
ylim([0 15]);
ax = gca;
ax.FontSize = 14;
xlabel('NEURONS [1-20]');
ylabel('MEAN (SPIKES/BIN)');