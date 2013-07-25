clear all; clc;
A=[-5 50;10 0];
B=[12 3];

[n,~]=size(A);
[m,~]=size(B);

A_uncertainty=zeros(n,n);
B_uncertainty=zeros(m,n);
A_uncertainty(1,1)=0.2;
B_uncertainty=[1 0.2];

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

hist(G(1,:),50)
axis([105 140 0 160]);
xlabel('Total CO2 Emissions (kg)');
ylabel('Frequency');
title('(b) Electricity generation by coal');