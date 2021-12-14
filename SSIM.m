function SS=SSIM(bound_date_huidu)
[long,high,him] = size(bound_date_huidu);
c1=(0.01*255)^2;
c2=(0.03*255)^2;
for a=1:him
    u(a)=mean(mean(bound_date_huidu(:,:,a)));
    f(a)=(std2(bound_date_huidu(:,:,a)))^2;
end
 for i=1:him
     u1=u(i);
     f1=f(i);
     V=bound_date_huidu(:,:,i);
     x=V(:);
    for j=1:him
        C=bound_date_huidu(:,:,j);
        y=C(:);
        u2=u(j);
        f2=f(j);
       
        sigmaxy=mean2(cov(x,y));
        SS(i,j)=((2*u1*u2+c1)*(2*sigmaxy+c2))/((u1^2+u2^2+c1)*(f1^2+f2^2+c2));
    end
 end

end