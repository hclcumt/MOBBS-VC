function  bound_xgd_ALL = xiangguanxing_ALL(him,bound_date_huidu)
%bound_bxgd = zeros(him,him);%不相关度
bound_xgd_ALL= zeros(him,him);
num_NAN=0;
for ii = 1:him
    bound_jz_i = mean2(bound_date_huidu(:,:,ii));
    for jj = 1:him
        bound_jz_j = mean2(bound_date_huidu(:,:,jj));
        bound_xgd_ALL(ii,jj) = (mean2((bound_date_huidu(:,:,ii)-bound_jz_i).*(bound_date_huidu(:,:,jj)- bound_jz_j)))/(sqrt(mean2((bound_date_huidu(:,:,ii)-bound_jz_i).^2)*mean2((bound_date_huidu(:,:,jj)- bound_jz_j).^2)));
        if(bound_xgd_ALL(ii,jj))==0
            bound_xgd_ALL(ii,jj)=0.001;
        elseif bound_xgd_ALL(ii,jj)==inf
            bound_xgd_ALL(ii,jj)=10000000000;
        end
    end
end 
 bound_xgd_ALL(isnan( bound_xgd_ALL)) = 0 ;%去除NAN 
 bound_xgd_ALL=abs(bound_xgd_ALL);
end
