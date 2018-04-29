function a=relu(z)
a=zeros(size(z));
for i=1:length(z(:))
    a(i)=max(0,z(i));
end