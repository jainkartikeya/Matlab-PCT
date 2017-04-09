tic
f = @(x) x.^2;
L1 = 2;
L2 = 5;
L = L2-L1;
SPMD
 startingrange = L1 + L*(labindex - 1) / numlabs
 endingrange = L1 + L*labindex / numlabs
 labintegral = quadl( f, startingrange, endingrange)
 totalintegral = gplus( labintegral )
end
toc