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

% A neural network consists of a first layer, which takes inputs and passes
% the inputs through any number of "internal"/"hidden"/"input" layers. The
% final layer, called the "output layer", takes the output from the inner
% layers and gives it to the outer world. There can be any number of
% internal layers.

% Each layer is a function which takes some variables in vector form and
% transforms the variables to another variable by multiplying it with
% coefficients and adding some bias (in this case, a linear
% transformation). The coefficients are called a "weight matrix", and the
% size of the resulting transformed vector is called the v-size of the
% layer: v = sum(w.*u) + b

%% Creating a simple neural FF (feed-forward) network. 

% Min/max matrix. Columns represent [min, max], and rows represent
% variables.
R = [0 1;
     0 1;
     0 1];

% Size matrix.
S = [5 1];

net = newff(R, [4 1], {'tansig', 'purelin'});

% Train the neural network using the randomly generated data from earlier.
net = train(net, I, O);

O_new = sim(net, I);
plot(1:1000, O, 1:1000, O_new);
scatter(O, O_new);

net.IW{1}
net.LW{2, 1}

