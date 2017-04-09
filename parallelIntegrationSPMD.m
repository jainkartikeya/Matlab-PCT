f = @(x) x.^2;
tic
%matlabpool local 2
%parpool('local',2)
SPMD
 m=100000;
 a=2;
 b=5;
 n=m/numlabs;
 deltax = (b-a)/numlabs;
 ai = a + (labindex -1)*deltax;
 bi = a + labindex*deltax;
 dx = deltax/n;
 x = ai+dx/2:dx:bi-dx/2;

 intSPMD = sum(f(x)*dx);
 intSPMD = gplus(intSPMD,1);

end
%delete(gcp)
intSPMD(1)
toc