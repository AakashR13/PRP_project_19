clear all;

N = 4; % number of sensors
x = 1:0.01:50; %range of sensor
px = zeros(N,length(x));
for n = 1:N
   px(n,:) = normpdf(x,10*n,1); %creating the pdf/inputs for the sensors
end

[bel,E_x] = Bayes_filter(px,x); % calling bayes filter

plot(x,px(1,:),'b:',x,px(2,:),'g--',x,px(3,:),'m-.',x,px(4,:),'r-.',x,bel,'k-');
xlabel('range of sensor');ylabel('probability');
title('Belief distributions');
display(E_x); % expectation
% plotting all sensor values and belief