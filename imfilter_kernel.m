function WI_1x1 = imfilter_kernel(I_5x5)

coder.inline('always');

p5 = [1 4 6 4 1]/16;
W = p5(:)*p5(:)';
[WI_1x1] = sum(W(:) .* I_5x5(:));

end
