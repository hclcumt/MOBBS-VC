function [pbest,pop_all]=chushihua(pop_size,K,AC,date,LX)
    for i=2:K
        p=[];
        nowAC=AC{i};
        for j=1:pop_size
            x=[];
            for k=1:i
                nowAC_k=nowAC{k};
                a=randperm((length(nowAC_k)),1);
                x(k)=nowAC_k(a);
            end
            f1=fitness(x,LX);
            p(j,:)=[x,f1];
        end
        [~,index]=sort(p(:,i+1));%降序排列最小化问题。
        pbest{i}=p(index(1),:);
        pop_all{i}=p;
    
    end



end