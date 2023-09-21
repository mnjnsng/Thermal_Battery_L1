clear all; close all;

%Example 5.11

%Plant system
%A=[0 1; -0.018 0.015];   
%b=[0; 1];

A=[0 1; -0.01 0.02]; b=[0; 1]; 
c=[1 0];
% Vivek: Theta * Phi  = 0.0827*x(1)*x(1)-0.012*x(2)*x(2); 

%Desired system
Am = [0 1; -1 -1.2]; 
%Am=[0 1; -1 -1.4]; 
kg=-1/(c*inv(Am)*b);
bm=b*kg;

%Am=[0 1; -4 -2];
%bm=[0;4];

%initial condition for x(state of the plant), xh(state of the state predictor), and x_des(state of the desired system)
x0=[0 0]; 
xh0=x0;
x_des0=x0;

%Unknown parameter bounds 
Thetaset=[-5 5];   
Sigmaset=[-10 10];
Omegaset=[0.1 2];

%Lyapunov design
Q=eye(2);
P=lyap(Am',Q);

%Adaptation gain, tune as needed.
gamma = 10000;
gamma_x = gamma;
gamma_r = gamma;
gamma_W = gamma;

%initial adaptation parameters
k_x0 = [0 0];
k_r0 = 0;
W0 = [0 0];



%k in the low pass filter C(s). A large k leads to a large bandwidth of C(s).
k=500; % Change this to ensure better tracking performance (baseline 10)

%%
