X = [1 2 3 4 5 6 7 8 9 10];
a = 20;
Y = zeros(1,10);
X = distributed(X);
Y = distributed(Y);

SPMD
 for i = 1:length(X)
 Y(i) = a*X(i);
 end
 disp(Y);
end
disp(Y);
