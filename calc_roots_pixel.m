function [VxPix, VyPix] = calc_roots_pixel(aPix, bPix, cPix, txPix, tyPix)

coder.inline('always');

r = aPix + cPix;
s = sqrt(single(4 * bPix * bPix + (aPix - cPix) * (aPix - cPix)));
eig1 = (single(r) + s);
eig2 = (single(r) - s);

vx = single(0);
vy = single(0);
thresh = 0.0039;
thresh2 = 0;

if (eig1 > thresh && eig2 > thresh)
    d = bPix * bPix - aPix * cPix;
    iDelta = 1/d;
    vx =  single( -(tyPix * bPix - txPix * cPix)*iDelta);
    vy =  single( -(txPix * bPix - aPix * tyPix)*iDelta);
elseif (eig1 > thresh && eig2 < thresh)
    rr = bPix+aPix;
    cc = cPix+bPix;
    norm = cc*cc + rr*rr;

    if (norm > thresh2)
        invnorm = 1/norm;
        tmp = -(txPix + tyPix) * invnorm;
        vx =  single(rr * tmp);
        vy =  single(cc * tmp);
    end
end

VxPix = vx;
VyPix = vy;

end
