function distance=double_xiangguan(him,bound_date_huidu)

bound_xgd_ALL=xiangguanxing_ALL(him,bound_date_huidu);
huxinxi_A=huxinxi_ALL(bound_date_huidu,him);
    for i=1:him
        for j=1:him
            distance(i,j)=sqrt(bound_xgd_ALL(i,j)^2+huxinxi_A(i,j)^2);
        end
    end
    
end