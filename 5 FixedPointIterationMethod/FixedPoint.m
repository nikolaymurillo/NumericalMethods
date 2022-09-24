function [xk] = FixedPoint(x0,tol,n)
format short
fprintf('         n           x_n            Eabs_n            Erral_n\n' )
for k = 1:n
    xk = funcion(x0);
    Eabs = abs(xk - x0);
    Erel = Eabs/abs(xk);
    fprintf('%3.0f %10.2f %10.2f %10.2f \n', k, xk , Eabs, Erel)
    if Erel < tol
        fprintf( 'The value of the approximation is ',xk )
    else
        x0 = xk;
    end
end
end
% =====================================
% If you want to test this script, please with this data:
% FixedPoint(0,0.01,4)