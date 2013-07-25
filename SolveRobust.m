function [ x,fval ] = SolveRobust( matrixRobust, demandRobust )
%SOLVEROBUST This function solves the robust optimization problem
%   Detailed explanation goes here

[m,n]=size(matrixRobust);

MatrixRobust=-matrixRobust;
DemandRobust=-demandRobust;

Aeq_Robust=[];
beq_Robust=[];

lb_Robust=zeros(n,1);
ub_Robust=[];

f_Robust=zeros(n,1);
f_Robust(5)=1;% Here the 9th row correspond to the total CO2 emmision 
%f_Robust(10)=1; %the 10th row correspond to the total SO2 emmission

[x fval,exitflag]=linprog(f_Robust,MatrixRobust,DemandRobust,Aeq_Robust,beq_Robust,lb_Robust,ub_Robust);

end

