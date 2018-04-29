clear all;close all;

load('dataload.mat');
W1=randn(3072,100)*0.12;
b1=zeros(1,100);
W2=randn(100,10);
b2=zeros(1,10);
reg=1e-3;
step_size=0.02e-0;
N=size(X,1);

for i=1:2000
    [cost,totalcost,dW1,dW2,db1,db2]=costfunction(W1,W2,X,Y,b1,b2,reg);
    if mod(i,100)==0
       disp(totalcost);
    end
    W1=W1-step_size*dW1;
    W2=W2-step_size*dW2;
    b1=b1-step_size*db1;
    b2=b2-step_size*db2;
end

z1=X*W1+b1;
a1=relu(z1);
z2=a1*W2+b2;
[val,i]=max(z2,[],2);
[val1,j]=max(Y,[],2);
accuracy=mean(i==j);
disp(accuracy);

z1=Xtest*W1+b1;
a1=relu(z1);
z2=a1*W2+b2;
[val,i]=max(z2,[],2);
[val1,j]=max(Ytest,[],2);
accuracy=mean(i==j);
disp(accuracy);

