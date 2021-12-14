function [Foodval,Foods_best]=nABC(AC,Foods,Foodval,popsize,nowpbest,D,data,long,high,LX)
FoodNumber=popsize; %/*The number of food sources equals the half of the colony size*/
iter=0;
trial=zeros(1,popsize);
limit=10;

    %%%%%%%%% EMPLOYED BEE PHASE %%%%%%%%%%%%%%%%%%%%%%%%
     newsols=[];
    nfoodval=[];
    
while (iter<2)
    iter=iter+1;
    for i=1:(FoodNumber)
        sol=nowpbest(1:D);
        ss1=randperm(FoodNumber,1);
        par=Foods(ss1,1:D);
        % Define Acceleration Coeff.
        phi=unifrnd(-1,+1,[1,D]);
        % New Bee Position
        newsols=sol+phi.*(sol-par);
        
        npop=rtol(newsols,AC,D)  ;%转化成波段；
       f1=fitness1(npop,data);
%         f1=fitness(npop,LX);
        newsval=[npop f1];
        nfoodval=[nfoodval;newsval];
    end
    SS=[nfoodval;Foodval(:,1:D+1)];
    oldfoodval=Foodval;
    [~,index_SS]=sort(SS(:,D+1));
      for ii=1:FoodNumber
          Foods(ii,1:D)=SS(index_SS(ii),1:D);
          Foodval(ii,1:D+1)=SS(index_SS(ii),1:D+1);
      end
      % % % % % % % % % % % 
    newfit=[];
           value=mean(Foodval(:,D+1));
           for ll=1:FoodNumber
               newfit(ll)=exp(-(Foodval(ll,D+1)/value));
           end
            prob=newfit./sum(newfit);

  
    %%%%%%%%%%%%%%%%%%%%%%%% ONLOOKER BEE PHASE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    i=1;
    t=0;
    nfoodval=[];
   newsols=[];
   
   while(t<FoodNumber)
       if(rand<prob(i))
            t=t+1;
                sol=Foods(t,1:D);
        ss1=randperm(FoodNumber,1);
        par=Foods(ss1,1:D);
        % Define Acceleration Coeff.
        phi=unifrnd(-1,+1,[1,D]);
        % New Bee Position
        newsols=sol+phi.*(sol-par);
        
        npop=rtol(newsols,AC,D)  ;%转化成波段；
         f1=fitness1(npop,data);
%        f1=fitness(npop,LX);
        newsval=[npop f1];
        nfoodval=[nfoodval;newsval];
         
       end
       i=i+1;
       if (i==FoodNumber+1)
           i=1;
       end
   end
    SS=[nfoodval;Foodval(:,1:D+1)];
    oldfoodval=Foodval;
    [~,index_SS]=sort(SS(:,D+1));
      for ii=1:FoodNumber
          Foods(ii,1:D)=SS(index_SS(ii),1:D);
          Foodval(ii,1:D+1)=SS(index_SS(ii),1:D+1);
      end
   
   for i=1:FoodNumber
         if(Foodval(i,D+1)>oldfoodval(i,D+1))
            trial(i)=0;
        else
            trial(i)=trial(i)+1; %/*if the solution i can not be improved, increase its trial counter*/
        end
    end
    
    %%%%%%%%%%%% SCOUT BEE PHASE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %/*determine the food sources whose trial counter exceeds the "limit" value.
    %In Basic ABC, only one scout is allowed to occur in each cycle*/
    
    ind=find(trial==max(trial));
    ind1=ind(end);
    if (trial(ind1)>limit)
        trial(ind1)=0;
        snew=round(rand(1,D));
        snewval=fitness(npop,LX);
        Foods(ind1,1:D)=snew;
        Foodval(ind1,1:D+1)=snewval;
        
        [~,index_Foodval]=sort(Foodval(:,D+1),'descend');
      for ii=1:FoodNumber
          Foods(ii,1:D)=Foods(index_Foodval(ii),1:D);
          Foodval(ii,1:D+1)=Foodval(index_Foodval(ii),1:D+1);
      end
     
    end
end



% % % % % % % % % % % % %    
    Foods_best=Foodval(1,:);
end



 % End of ABC


