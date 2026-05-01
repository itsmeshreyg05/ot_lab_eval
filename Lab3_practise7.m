clc;
clear;

%% Phase 1: Input
C = [3 4];
Z = @(x1, x2) 3*x1 + 4*x2;

A = [1 1;
     2 1;
     1 2;
     1 0;
     0 1];

b = [10;
     15;
     16;
     7;
     7];

%% Phase 2: Plot constraints
x1 = linspace(0,8,500);

figure
hold on
grid on
xlabel('x1')
ylabel('x2')

for i = 1:size(A,1)
    if A(i,2) ~= 0
        x2 = (b(i) - A(i,1)*x1)/A(i,2);
        plot(x1, x2, 'LineWidth', 2)
    else
        % vertical line: x1 = b/A(1)
        xline(b(i), 'LineWidth', 2)
    end
end

%% Phase 3: Find intersection (corner) points
Aeq = [A;
       eye(2)];
beq = [b;
       0;
       0];

pt = [];
m = size(Aeq,1);

for i = 1:m
    for j = i+1:m
        M = [Aeq(i,:); Aeq(j,:)];
        B = [beq(i); beq(j)];
        
        if det(M) ~= 0
            X = M\B;
            if all(X >= 0)
                pt = [pt X];
            end
        end
    end
end

pt = unique(pt','rows')';

%% Phase 4: Feasible points
FP = [];
z = [];

for i = 1:size(pt,2)
    x1p = pt(1,i);
    x2p = pt(2,i);
    
    if ( x1p + x2p <= 10 && ...
         2*x1p + x2p <= 15 && ...
         x1p + 2*x2p <= 16 && ...
         x1p <= 7 && ...
         x2p <= 7 )
     
        FP = [FP pt(:,i)];
        plot(x1p, x2p, 'ro', 'MarkerSize', 8, 'LineWidth', 2)
        z = [z Z(x1p,x2p)];
    end
end

%% Phase 5: Optimal values
[optimal_val_min, idx_min] = min(z);
optimal_sol_min = FP(:,idx_min);

[optimal_val_max, idx_max] = max(z);
optimal_sol_max = FP(:,idx_max);

fprintf('Minimum Value: %.2f at (%.2f, %.2f)\n', ...
        optimal_val_min, optimal_sol_min(1), optimal_sol_min(2));

fprintf('Maximum Value: %.2f at (%.2f, %.2f)\n', ...
        optimal_val_max, optimal_sol_max(1), optimal_sol_max(2));
