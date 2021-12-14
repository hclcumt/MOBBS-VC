function huxinxi_ALL=huxinxi_ALL(bound_date_huidu,him)
    for i=1:him
        for j=1:him
           huxinxi_ALL(i,j)=huxinxi(bound_date_huidu(:,:,i),bound_date_huidu(:,:,j)) ;
        end
    end
end