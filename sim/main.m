
# Robot parameters
l = 100;  

axis([-l*1.1 l*1.1 -l*1.1 l*1.1]);
axis('equal');
grid on;

# Draw the robot
hold on;
  link1 = [0,0;l/2,0];
  link2 = [l/2,0;l,0];

  plot(link1(1:2),link1(3:4),'-r');
  plot(link2(1:2),link2(3:4),'-r');
hold off;

