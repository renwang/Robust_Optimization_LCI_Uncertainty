% Specify the data used in the case study 
    % Technology matrix A(p*n)
    % Intervention matrix B(m*n)
    % Uncertainty for A matrix: A_uncertainty(p*n)
    % Uncertainty for B matrix: B_uncertainty(m*n)
    % Final demand vector f
    
A=[-2 100 0 0;10 0 10 0;0 0 -5 50];
B=[10 5 12 1];

[p,n]=size(A);
[m,n]=size(B);

A_uncertainty=zeros(p,n);
B_uncertainty=zeros(m,n);
A_uncertainty(1,1)=0.3;
A_uncertainty(3,3)=0.2;
B_uncertainty=[4 2 1 0.2];

f=[0 100 0]';


