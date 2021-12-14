function hd=hist(bound_date_huidu,num_100)
    [~,~,n]=size(bound_date_huidu);
    pencent=ceil(num_100*256);
    for i=1:n
        [count,~]=imhist(bound_date_huidu(:,:,i));
        
        scount=sort(count,'descend');
        
        hd(i)=sum(scount(1:pencent))/(pencent);
    end
end