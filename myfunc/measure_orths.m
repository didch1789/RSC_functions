function out = measure_orths(mat1, mat2, dorand)

corrmat1 = reformat_r_new(corr(mat1), 'flatten');
corrmat2 = reformat_r_new(corr(mat2), 'flatten');
corr12 = nancorr(corrmat1, corrmat2);

crosscorr = tril(corr(mat1, mat2));
cross_cond_corr = mean(crosscorr(crosscorr~=0));

out.Pair_Wise_Corr.corr =  corr12;
out.Pair_Wise_Corr.rawcorrs = [corrmat1, corrmat2];
out.Pair_Wise_Corr.cross_condition_corr = cross_cond_corr;
if dorand 
    out.Pair_Wise_Corr.randomidx = bootci(5000, @nancorr, corrmat1, corrmat2);
end

[~, ~, ~, ~, expl] = pca([mat1;mat2]);
% numPCs = min(find(cumsum(expl) > 90));
numPCs = 5;
mat1PCs   = pca(mat1, 'NumComponents', numPCs);
mat2PCs   = pca(mat2, 'NumComponents', numPCs);

out.Alignidx.mat1_on_mat2 = trace(mat2PCs' * cov(mat1) * mat2PCs) / trace(mat1PCs' * cov(mat1) * mat1PCs);
out.Alignidx.mat2_on_mat1 = trace(mat1PCs' * cov(mat2) * mat1PCs) / trace(mat2PCs' * cov(mat2) * mat2PCs);
if dorand
    out.Alignidx.randomidx = generate_random_alignIndex([mat1;mat2]);
end
                              
out.Explained.mat1_by_mat1 =  (var((mat1 - mean(mat1)) * mat1PCs) ./ sum(var(mat1)))';
out.Explained.mat2_by_mat1 =  (var((mat2 - mean(mat2)) * mat1PCs) ./ sum(var(mat2)))';

out.Explained.mat2_by_mat2 = (var((mat2 - mean(mat2)) * mat2PCs) ./ sum(var(mat2)))';
out.Explained.mat1_by_mat2 = (var((mat1 - mean(mat1)) * mat2PCs) ./ sum(var(mat1)))';

out.numPCs = numPCs;

end