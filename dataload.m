X=zeros(10000,3072);
srcFiles = dir('C:\Users\Ritesh\Desktop\brainscans\train\*.png');  % the folder in which ur images exists
for i = 1 : 10000
    filename = strcat('C:\Users\Ritesh\Desktop\brainscans\train\',srcFiles(i).name);
    Xtemp=imread(filename);
    X(i,:) = reshape(Xtemp,[3072,1]);
    X(i,1:1024)=X(i,1:1024)-mean(X(i,1:1024));
    X(i,1:1024)=X(i,1:1024)/std(X(i,1:1024));
    X(i,1025:2048)=X(i,1025:2048)-mean(X(i,1025:2048));
    X(i,1025:2048)=X(i,1025:2048)/std(X(i,1025:2048));
    X(i,2049:3072)=X(i,2049:3072)-mean(X(i,2049:3072)); 
    X(i,2049:3072)=X(i,2049:3072)/std(X(i,2049:3072));    

end

%X=I;
%X=zeros(50000,3073);
%X(:,1)=ones(50000,1);
%X(:,2:3073)=I;
%temp=csvread('trainlabels.csv',0,0,[0,0,499,1]);
T=readtable('trainlabels.csv');
exT=T{1:10000,{'label'}};
Y=zeros(10000,10);
for i=1:10000
    if(strcmp(exT(i),"frog"))
    Y(i,1)=1;
    end
    if(strcmp(exT(i),"truck"))
    Y(i,2)=1;
    end
    if(strcmp(exT(i),"deer"))
    Y(i,3)=1;
    end
    if(strcmp(exT(i),"ship"))
    Y(i,4)=1;
    end
    if(strcmp(exT(i),"airplane"))
    Y(i,5)=1;
    end
    if(strcmp(exT(i),"automobile"))
    Y(i,6)=1;
    end
    if(strcmp(exT(i),"horse"))
    Y(i,7)=1;
    end
    if(strcmp(exT(i),"cat"))
    Y(i,8)=1;
    end
    if(strcmp(exT(i),"dog"))
    Y(i,9)=1;
    end
    if(strcmp(exT(i),"bird"))
    Y(i,10)=1;
    end
end

 
 
    

    