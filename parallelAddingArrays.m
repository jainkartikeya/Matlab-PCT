d = zeros(1,10);
e = zeros(1,10);
f = zeros(1,10);
for i=1:10
 a = rand(1,i*100);
 b = rand(1,i*100);
 c = zeros(1,i*100);

 tic
 tStart = tic;
 for j=1:length(a)
 c(j) = a(j) + b(j);
 end
 tNormalFor = toc(tStart);
 d(i) = tNormalFor;
 
 a = rand(1,i*100);
 b = rand(1,i*100);
 c = zeros(1,i*100);
 tic
 tStart = tic;
 % matlabpool open 2
 parfor j=1:length(a)
 c(j) = a(j) + b(j);
 end

 tParfor = toc(tStart);
 e(i) = tParfor;

 a = rand(1,i*100);
 b = rand(1,i*100);
 c = zeros(1,i*100);

 a = distributed(a);
 b = distributed(b);
 c = distributed(c);


 tic
 tStart = tic;
 SPMD

 for j=1:length(a)
 c(j)=a(j)+b(j);
 end

 end
 tSPMD = toc(tStart);
 f(i) = tSPMD;

end
figure;
plot(d,'--r');
hold on;
plot(e,'--g');
hold on;
plot(f,'--b');
legend('y = With Normal For Loop','y = With Parfor Loop' , 'y = With SPMD');
xlabel('Size of array * 100000') % x-axis label
ylabel('Time in seconds') % y-axis label
