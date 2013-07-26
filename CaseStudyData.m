% In this file, the following input data are specified: 
    % Technology matrix A(n*n)
    % Intervention matrix B(m*n)
    % Uncertain Technology matrix A_uncertainty(n*n)
    % Uncertain Intervention matrix B_uncertainty(m*n)
    % Constraint on H and d
    
A=[-2 100 0 0;10 0 10 0;0 0 -5 50];
B=[10 5 12 1];

[p,n]=size(A);
[m,~]=size(B);

A_uncertainty=zeros(p,n);
B_uncertainty=zeros(m,n);
A_uncertainty(1,1)=0.3;
A_uncertainty(3,3)=0.2;
B_uncertainty=[4 2 1 0.2];

f=[0 100 0]';


