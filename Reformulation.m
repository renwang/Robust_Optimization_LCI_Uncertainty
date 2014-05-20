function [ reformulatedMatrix, reformulatedDemand, reformulatedMatrixHat ] = Reformulation( A, A_uncertainty, B, B_uncertainty, f )
%REFORMULATION This function reformulate the robust optimization problem
%   Detailed explanation goes here
[p,n]=size(A);
[m,n]=size(B);

zeros_11=zeros(p,n);
zeros_12=zeros(p,m);
zeros_21=zeros(m,n);
zeros_22=zeros(m,m);
eye_22=eye(m);

reformulatedMatrix=[A zeros_12;-B eye_22];

reformulatedDemand=[f;zeros(m,1)];

reformulatedMatrixHat=[A_uncertainty zeros_12;B_uncertainty zeros_22];

end

