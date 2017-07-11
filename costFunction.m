function [jVal, gradient] = costFunction(theta)
  jVal = (theta(1) - 3)^2 + (theta(2) - 5)^2;
  gradient = zeros(2, 1);
  gradient(1) = 2*(theta(1)-3);
  gradient(2) = 2*(theta(2)-5);