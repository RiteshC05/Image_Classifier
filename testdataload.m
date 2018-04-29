Xtest=zeros(10,3072);
srcFiles = dir('C:\Users\Ritesh\Desktop\brainscans\train\*.png');  % the folder in which ur images exists
j=10001;
for i = 1 : 10
    filename = strcat('C:\Users\Ritesh\Desktop\brainscans\train\',srcFiles(j).name);
    j=j+1;
    Xtemp=imread(filename);
    imshow(Xtemp);
    Xtest(i,:) = reshape(Xtemp,[3072,1]);
    Xtest(i,1:1024)=Xtest(i,1:1024)-mean(Xtest(i,1:1024));
    Xtest(i,1:1024)=Xtest(i,1:1024)/std(Xtest(i,1:1024));
    Xtest(i,1025:2048)=Xtest(i,1025:2048)-mean(Xtest(i,1025:2048));
    Xtest(i,1025:2048)=Xtest(i,1025:2048)/std(Xtest(i,1025:2048));
    Xtest(i,2049:3072)=Xtest(i,2049:3072)-mean(Xtest(i,2049:3072)); 
    Xtest(i,2049:3072)=Xtest(i,2049:3072)/std(Xtest(i,2049:3072));    

end

%X=I;
%X=zeros(50000,3073);
%X(:,1)=ones(50000,1);
%X(:,2:3073)=I;
%temp=csvread('trainlabels.csv',0,0,[0,0,499,1]);
T=readtable('trainlabels.csv');
exT=T{10001:10010,{'label'}};
Ytest=zeros(10,10);
for i=1:10
    if(strcmp(exT(i),"frog"))
    Ytest(i,1)=1;
    disp("frog");
    end
    if(strcmp(exT(i),"truck"))
    Ytest(i,2)=1;
    disp("truck");
    end
    if(strcmp(exT(i),"deer"))
    Ytest(i,3)=1;
    disp("deer");
    end
    if(strcmp(exT(i),"ship"))
    Ytest(i,4)=1;
    disp("ship");
    end
    if(strcmp(exT(i),"airplane"))
    Ytest(i,5)=1;
    disp("airplane");
    end
    if(strcmp(exT(i),"automobile"))
    Ytest(i,6)=1;
    disp("automobile");
    end
    if(strcmp(exT(i),"horse"))
    Ytest(i,7)=1;
    disp("horse");
    end
    if(strcmp(exT(i),"cat"))
    Ytest(i,8)=1;
    disp("cat");
    end
    if(strcmp(exT(i),"dog"))
    Ytest(i,9)=1;
    disp("dog");
    end
    if(strcmp(exT(i),"bird"))
    Ytest(i,10)=1;
    disp("bird");
    end
end

 
 
    

    