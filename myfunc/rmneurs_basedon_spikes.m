function outdat = rmneurs_basedon_spikes(dat, spike)
% dat in cell. each cell. neuron x times (in ms).
% spike in /s.
datmat =cat(2, dat{:});
spikesum = sum(datmat, 2);
totalms = size(datmat, 2);
minimumspike = totalms / 1000 * spike;
outmat = datmat(spikesum > minimumspike, :);
outdat = mat2cell(outmat, size(outmat, 1), repmat(1000, 1, totalms/1000));

end