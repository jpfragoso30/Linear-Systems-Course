% a)
n=[5 0];
d=[1 2 101];
f=1;
T=1/f;
w=2*pi*f;
t=0:T/100:10*T;
figure(1), bode(n,d)
u=cos(w*t);
grid on
[y,x]=lsim(n,d,u,t);
figure(2), plot(t,y,'r',t,u,'b');
grid on
xlabel('seg')
ylabel('Amp')

% b)
% n=[1 3 2];
% d=[1 12 47 60];
% f=1;
% T=1/f;
% w=2*pi*f;
% t=0:T/100:10*T;
% figure(1), bode(n,d)
% u=cos(w*t);
% grid on
% [y,x]=lsim(n,d,u,t);
% figure(2), plot(t,y,'r',t,u,'b');
% grid on
% xlabel('seg')
% ylabel('Amp')