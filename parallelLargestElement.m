A = [12 13 45 67 89 35 43 67 98 46];
n=10;
large=A(1);
SPMD
 a = (labindex-1) /numlabs;
 b = labindex/numlabs;
 ip= (a*n+1):1:(b*n-1);
 for i = ip
 if A(i)<A(i+1)
 large = A(i+1);
 end
 end
 disp(large);
 switch labindex
 case 1
 labSend(large,2)
 case 2
 large1=labReceive(1);
 if large1 > large
 fprintf('the maximum number is %d',large1)
 else
 fprintf('the maximum number is %d',large)
 end
 end
end
