function S2015510012(n,x,A,B,C)
%{ 
 IMPORTANT NOTE FOR USER
 YOU SHOULD DEFÝNE THE n and x before call the function 2015510012
 (Furkan AYAS)
like you define
n = -12:12 after you define x like
x = [0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1]
13 zeros and 12 ones for same length with n

and than you should call the function 2015510012(n,x,A,B,C)

A B C can be every value on every type

the assigment incluede just B and C integers for shrink but my
 asiggment can execute for every type value, it can make
 strech operations too

THANK YOU FOR THE TIME
%}


%A can be double, B C integer
% x = at least 25 elemenets 1D Vector array

%To find y = 2.5x[2n+3] we write [n,y] = myTransform(x,2.5,2,3).
% 1x[1n+4] n - (-4)

%y = (A*x)*[B*n+C];
% A corresponds to scaling   
% B to stretching/shrinking
% C to time shift

nn = n(1):1:n(end);%index
    %subplot(511)
    subplot(411)
    stem(nn,x,'k','LineWidth',2)
    title('Normal function')
    
%****************** B) Strech and Shrink operations******************   
b1 = abs(B);
%Stretch by interpolation
%xi = interp(x,a); %stretch to twice sample size
%index for stretched function
if(0<b1 & b1<1)
    xi = interp(x,(1/b1)); %stretch to twice sample size
    %ni = -50:50;
    %subplot(512)
    subplot(412)
     ni = ((n(1)*(1/b1))):(n(end)*(1/b1)+1);
   % ni = ((n(1)*(1/b1))-(1)):(n(end)*(1/b1));
    stem(ni,xi,'k','LineWidth',2)
    title('Stretched function')
    n = ni
    x = xi
    clc


%Shrinking
%xs = decimate(x,a);
elseif(b1>=1)
    xs = decimate(x,b1);
    ns = (n(1)/b1):(n(end)/b1);
    %subplot(512)
    subplot(412)
    stem(ns,xs,'k','LineWidth',2)
    if(b1 == 1)
        title('T time same function')
    else
    title('Shrinking function')
    end
    n = ns
    x = xs

    
end



%*************** Time Shift ************************************ 
b1 = abs(B);
if(C == 0)
    fprintf('%d no time shift \n',C);
elseif(C<0)
  %  elseif(B>0 & C<0)
    fprintf('%d delay \n',C);
    del = abs((1/B)*C);
    %subplot(513)
    subplot(413)
    stem(n+del,x,'k','LineWidth',2)
    axis([min(n)-5 max(n)+5 min(x) max(x)])
    title('Shifted function x[n-C]')
    
   %   n2 = (n(1)+del):(n(end)+del);
    %  n = n2;
    
    grid on

    
elseif(C>0)
   % elseif(B>0 & C>0)
    fprintf('%d advance \n',C);
    del = abs((1/B)*C);
     %subplot(513)
    subplot(413)
    stem(n-del,x,'k','LineWidth',2)
    axis([min(n)-5 max(n)+5 min(x) max(x)])
    title('Shifted function x[n]+C')
    
    n3 = (n(1)+del):(n(end)+del);
      n = n3;
    
grid on
%{
elseif(B<0 & C<0)
    fprintf('%d advance \n',C);
    del = abs(B*C);
     %subplot(513)
    subplot(413)
    stem(n-del,x,'k','LineWidth',2)
    axis([min(n)-5 max(n)+5 min(x) max(x)])
    title('Shifted function x[n+C]',del)
elseif(B<0 & C>0)
    fprintf('%d delay \n',C);
    del = abs(B*C);
      %subplot(513)
    subplot(413)
    stem(n+del,x,'k','LineWidth',2)
    axis([min(n)-5 max(n)+5 min(x) max(x)])
    title('Shifted function x[n-C]')
  
   % fprintf('x-%d \n',del);
   
    grid on
%}
end








%***************** IF B is negative than Axis Reversal ****************

if(B<0)
    x = fliplr(x); %reversed axis
    subplot(414)
    stem(n,x,'k','LineWidth',2)
    axis([min(n)-5 max(n)+5 min(x) max(x)])
    title("Axis reversal x[n]")
    grid on
   
elseif (B>0)
    subplot(414)
    stem(n,x,'k','LineWidth',2)
    axis([min(n)-5 max(n)+5 min(x) max(x)])
    title("Non-axis reversal x[n]")
    grid on
end


%****************** A) Multiplication operations******************

i1 = 0;
if(A == 0)
   for i1=1:length(x)
        x(i1) = 0;
   end
    
    fprintf("you make zero all values %d \n",A);
    
    subplot(515)
    stem(n,x,'k','LineWidth',2)
    %axis([min(n)-5 max(n)+5 min(x) max(x)])
    title('Original function x[n]')
    grid on
else
    fprintf("all values multi %d \n",A);
    
    temp = 0;
    for i1=1:length(x)
        temp = A*(x(i1))
        x(i1) = temp
       
    end
    
    subplot(515)
    stem(n,x,'k','LineWidth',2)
    %axis([min(n)-5 max(n)+5 min(x) max(x)])
    title('A multi.')
    grid on

end

%****************************************************** 
clc
fprintf('%dx*[%dn+%d] scaling \n',A,B,C);

fprintf('%d scaling \n',A);
fprintf('%d stretching/shrinking \n',B);
fprintf('%d time shift \n',C);


end

