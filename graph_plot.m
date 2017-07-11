x = -1:0.1:1;
y = x.^2;
plot(x,y);
xlabel('time [s]');
ylabel('amplitude');
title('my plot');
legend('y(t)');

%% section 2
x = [10, 20];
z = mean(x);