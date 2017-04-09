X = [1 2 3 4 5 6];
Y = [5 6 7 8 7 8];
dot = 0;
X = distributed(X);
Y = distributed(Y);
SPMD
 if labindex==1
 size(getLocalPart(X)) % size of matrix X in lab1
 size(getLocalPart(Y)) % size of matrix Y in lab1
 else
 size(getLocalPart(X)) % size of matrix X in lab2
 size(getLocalPart(Y)) % size of matrix Y in lab2
 end
 for i = 1:length(X)
 dot = dot + X(i)*Y(i);
 end
end
disp(dot)