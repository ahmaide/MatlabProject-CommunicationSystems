n=500;
fm=1
fc=25
Ka=0.25
tau=0.76;
so=1+0.25;
to=0;
for i=1:n
 t(i)=i/250;
 ideEnv(i)=(1 + Ka.*cos(2.*pi.*fm.*t(i)));
 s(i)=ideEnv(i).*cos(2.*pi.*fc.*t(i));
 if s(i)==ideEnv(i)
 to=t(i);
 so=s(i);
 end
 d=so.*exp(-(t(i)-to) / 0.6);
 pracEnv(i)=0;
 if d>s(i)
 pracEnv(i)=d;
 else
 pracEnv(i)=ideEnv(i);
 end
end
plot(t,pracEnv,'-',t,s,'-',t,ideEnv,'-');
xlabel("Time");
ylabel("Final Signal");
title("practical and ideal envelope dectector outputs");
