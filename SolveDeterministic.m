function [ x,fval ] = SolveDeterministic( matrixRobust, demandRobust )
%SOLVEROBUST This function solves the robust optimization problem

[m,n]=size(matrixRobust);

MatrixRobust=-matrixRobust;
DemandRobust=-demandRobust;

% disable the choice of electricity generation by oil
MatrixRobust(2,3)=0;
MatrixRobust(3,4)=0;
MatrixRobust(3,3)=0;

Aeq_Robust=[];
beq_Robust=[];

lb_Robust=zeros(n,1);
ub_Robust=[];

f_Robust=zeros(n,1);
f_Robust(5)=1;% This row (5) corresponds to the total CO2 emmision

[x fval,exitflag]=linprog(f_Robust,MatrixRobust,DemandRobust,Aeq_Robust,beq_Robust,lb_Robust,ub_Robust);

end

