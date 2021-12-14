function [npop,nbest]=cunei(NCen,pop_all,pbest,K,pop_size,AC,data,long,high,LX)
    [nowpbest_location,nowpop_location]=weizhi_ltor(NCen,pop_all,pbest,K,pop_size,AC);
%将数值转化成位置排序
    for i=2:K
        nowpop_a=[];
        nowpop_a=nowpop_location{i};
        nbest_a=nowpbest_location{i};
       
       Foods=nowpop_a(:,1:i);
        Foodval=nowpop_a;
            
        
%y运行蜂群算法        
        [Foodval,pbest]=nABC(AC,Foods,Foodval,pop_size,nbest_a,i,data,long,high,LX);
        npop{i}=Foodval;
        nbest{i}=pbest;
    end
    
end