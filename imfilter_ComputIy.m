function WI_1x1 = imfilter_ComputIy(I_5x1)

coder.inline('always');

d5 = [-1 8 0 -8 1]/12;
d5 = flipud(d5(:));
[WI_1x1] = sum(d5(:) .* I_5x1);

end
