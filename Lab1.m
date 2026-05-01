%% Problem 1

n = input('Enter number of natural numbers: ');

arr = zeros(1, n);        
value = 1;               

for i = 1:n
    arr(i) = value;      
    value = value + 1;   
end

disp(arr)

%% Problem 2

p2 = [4 1 3; 2 6 7; 3 1 8];
min_val = min(p2(:))
[r, c] = find(p2 == min_val);
% updating value
p2(r, c) = 10;
p2

%% Problem 3
fprintf("Original:\n");
p3 = [4 1 3; 2 6 7; 3 1 8];
disp(p3);

col_sorted = sort(p3);
fprintf("Column Sorted:\n")
disp(col_sorted);

row_sorted = sort(p3, 2);
fprintf("Row Sorted:\n");
disp(row_sorted);

%% Prolem 4 
x = 0:12;
% original equation is 4y = 12 - 2x which brings us to 
y = 3 - (x/2);

disp('Points lying on the line 2x + 4y = 12:');
disp([x' y']);

plot(x, y, 'green');
grid on;
xlabel('x-axis');
ylabel('y-axis');
title('Line: 2x + 4y = 12');


%% Problem 5
% for the equations 2x + 4y = 12
% for the equations 3x + 2y = 1 

A = [2 4; 3 2];

B = [12; 1];
X = A \ B; % same as inv(A) * B
X = inv(A) * B;

fprintf("The intersection points are: \n")
disp(X)