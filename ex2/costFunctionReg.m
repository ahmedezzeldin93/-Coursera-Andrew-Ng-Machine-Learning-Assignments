function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

H = sigmoid(X * theta);
y1 = -y .* log(H);
y2 = (1 - y) .* log(1 - H);
S =  1 / m * sum(y1 - y2);
R = lambda / (2 * m) * sum(theta(2:end) .^ 2);
J = S + R;

grad(1) = (1 / m) * sum((H - y) .* X(:, 1));
for i = 2:size(theta, 1)
    grad(i) = (1 / m) * sum((H - y) .* X(:, i)) + lambda / m * theta(i);
end





% =============================================================

end
