function [cost1,totalcost,dW1,dW2,db1,db2]=costfunction(W1,W2,X,Y,b1,b2,reg)
N=size(X,1);
z1=X*W1+b1;
a1=relu(z1);
z2=a1*W2+b2;
a2=relu(z2);
%z2=z2-max(z2,[],2);
%pk1=exp(z2)./sum(exp(z2));
num=exp(z2);
den=sum(num,2);
pk=num./den;
cost1=-log(pk(Y>0));
%for i= 1:500
 %   cost=-log(pk(find(Y(i,:)>0)));
%end
regloss=0.5*reg*sum(sum(W1.*W1))+0.5*reg*sum(sum(W2.*W2));
totalcost=(1/N)*sum(cost1)+ regloss;

df=pk;
df(Y>0)=df(Y>0)-1;
df=df/N;
%df(z2<=0)=0;
dW2=a1'*df;
db2=sum(df);
da1=df*W2';
da1(z1<=0)=0;
dW1=X'*da1;
db1=sum(da1);
dW2=dW2+reg*W2;
dW1=dW1+reg*W1;
%dW2=df*


end