function npop=rtol(pop,AC,whichc)
    nowAC=AC{whichc};
    npop=[];
    pop=floor(pop);
    for i=1:length(pop)
        whichclass=nowAC{i};
        if pop(i)>length(whichclass)
            pop(i)=length(whichclass);
        end
        if pop(i)<1
            pop(i)=1;
        end
        npop(i)=whichclass(pop(i));
    end

end