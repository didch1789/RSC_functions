function measure_orths(mat1, mat2)

spacecorr = reformat_r_new(corr(spacemat), 'flatten');
sizecorr = reformat_r_new(corr(sizemat), 'flatten');
pair_wise.SPACEvsSIZE.(sprintf('M%d', mm)) =  nancorr(spacecorr, sizecorr);

end