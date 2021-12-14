function LX=sandu(bound_date,him)
    u=0
    c=[];
    a=[];
    fc=0;
    LX=[];
    [h,w,h]=size(bound_date);
    for i=1:him
        u=mean2(bound_date(:,:,i));
        c=bound_date(:,:,i)-u;
        a=c.*c;
        fc=sum(sum(a))/(h*w);
        LX(i)=sqrt(fc);
    end


    
end