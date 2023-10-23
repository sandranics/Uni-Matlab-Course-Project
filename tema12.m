function tema12

%Parametri
t_max = 8;
L= pi;
x=0:0.05:L;
t=0:t_max/100:t_max;

%Funkciq phi(x)
function y=phi(x)
    for i=1:length(x)
        if x(i) >= 0 && x(i) <= 1 
            y(i) = sin(3*x(i)); 
        else 
            y(i) = sin(3*x(i))-5*(x(i)-1)^3*(sin(x(i)))^3;
        end
    end
end

% Funkciq u(x,t)
function y=u(x,t)
 y=0;
%55-ta chastichna suma
    for k=0:54 
         Xk=sin((2*k+1)*x/2); % sobstveni funkcii
         Ak=trapz(x, phi(x).*Xk)*(2/pi);
         Tk=Ak*exp((-((2*k+1)/2).^2)*t/7);
         y=y+Tk*Xk;
    end
end

for n=1:length(t)
     plot(x,u(x,t(n)))
     axis([0,pi,-3,3])
     M(n)=getframe;
end
movie(M,1)

%Grafiki v 3 razlichni momenta ( t1=0, t2=1, t3=8 )
subplot(3,1,1)
plot(x,u(x,0))
title('t1=0')
axis([0,pi,-3,3])

subplot(3,1,2)
plot(x,u(x,1))
title('t2=1')
axis([0,pi,-3,3])

subplot(3,1,3)
plot(x,u(x,8))
title('t3=8')
axis([0,pi,-3,3])
end