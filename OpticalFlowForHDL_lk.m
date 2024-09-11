function flowVector  = opticalFlowForHDL_lk(I, Idelay)
% Implements the Lucas Kanade method for optical flow

%   Copyright 2021-2023 The MathWorks, Inc.

Ix = hdl.npufun(@imfilter_ComputIx, [1 5], I);
Iy = hdl.npufun(@imfilter_ComputIy, [5 1], I);
It = I - Idelay;

WIxx = hdl.npufun(@imfilter_kernel, [5 5], Ix.*Ix);
WIxy = hdl.npufun(@imfilter_kernel, [5 5], Ix.*Iy);
WIyy = hdl.npufun(@imfilter_kernel, [5 5], Iy.*Iy);
WIxt = hdl.npufun(@imfilter_kernel, [5 5], Ix.*It);
WIyt = hdl.npufun(@imfilter_kernel, [5 5], Iy.*It);

[Vx, Vy] = hdl.npufun(@calc_roots_pixel, [1 1], WIxx, WIxy, WIyy, WIxt, WIyt);
flowVector = complex(Vx,Vy);

end
