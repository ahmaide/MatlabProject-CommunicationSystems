fm=1
fc=25
k=0.25
Ac=1
Am=1
u=k.*Am
t=0:0.000001:2;
s=(1 + u.*cos(2.*pi.*fm.*t)).*cos(2.*pi.*fc.*t)
plot(t,s)
xlabel("Time")
ylabel("S(t)")
title("The plot of S(t)")
