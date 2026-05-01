%% Max / min 3x1 + 5x2
% where s.t. are 
% 1x1 + 1x2 <= 4
% 1x1 + 3x2 <= 6
% x1, x2 >= 0

clc;
clear;

%% Phase 1, input parameter
C = [4, 3];
Z = @(x1, x2)3*x1 + 5*x2;

% Constraints 
A = [1 1; 1 3];
b = [4 ; 6];

% defining the st's functions 
C1 = @(x1, x2) x1 + x2 - 4;
C2 = @(x1, x2) x1 + 3*x2 - 6;

% number of constraitns
[m, n] = size(A);

%% Phase 2, plotting

x1 = 0:max(b./A(:, 1));

for i = 1:m
    x2 = (b(i)- A(i, 1) * x1) / A(i, 2);

    plot(x1, x2)
    hold on
end

%% Phase 3 Find intersection & corner points
% adding st's for x1 and x2 to be positive 
A = [A; eye(2)];
b = [b; zeros(2, 1)];

m = size(A, 1); % updating
pt = [];
for i = 1:m
    for j = i + 1: m 
        aa = [A(i, :); A(j, :)];
        bb = [b(i); b(j)];
        if (det(aa))
            X = aa \ bb;
            if(X >= 0)
                pt = [pt X];
            end
        end
    end
end

pt = unique(pt', "rows")';

disp(pt)


%% Phase 4 Find Feasable points 
FP = [];
z = [];
for i = 1:size(pt, 2) % 2 gives columns
    pt1 = pt(1, i); 
    pt2 = pt(2, i);
    if(C1(pt1, pt2) <= 0 && C2(pt1, pt2) <= 0)
        FP = [FP pt(:, i)]; % Store feasible points
        plot(pt1, pt2, '*r', 'MarkerSize', 10);
        cost = Z(pt1, pt2);
        z = [z cost];
    end
end

disp(FP)
disp(z)

%% Phase 5 finding optimal solution and value
[optimal_val_min, index_min] = min(z);
optimal_sol_min = FP(:, index_min);

% Display minimum solution
fprintf('Minimum Value: %.2f\n', optimal_val_min);
fprintf('Optimal Solution for Minimum: x1 = %.2f, x2 = %.2f\n', optimal_sol_min(1), optimal_sol_min(2));

[optimal_val_max, index_max] = max(z);
optimal_sol_max = FP(:, index_max);

% Display maximum solution
fprintf('Maximum Value: %.2f\n', optimal_val_max);
fprintf('Optimal Solution for Maximum: x1 = %.2f, x2 = %.2f\n', optimal_sol_max(1), optimal_sol_max(2));