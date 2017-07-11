TRUTH_TABLE_FOR_NOT = [0 1;1 0];
TRUTH_TABLE_FOR_OR = [0 0 0; 0 1 1; 1 0 1; 1 1 1];
TRUTH_TABLE_FOR_AND = [0 0 0; 0 1 0; 1 0 0; 1 1 1];
INITIAL_THETA_FOR_NOT = [0 0];
INITIAL_THETA_FOR_OR = [0 0 0];
INITIAL_THETA_FOR_AND = [0 0 0];

TRUTH_TABLE = TRUTH_TABLE_FOR_AND;
THETA1 = INITIAL_THETA_FOR_AND;
alpha = 0.002;
theta_cur = logic_gate_nn(TRUTH_TABLE, THETA1, 0, alpha, 1);
for iter = 1:10000
  [theta_cur, J] = logic_gate_nn(TRUTH_TABLE, theta_cur, 1, alpha, 1);
  % if (mod(iter,10000) == 0)
  %  fprintf("Iteration :: %d, J :: %f\n", iter, J);
  %  disp('theta value :: '), disp(theta_cur);
  % endif 
endfor  

[theta_cur, J] = logic_gate_nn(TRUTH_TABLE, theta_cur, 1, alpha, 0);

% disp("J :: "), disp(J);

% disp("Final theta :: "), disp(theta_cur);

