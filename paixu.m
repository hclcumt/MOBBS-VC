function rank=paixu(SS,huxinxi_ALL,cos,him)
    
   for i=1:him
        [~,vss]=sort(SS(i,:),'descend');
      [~,vhu]=sort(huxinxi_ALL(i,:),'descend');
%         [~,vxg]=sort(bound_xgd_ALL(i,:),'descend');
      [~,vjd]=sort(cos(i,:));
       
       for j=1:him
           if i~=j
%                r(1)=find(vss==j);
%              
%                r(2)=find(vhu==j);
%              
%                r(3)=find(vxg==j);

               r(1)=vss(j);
             
               r(2)=vhu(j);
             
%               r(3)=vxg(j);
               
         r(3)=vjd(j);
               
               rank{i,j}=sort(r);
           end
               
            
       end
       
   end
end