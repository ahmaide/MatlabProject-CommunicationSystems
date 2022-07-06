fm=1
k=0.25
Am=1
u=k.*Am
t=0:0.000001:2;
de=(1 + u.*cos(2.*pi.*fm.*t))
y=abs(de)
plot(t,y)
ylim([0 1.5])
xlabel("Time")
ylabel("Demodulated Signal")
title("Message passed throught an envelope detector")
