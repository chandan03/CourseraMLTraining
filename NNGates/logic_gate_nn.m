function [Theta1_new, J] = logic_gate_nn(TRUTH_TABLE, Theta1, init_w, alpha, learn)
  layer1_units = size(TRUTH_TABLE,2);
  % disp("Size of layer1_units :: "), disp(layer1_units);
  layer2_units = 1;
  % disp("Size of Theta1 before :: "), disp(size(Theta1));
  if(init_w == 0)
    Theta1 = 2*rand(1,layer1_units)-1;
  endif
  % disp("Size of Theta1 after :: "), disp(size(Theta1));
  m = size(TRUTH_TABLE,1);
  X = [ones(m,1), TRUTH_TABLE(:,1:end-1)];
  y = TRUTH_TABLE(:,end);
  
  # accumulators for the partial derivatives
  Theta1_grad = zeros(size(Theta1));
  # cost function value
  J = 0.0;
  Delta1 = zeros(size(Theta1));
  for i = 1:m
    a1 = X(i,:); % 1 X 3
    z1 = Theta1*a1';
    a2 = sigmoid(z1);
    
    J = J + ( y(i) * log(a2) ) + ( (1 - y(i)) * log(1 - a2) );
    
    % Update grad using backpropogation
    if (learn == 1)
    delta2 = a2 - y(i);
    Delta1 = Delta1 + delta2'*a1;
    else
      
      if(a2 > 0.5)
        disp('Hypothesis for '), disp(TRUTH_TABLE(i,1:end-1)), disp('is '), disp(a2), disp('Final :: '), disp(1);
        else
        disp('Hypothesis for '), disp(TRUTH_TABLE(i,1:end-1)), disp('is '), disp(a2), disp('Final :: '), disp(0);
      endif
    endif
  endfor  
  J = J / -m;
  % disp("Value of J :: "), disp(J);
  Theta1_grad = Delta1/m;
  
  lambda = 1;
  
  % Theta1_grad_removed_bias = Theta1_grad(:,2:end);
  % Theta1_grad_removed_bias = Theta1_grad_removed_bias + (lambda/m)*Theta1(:,2:end);
  % Theta1_grad = [Theta1_grad(:,1) Theta1_grad_removed_bias];
  % disp(size(Delta1));
  
  % Applying gradient descent to optimize J
  % disp(size(Theta1));
  % disp(size(Theta1_grad));
  % disp("Value of alpha :: "), disp(alpha);
  if(learn == 1)
  Theta1 = Theta1 - (alpha * Theta1_grad);
  endif
  % disp(size(Theta1));
  Theta1_new = Theta1;
endfunction  