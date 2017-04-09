x1 = [11; 12; 13; 14];
28
x2 = [22; 32; 44; 56];
x3 = [31; 43; 56; 67];
y = zeros(4,1);
SPMD
 d=labindex*2;
 a=d-1;
 b=labindex*2;
 ip= a:1:b;
 iq = 1:1:3;
 z = [x1 x2 x3];
 for i = ip
 for j = iq
 y(i) = y(i) + z(i,j);
 end
 end
 y
end
x=y{1}+y{2}
