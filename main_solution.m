clear all;clc;
%This script generated the result of final electricity generation plan under
%different uncertainty budget

%load data
CaseStudyData

%reformulate the problem 
[reformulatedMatrix, reformulatedDemand, reformulatedMatrixHat] = Reformulation(A, A_uncertainty, B, B_uncertainty, f);

%specify the uncertainty budget
gamma_i=[1 0 1 4]';
%gamma_i=[0 0 0 4]';

ObjFunVal=[];
ObjFunVal2=[];
Fuel=[];
Coal=[];

for k=0:0.01:4, 
gamma_i(4,1)=k;

%build the robust optimization counterpart problem
[matrixRobust, demandRobust] = BuildRobust(reformulatedMatrix, reformulatedDemand, reformulatedMatrixHat, gamma_i);

%solve the robust optimization problem
[x,fval] = SolveRobust(matrixRobust, demandRobust);
[x2,fval2] = SolveRobust2(matrixRobust, demandRobust);

fuel=10*x(1);
coal=10*x(3);
Fuel=[Fuel fuel];
Coal=[Coal coal];

ObjFunVal=[ObjFunVal fval];
ObjFunVal2=[ObjFunVal2 fval2];
end


figure;
temp4=0:0.01:k;
plot(temp4*100/4,Fuel,'r-','LineWidth',2 )
hold on;
plot(temp4*100/4,Coal,'b--','LineWidth',2)
hold off;
xlabel('Budget of uncertainty (%)');
ylabel('Electricity generated (kWh)');
%grid on;
legend('Electricity by oil','Electricity by coal');
%title('Electricity generation strategy under uncertainty budget');

figure
temp4=0:0.01:k;
plot(temp4*100/4,ObjFunVal,'r-','LineWidth',2)
hold on;
plot(temp4*100/4,ObjFunVal2,'b--','LineWidth',2)
hold off;
xlabel('Budget of uncertainty (%)');
ylabel('Total CO2 Emissions (kg)');
%grid on;
legend('Robust approach','Deterministic approach');
%title('Comparison between robust approach and deterministic approach');

