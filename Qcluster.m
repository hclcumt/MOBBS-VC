function [AC,NCen]=Qcluster(NC,Ncenter,K,rank,xxs)
    AC{K}=NC;
    NCen{K}=Ncenter;
    for i=K:-1:3
       YC=AC{i};
       cen=NCen{i};
        LC=[];
        LC=YC{i};%找出最后一类
        YC{i}=[];
        YC(cellfun(@isempty,YC))=[];
        rrank=[];
        for j=1:length(LC)
            for k=1:i-1
                r=rank{LC(j),cen(k)};
                rrank(k)=r(2);
            end
               index=[];
            [~,index]=sort(rrank);
            YC{index(1)}=[YC{index(1)} LC(j)];
        end
        
        AC{i-1}=YC;
        NCe=[];
        %更新类中心
        for l=1:i-1
             nNC=[];
             CNC=AC{i-1};
             nNC=CNC{l};
            nnxxs=[];
            for m=1:length(nNC)
               nnxxs(m) =xxs(nNC(m));
            end

            [~,indexcenter]=sort(nnxxs,'descend');
            NCe(l)=nNC(indexcenter(1));
            indexcenter=[];
            
        end
        NCen{i-1}=NCe;
    end
end