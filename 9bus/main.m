clear all


%============= Define.m ================
[N,Ref,PQorPV,NonRef,R,Tr,e,f,Vs,V,dV,Ps,Qs,PQ] = Define();
%============= Define.m ================

%============= admittance.m ================
Y = admittance(N,R,Tr);
%============= admittance.m ================

%============= PandQ.m ================
[dP,dQ,dV,P,Q] = PandQ(N,Y,PQ,Ps,Qs,Vs,e,f);
%============= PandQ.m ================

%============= jacobi.m ================
Jacobi = jacobi(N,Y,e,f,PQorPV,NonRef)
%============= jacobi.m ================

%============= delta.m ================
def = delta(N,PQorPV,NonRef,dP,dQ,dV,Jacobi,e,f);
%============= delta.m ================

VVV = zeros(1,N-1);
n = 1;
THEATA = zeros(1,N-1);
RHO = zeros(1,N-1);
for k = 1:N-1
  VVV(k) = e(NonRef(k)) + def(2*k-1) + (f(NonRef(k)) + def(2*k)) * i;
  [THEATA(k),RHO(k)] = cart2pol(e(NonRef(k)) + def(2*k-1),(f(NonRef(k)) + def(2*k)));
end


THEATA
RHO

for k = 1:N-1
  dP(NonRef(k))
end
%}

b_rho = zeros(N-1);
a_rho = RHO;
for k = 1:N-1
  d_rho = abs(a_rho(k) - b_rho(k));
end

while n < 15 %max(d_rho) > 10^(-7)
  n = n + 1
  for k = 1:N-1
    e(NonRef(k)) = e(NonRef(k)) + def(2*k-1);
    f(NonRef(k)) = f(NonRef(k)) + def(2*k);
  end
  
  %============= PandQ.m ================
  [dP,dQ,dV,P,Q] = PandQ(N,Y,PQ,Ps,Qs,Vs,e,f);
  %============= PandQ.m ================
  
  %============= jacobi.m ================
  Jacobi = jacobi(N,Y,e,f,PQorPV,NonRef);
  %============= jacobi.m ================
  
  %============= delta.m ================
  def = delta(N,PQorPV,NonRef,dP,dQ,dV,Jacobi,e,f);
  %============= delta.m ================
  
  for k = 1:N-1
    VVV(k) = e(NonRef(k)) + def(2*k-1) + (f(NonRef(k)) + def(2*k)) * ...
	i;
    [THEATA(k),RHO(k)] = cart2pol(e(NonRef(k)) + def(2*k-1),(f(NonRef(k)) + def(2*k)));
  end
  
  b_rho = a_rho;
  a_rho = RHO;
  for k = 1:N-1
    d_rho = abs(a_rho(k) - b_rho(k));
  end

THEATA
RHO
P
Q
 
  

end


    
