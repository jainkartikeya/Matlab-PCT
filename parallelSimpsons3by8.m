f = @(x) 1/(1+x^2);
a=0;
b=2;
n=900000;
h = (b-a)/(3*n);
I = 3*h*(f(a)+f(b))/8;
parfor i=1:(3*n)-1
 if mod(i,3) ~= 0
 I = ((9*h*f(a+(h*i)))/8)+I;
 elseif mod(i,3) == 0
 I = ((6*h*f(a+(h*i)))/8)+I;
 end
end
disp(I)