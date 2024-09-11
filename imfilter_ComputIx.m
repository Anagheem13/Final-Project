function WI_1x1 = imfilter_ComputIx(I_1x5)

coder.inline('always');

d5 = [-1 8 0 -8 1]/12;
d5 = fliplr(d5(:)');
[WI_1x1] = sum(d5 .* I_1x5);

end 
