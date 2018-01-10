function [A2,b2] = gausselim(A, b)

%Row echelon reducer of Ax = b 

[m, n] = size(A);     % Find size of matrix A

% Perform Gaussian elimination
for i = 1:n-1
    if ~(A(i,i)==0) % Ensure no division by zero takes place
        mult = -A(i+1:m,i)/A(i,i); % Calculuate correct multipliers
        A(i+1:m,:) = A(i+1:m,:) + mult*A(i,:);
        b(i+1:m,:) = b(i+1:m,:) + mult*b(i,:);
    end
end

% Ensure the leading coefficients are one within each row
for i=1:m
    if ~(A(i,i)==0)
        b(i,1)=b(i,1)/A(i,i);
        A(i,:)=A(i,:)/A(i,i);
    end
end

A2=A;
b2=b;
