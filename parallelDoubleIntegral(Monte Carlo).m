a = zeros(1,5);
b = zeros(1,5);
c = zeros(1,5);
d = zeros(1,5);
e = zeros(1,5);
N = 1;
hit = 0;
for i=1:5
 N = i * 1000000;
 hit = 0;
 tic
 tStart = tic;
 for n=1:N
 x=rand;
 y=rand;
 if (x>0 && x<2)
 if (y>0 && y<x)
 hit=hit+1;
 end
 end
 end
 a(i) = toc(tStart);

 % matlabpool open 2

 N = i * 1000000;
 tic
 tStart = tic;
 hit = 0;
 parfor n=1:N
 x=rand;
 y=rand;
 if (x>0 && x<2)
 if (y>0 && y<x)
 hit=hit+1;
 end
 end
 end
 b(i) = toc(tStart);
 % matlabpool close


 N = i * 1000000;

 tic
 spmd
 for n=labindex:numlabs:N
 x=rand;
 y=rand;
 if (x>0 && x<2)
 if (y>0 && y<x)
 hit=hit+1;
 end
 end
 end
 end
 d(i) = toc(tStart);


 c(i) = b(i) / a(i);

 e(i) = d(i) / a(i);

end
figure;
x = 1:5;
y = a;
z=b;
plot(a,'--r');
hold on;
plot(b,'--g');
hold on;
plot(d,'--b');
xlabel('N * 1000000');
ylabel('Time in Seconds');
legend('y = With Normal For Loop','y = With Parfor Loop' , 'y = With SPMD');
figure;
plot(c,'--or');
ylabel('Parfor efficiency');
xlabel('N * 1000000');
figure;
plot(e,'--ob');
ylabel('SPMD efficiency');
xlabel('N * 1000000');