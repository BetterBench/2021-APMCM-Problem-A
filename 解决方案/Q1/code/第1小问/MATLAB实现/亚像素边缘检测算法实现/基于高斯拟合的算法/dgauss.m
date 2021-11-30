% Function "dgauss.m"(first order derivative of gauss function): 
function y = dgauss(x,std) 
y = -x * gauss(x,std) / std^2; 
