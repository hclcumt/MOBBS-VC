function cos=SMA(bound_date_huidu)
data=bound_date_huidu;
    [l,m,n]=size(data);
    for i=1:n
        a=reshape(data(:,:,i),1,l*m);
        for j=1:n
            b= reshape(data (:,:,j),1,l*m);
            cos(i,j)=acos(dot(a,b)/(norm(a)*norm(b)));
        end
    end
    cos=real(cos);
    cos=cos*(180/pi);
    
end