%% Ques Max z = x1 + 2*x2
% st -> -x1 + x2 <= 1
%     ->  x1 + x2 >= 2
%     ->  x1, x2 >= 0

% Standard Form (Introducing Slack Variables)
% Max z = x1 + 2*x2 + 0*x3 + 0*x4
% -x1 + x2 + x3 = 1
%  x1 + x2 + x4 = 2
% x1, x2, x3, x4 >= 0

%% Phase 1: Input Parameters
clc;
clear all;
close all;

C = [1 2 0 0];          % Cost vector
A = [-1  1  1  0;       % Constraint matrix
      1  1  0  1];
b = [1; 2];             % RHS vector

z = @(X) C*X;

m = size(A,1);          % Number of constraints
n = size(A,2);          % Number of variables

%% Phase 2: Basic Solution Set & Basic Feasible Solution Set
basicsol = [];
bfsol = [];

ncm = nchoosek(n,m);
pair = nchoosek(1:n,m);

for i = 1:ncm
    basicvar_index = pair(i,:);
    y = zeros(n,1);
    
    X = A(:,basicvar_index)\b;
    y(basicvar_index) = X;
    
    basicsol = [basicsol y];
    
    if all(X >= 0)
        bfsol = [bfsol y];
    end
end

disp('Basic Solution Set:');
disp(basicsol)

disp('Basic Feasible Solution Set:');
disp(bfsol)

%% Phase 3: Optimal Solution and Optimal Value
cost = z(bfsol);
[opt_val, index] = max(cost);
optsol = bfsol(:,index);

disp('Optimal Solution:');
disp(optsol)

disp('Optimal Value:');
disp(opt_val)
