function [mfr]=spike_mfr_ts(timeStampVector,bin,plotMFR,mfrScale,trialDuration)

timeStampVector = timeStampVector*1000; %time stamp now in ms

x=0:bin:2000;

firingCounts=histc(timeStampVector,x);  %number of spikes in each bin

 %  if strcmp(mfrScale,'s')
  %      mfr=firingCounts/(bin/1000);    %mfr in spikes per second
   % elseif strcmp(mfrScale,'bin')
        mfr=firingCounts;               %mfr in spikes per bin
    %end

    %if plotMFR
     %  figure;
      % plot(x/1000,mfr);
       %xlabel('Time [s]');
       %ylabel('spikes/s');    
    %end
%end