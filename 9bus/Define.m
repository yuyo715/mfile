function [N,Ref,PQorPV,NonRef,R,Tr,e,f,Vs,V,dV,Ps,Qs,PQ] = Define()


%%%%%%%%%%% Bus Number %%%%%%%%%%%
N = 9;
%%%%%%%%%%% Bus Number %%%%%%%%%%%

%%%%%%%%% Reference node %%%%%%%%%
Ref = 1;
%%%%%%%%% Reference node %%%%%%%%%

%%%%%%%%% PQ or PV %%%%%%%%
%% Reference node - 0 %% PQ node - 1 %% PV node - 2 %% 
PQorPV = zeros(1,N);
PQorPV = [0 2 2 1 1 1 1 1 1];
NonRef = find(PQorPV);
%%%%%%%%% PQ or PV %%%%%%%%%


%%%%%%%%%%% Impedance %%%%%%%%%%%
R = zeros(N,N);


R(4,4) = 0.088 + 0.079;
R(5,5) = 0.088 + 0.153;
R(6,6) = 0.079 + 0.179;
R(7,7) = 0.153 + 0.0745;
R(8,8) = 0.0745 + 0.1045;
R(9,9) = 0.179 + 0.1045;
R(4,5) = 0.01 + 0.085i;
R(5,4) = R(4,5);
R(4,6) = 0.017 + 0.092i;
R(6,4) = R(4,6);
R(5,7) = 0.032 + 0.161i;
R(7,5) = R(5,7);
R(6,9) = 0.039 + 0.17i
R(9,6) = R(6,9);
R(7,8) = 0.0085 + 0.072i;
R(8,7) = R(7,8);
R(8,9) = 0.0119 + 0.1008i;
R(9,8) = R(8,9);
R(2,7) = 0.0625i;
R(7,2) = R(2,7);
R(1,4) = 0.0576i;
R(4,1) = R(1,4);
R(3,9) = 0.0586i;
R(9,3) = R(3,9);
%%%%%%%%%%% Impedance %%%%%%%%%%%


%%%%%%%%%%% Off norminal turn ratio %%%%%%%%%%%
Tr = zeros(N,N);


%%%%%%%%%%% Off norminal turn ratio %%%%%%%%%%%


%%%%%%%%% Node Voltage %%%%%%%%%
e = zeros(1,N);
f = zeros(1,N);
Vs = zeros(1,N);
V = zeros(1,N);
dV = zeros(1,N);

e = [1.04 1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0];
Vs(2) = 1.025;
Vs(3) = 1.025;
%%%%%%%%% Node Voltage %%%%%%%%%


%%%%%%%%% P and Q %%%%%%%%%
Ps = zeros(1,N);
Qs = zeros(1,N);
PQ = zeros(1,N);

Ps = [0 1.63 0.85 0 -1.25 -0.9 0 -1 0];
Qs = [0 0 0 0 -0.5 -0.3 0 -0.35 0];
%%%%%%%%% P and Q %%%%%%%%%


