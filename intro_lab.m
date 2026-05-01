%% MATLAB MATRIX COMMANDS – QUICK REFERENCE

% 1. Creating and assigning matrices
A = [1 2 3;        % Manual matrix assignment
     4 5 6;
     7 8 9];

row = [1 2 3 4];   % Row vector
col = [1; 2; 3; 4]; % Column vector

A(2,3) = 10;       % Assign single element (row 2, col 3)

% 2. Special matrices
Z = zeros(3,4);    % Matrix of zeros (3x4)
O = ones(2,3);     % Matrix of ones (2x3)
I = eye(3);        % Identity matrix (3x3)

% 3. Size and shape
sz = size(A);      % [rows columns]
len = length(A);   % Largest dimension
n = numel(A);      % Total elements

% 4. Matrix arithmetic
B = [1 0 1;
     2 1 0;
     3 2 1];

C1 = A * B;        % Matrix multiplication
C2 = A .* B;       % Element-wise multiplication
C3 = A ./ B;       % Element-wise division

% 5. Power operations
Mpow = A^2;        % Matrix power (A*A), square matrices only
Epow = A.^2;       % Element-wise square

p1 = pow2(3);      % 2^3
p2 = pow2(A);      % 2.^A (element-wise)

% 6. Linear algebra operations
At = A';            % Transpose
d = det(A);         % Determinant
Ai = inv(A);        % Inverse (avoid in practice if possible)

% Preferred way to solve Ax = b
b = [1; 2; 3];
x = A \ b;          % Better than inv(A)*b

% 7. Indexing and slicing
r1 = A(1,:);        % First row
c2 = A(:,2);        % Second column
sub = A(2:3,1:2);  % Submatrix

% 8. Concatenation
H = [A B];          % Horizontal concatenation
V = [A; B];         % Vertical concatenation

% 9. Logical operations
L1 = A > 5;         % Logical matrix
L2 = A == 10;       % Equality check

% find
P = [1 2 3 ; -1 5 1 ; 2 1 5];
[r, c] = find(P == 1) % will give position(s) of the element

%% Plotting

X1 = 0 :0.1: pi;
Y1 = sin(X1);

X2 = 0 : pi;
Y2 = sin(X2);

plot(X1, Y1, 'R', X2, Y2, 'G')

hold on % Will merge the above plot and the following ones, since plots have only one window

Y3 = cos(X1);
plot(X1, Y3, 'B')

%% conditionals

% For each if, an end is required 
% but that is not the case for elseif
% !! else if will lead to a nested if condition and will require another if

x = 10;

if x > 0
    disp('x is positive')

elseif x == 0
    disp('x is zero')

else
    disp('x is negative')

end

% This is syntactically valid but logically nested
if a > 5
    disp('A')

else if a == 5
    disp('B')

else
    disp('C')
end
end

%% 