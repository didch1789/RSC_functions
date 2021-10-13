function out = avgtrialperformance(trialcorrectinfo, timewindow)

for tw = timewindow:numel(trialcorrectinfo)
    out(tw, :) = mean(trialcorrectinfo(tw-(tw-1):tw));
end

end