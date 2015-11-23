
function [sigmin] = computePseudo (A,x,y,dim)

%drawPseudo (A,x,y,dim)
%	Plot the Pseudospectrum of a Matrix the straightforward grid approach LNT p.371
%	A: the input Matrix
%	x: x-Coordinate vector
%	y: y-coordinate vector
%	dim : matrix dimension


	N = dim;
	m = length(x);
	m2 = length(y);	

	for k=1:1:m, for j =1:1:m2
		sigmin(j,k) = min(svd((x(k)+y(j)*i)*eye(N)-A));
	end, end


%Matlab file

