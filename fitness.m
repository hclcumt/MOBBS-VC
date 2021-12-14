function f1=fitness(pop,data)
LX=data;
NLX=-LX;
f1=0;
    for i=1:length(pop)
        f1=f1+NLX(pop(i));
    end

%     u=0;
%     c=[];
%     a=[];
%     fc=0;
%   
%     newdata=[];
%    for j=1:length(pop)
%         newdata=[newdata data(pop(j))];
%    end
%    [h,w]=size(newdata);
%   
%         u=mean2(newdata);
%         c=newdata-u;
%         a=c.*c;
%         fc=sum(sum(a))/(h*w);
%         f1=-sqrt(fc);
%   




end