function [NC,Ncenter,xxs]=julei(bound_date_huidu,rank,K,iter_K)
    [long,high,him] = size(bound_date_huidu);
    bound_date_huidu=uint8(bound_date_huidu);
    for i=1:him
        xxs(i)=entropy(bound_date_huidu(:,:,i));
    end
    center=randperm(him,K);

    for iter=1:iter_K
            for o=1:K
                C{o}=center(o);
            end
        for j=1:him
            if isempty(find(center==j, 1))
                for k=1:K
                    r=rank{center(k),j};%以谁为准在前
                    rrank(k)=r(2);
                end
                [~,index]=sort(rrank);
                C{index(1)}=[C{index(1)} j];
            end
        end
        %更新类中心
        for l=1:K
            nc=[];
            cxxs=[];
            nc=C{l};
            for ii=1:length(nc)
                cxxs(ii)=xxs(nc(ii));
            end
            [~,indexc]=sort(cxxs,'descend');
            center(l)=nc(indexc(1));
        end
        
    end
    %对类排序
    for jj=1:K
        ncc=[];
        ncc=C{jj};
        for p=1:length(ncc)
            paixuxxs(p)=xxs(ncc(p));
        end
        aexxs(jj)=mean(paixuxxs);      
    end
    [~,indexxs]=sort(aexxs,'descend');
    for ll=1:K
        NC{ll}=C{indexxs(ll)};
        Ncenter(ll)=center(indexxs(ll));
    end
    
end