clear all; clc;
% Monte Carlo simulation for electricity generation by oil

% construct the A and B matrix 
A=[-2 100;10 0];
B=[10 5];

% obtain the dimensions of matrix A and B
[n,n]=size(A);
[m,n]=size(B);

% specify the uncertainty for matrix A and B
A_uncertainty=zeros(n,n);
B_uncertainty=zeros(m,n);
A_uncertainty(1,1)=0.3;
B_uncertainty=[4 2];

% perform Monte Carlo simulation
run_number=5000;
f=[0;100];
g=[];
G=[];
for i=1:run_number
A_rand=rand(n,n)*2-1;
A_range=A_uncertainty.*A_rand;
B_rand=rand(m,n)*2-1;
B_range=B_uncertainty.*B_rand;
A_value=A+A_range;
B_value=B+B_range;
g=B_value*inv(A_value)*f;
G=[G g];
end

% plot
hist(G(1,:),50)
axis([55 150 0 160]);
xlabel('Total CO2 Emissions (kg)');
ylabel('Frequency');
title('(a) Electricity generation by oil');