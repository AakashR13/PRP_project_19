function [bel,E_x] = Bayes_filter(px,x)
a= x(2)-x(1); % scaling factor
bel = px(1,:);% first equating bel to the first sensors input
for n = 2: size(px) % runs over the number of sensors
    bel_ = bel;
    eta = sum(px(n,:).*bel_); % calculatinig eta
    bel = px(n,:).*bel_/eta;  %multiplying Prob of nth sensor with bel attained from previous input and normalizing
end
bel = bel/a; % scaling
E_x=sum(x.*bel)*a; %E(x=x_n|x_n=x_n-1,....x_2=x_1) [Conditional Expectation]
end

%{
eta - normalization factor
bel - belief distribution
%}