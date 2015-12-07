
%% computing 
B = gallery('grcar',50)

x = linspace(-10,10,100);
y = x;
r1PlainB = zeros(length(x),length(y));

for i = 1:length(x)
    for j = 1:length(y)        
        [~,~,relres] = gmres(B,[x(i); y(j); 1],1);
        r1PlainB(i,j) = relres;
    end
end

%% Plotting
r1Plot = surf(x,y,log(r1PlainB));shading('flat');view([0,90]);colorbar;%caxis([-15 0]);
