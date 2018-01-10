function x=backsub(U,b)
% solves the triangular system with augmented matrix (U|b)
% where U is an n by n upper triangular matrix
% and b is an n-vector
[n,m]=size(U);
x=zeros(n,1);
for i=1:n
    x(n+1-i)=(b(n+1-i)-U(n+1-i,n+2-i:n)*x(n+2-i:n))/U(n+1-i,n+1-i);
end
