close all;


figure
axes('FontSize',10);
plot(hist_u.time,hist_u.signals.values,'k','linewidth',1);
title('Control Signal u(t)');
xlabel('time t');

figure
axes('FontSize',10);
hold on;
plot(hist_x.time,hist_x.signals.values(:,1),'r','linewidth',1);
hold on;
plot(hist_x.time,hist_x.signals.values(:,2),'b--','linewidth',1);
hold on;
plot(hist_x.time,hist_x.signals.values(:,3),'g','linewidth',1);
% title('x_m(t), x(t), r(t) (L1)');
xlabel('time t');
legend({'x_{des}','x','r'},'Location','southeast')
