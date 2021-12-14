function [nowpbest_location,nowpop_location]=weizhi_ltor(NCen,pop_all,pbest,K,pop_size,AC)
%将数值转化成位置
    for i=2:K
        nowpbest_loc=[];
            nowAC_n=[];
            nowpop_loc=[];
        nowAC=AC{i};
        nowpop=pop_all{i};
        nowpbest=pbest{i};
        for j=1:i
            
            nowAC_n=nowAC{j};
            if isempty(find(nowAC_n==nowpbest(j), 1))
               whichS=NCen{i};
               whichcen=whichS(j);
               nowpbest_loc(j)=whichcen;
            else
               nowpbest_loc(j)=find(nowAC_n==nowpbest(j));
            end
            
            for k=1:pop_size
                if isempty(find(nowAC_n==nowpop(k,j), 1))
                     whichSize=AC{i};
                    whichC=whichSize(j);
                    a=randperm((length(whichC)),1);
                    nowpop_loc(k,j)=a;
                else
                    nowpop_loc(k,j)=find(nowAC_n==nowpop(k,j));
                end
                
            end
        end
        nowpbest_loc(j+1)=nowpbest(j+1);
        nowpop_loc(:,i+1)=nowpop(:,i+1);
        nowpbest_location{i}=nowpbest_loc;
        nowpop_location{i}=nowpop_loc;
        
    end

        
end
