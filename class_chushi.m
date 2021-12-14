function [center,class]=class_chushi(K,data,distance)
    [l,m,n]=size(data);
    for i=1:n
        data(l+1,:,i)=i;
    end
    %初始化类中心，和类
    class=zeros(1,n);
    center=randperm(n,K);
    for  i=1:K
        class(center(i))=i;
    end
    
end