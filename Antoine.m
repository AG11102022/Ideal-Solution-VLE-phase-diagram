function y = Antoine(a,b,c,T_K)
y = 10.^(a-b./(c+T_K));
%y = exp(a-b./(c+T_K));
end

% See Antoine_modifiedTx1 for context.