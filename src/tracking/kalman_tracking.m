function [R,H,Q,P,dt,A,g,Bu,xp]=kalman_tracking(predict,x,xp,R,H,Q,P,dt,A,g,Bu)
%kalman filter

% % Kalman parameters
% R=[[0.2845,0.0045]',[0.0045,0.0455]'];
% H=[[1,0]',[0,1]',[0,0]',[0,0]'];
% Q = 0.01*eye(4);
% P = 100*eye(4);
% dt=1;  
% A=[[1,0,0,0]',[0,1,0,0]',[dt,0,1,0]',[0,dt,0,1]'];
% g = 6; % pixels^2/time step
% Bu = [0,0,0,g]';    


% Kalman update
if predict ==1
    xp=A*x' + Bu;
end
% update step
if predict ==0
    PP = A*P*A' + Q;
    K = PP*H'*inv(H*PP*H'+R);
    xp = (xp + K*([x(1),x(2)]' - H*xp));  %[cc(i),cr(i)]
    P = (eye(4)-K*H)*PP;
end

