fm = 1;
fc = 25;
Ka = 0.25;
tau_min =1/fc; % tau >= 1/fc
tau_max =1/fm; % tau <= 1/fm
tau = tau_min:0.01:tau_max;
Ptau=length(tau); % number of tau points
t = 0:0.01:2;
Pt=length(t) ; % number of signal points
ideEnv=1 + Ka*cos(2*pi*fm*t); % Theoratical envelop
S=ideEnv.*cos(2*pi*fc*t); % Modulated signal
%% This loop will go on all values of tau
%% And calculate the mean square error
for i=1:Ptau 
 pracEnv(1,1)=1+Ka;
 %% This loop will go on each practical envolope 
 %% For each value of tau
 for n=1:Pt-1
 %% Diode is on
 if pracEnv(1,n)<S(1,n)
 pracEnv(1,n+1)= S(1,n);
 %% Diode is off
 else
 pracEnv(1,n+1)=pracEnv(1,n)*exp(-0.01/tau(1,i));
 end
 end
 %% The calculation of the mean square error (d)
 d(1,i)=(norm((pracEnv-ideEnv)).^2)/Pt;
end
[~,minError]=min(d);
%% Getting the value of tau
%% That has the least mean square error
bestValue = tau(1, minError);
plot(tau,d);
xlabel('1/fc < tau < 1/fm');
ylabel('Mean square error');
title('Mean square error plot');