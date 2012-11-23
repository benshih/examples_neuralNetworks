% Benjamin Shih
% 11/22/2012
% Simple neural network test

% Neural networks allow us to model any IO relationships based solely on
% some given set of IO data, when nothing else is known about the model. 

% Based off of the blog post at
% http://matlabbyexamples.blogspot.com/2011/03/starting-with-neural-network-in-matlab.html.

%% Assume that the model has three inputs a, b, and c, and generates an
% output y. We will g enerate the data assuming the model is:
% y = 5*a + b*c +7*c.

% Inputs.
a = rand(1, 1000);
b = rand(1, 1000);
c = rand(1, 1000);

% Noise.
n = rand(1, 1000)*0.05;

% Output. 
y = 5*a + b.*c + 7*c + n;

% Input and output.
I = [a; b; c];
O = y;

