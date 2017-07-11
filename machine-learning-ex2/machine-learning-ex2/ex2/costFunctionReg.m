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
hypothesis = sigmoid(X*theta);
first_term = -(y'*log(hypothesis));

second_term = -(1 - y)'*log(1 - hypothesis);
inside = first_term + second_term;
J = inside / m;
theta_without_1 = theta(2:size(theta));
J = J + ((lambda/(2*m))*sum(theta_without_1 .^ 2));
%disp(size(J));



grad = ((hypothesis - y)'*X)/m;
%disp(size(grad));
grad_without_1 = grad(2:size(grad,2)) + (theta_without_1*(lambda/m))';
grad = [grad(1),grad_without_1];
%disp(size(grad));

% =============================================================

end
