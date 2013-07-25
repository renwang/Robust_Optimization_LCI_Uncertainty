function [ matrixRobust, demandRobust ] = BuildRobust( reformulatedMatrix, reformulatedDemand, reformulatedMatrixHat, gamma_i )
%BUILDROBUST This function convert the reformulated problem into robust
%optmization form
%   Detailed explanation goes here


[m,n]=size(reformulatedMatrix);

% Get the gamma_p matrix.
matrix_gammap=zeros(m,m);
for i=1:m,
    matrix_gammap(i,i)= gamma_i(i,1);
end

%Get the sigmaq matrix
matrix_sigmaq=zeros(m,m*n);
counter=0;
for i=1:m,
    for j=1:n,
        matrix_sigmaq(i,j+counter)=1;
    end
    counter=counter+n;
end

%Get the p matrix
matrix_p=zeros(m*n,m);
counter=0;
for i=1:m,
    for j=1:n,
        matrix_p(j+counter,i)=1;
    end
        counter=counter+n;
end

%Get matrix_q
matrix_q=eye(m*n);

%Get matrix_ay
matrix_ay=zeros(m*n,n);
counter=0;
for i=1:m,
    for j=1:n,
        matrix_ay(j+counter,j)=reformulatedMatrixHat(i,j);
    end
        counter=counter+n;
end

%Define matrix_xj; matrix_yj;
matrix_xj=eye(n);
matrix_yj=eye(n);

%matrix_zero_11=zeros(m,n);
%matrix_zero_12=zeros(m,m);
%matrix_zero_13=zeros(m,m*n);
matrix_zero_14=zeros(m,n);
matrix_zero_21=zeros(m*n,n);
%matrix_zero_22=zeros(m*n,m);
%matrix_zero_23=zeros(m*n,m*n);
%matrix_zero_24=zeros(m*n,n);
%matrix_zero_31=zeros(n,n);
matrix_zero_32=zeros(n,m);
matrix_zero_33=zeros(n,n*m);
%matrix_zero_34=zeros(n,n);
%matrix_zero_41=zeros(n,n);
matrix_zero_42=zeros(n,m);
matrix_zero_43=zeros(n,n*m);
%matrix_zero_44=zeros(n,n);


% Define matrixRobust matrix
matrixRobust=[reformulatedMatrix -matrix_gammap -matrix_sigmaq matrix_zero_14; 
          matrix_zero_21 matrix_p matrix_q -matrix_ay;
          matrix_xj matrix_zero_32 matrix_zero_33 matrix_yj; 
          -matrix_xj matrix_zero_42 matrix_zero_43 matrix_yj];

% Define demandRobust matrix
demandRobust=zeros(m+m*n+2*n,1);
for i=1:m,
    demandRobust(i,1)=reformulatedDemand(i,1);
end

end

