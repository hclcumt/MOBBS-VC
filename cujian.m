function cujian_pbest=cujian(NCen,pbest,AC,K,data,long,high,LX)
    for i=2:K
        nowAC=AC{i};
        nowbest=pbest{i};
        nowcenter=NCen{i};
        %����ѧϰ
        if i<K
             upbest=pbest{i+1};
             newbest=nowbest(1:i);
            for j=1:i
                if rand>0.5
                    newbest=nowbest(1:i);
                    a=newbest(j);
                    newbest(j)=upbest(j);
%                       f1=fitness(newbest,LX)
                      f1=fitness1(newbest,data);
                    %��������򻻻�ȥ
                    if f1>nowbest(i+1)
                       newbest(j)= a;
                    else
                       nowbest(1:i)=newbest;
                       nowbest(i+1)=f1;
                    end
                    
                end 
            end
            
        end
        %��С��ѧϰ
        if i>2
            newbest=nowbest(1:i);
            downbest=pbest{i-1};
            downAC=AC{i-1};
            
            for k=1:(i-1)
                %��������������
                if rand>0.5
                    b=newbest(k);
                    if ~isempty(find(downbest(k)==nowAC{i}, 1))
                        newbest(k)=downbest(k);
%                        f1=fitness1(newbest,data);
                         f1=fitness(newbest,LX);
                        if f1>nowbest(i+1)
                           newbest(j)= b;
                        else
                           nowbest(1:i)=newbest;
                           nowbest(i+1)=f1;
                        end
                    %������������
                        
                    end
                end
            end
            %�����һά���в���
            if rand>0.5
                c=newbest(i);
                newbest(i)=nowcenter(i);
%                  f1=fitness(newbest,LX)
                 f1=fitness1(newbest,data);
                        if f1>nowbest(i+1)
                           newbest(j)= c;
                        else
                           nowbest(1:i)=newbest;
                           nowbest(i+1)=f1;
                        end
            end
            
        end
        cujian_pbest{i}=nowbest;
    end
    
end