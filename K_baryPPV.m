function classed = K_baryPPV(k,rp,rnp,c,c1,c2)

classed = cat(2,c,zeros(length(c),1));
BRP = zeros(1,length(rp(1,:)));
BNRP = zeros(1,length(rnp(1,:)));
for l = 1:length(rp(1,:))
   BRP(l) = sum(rp(:,l))/length(rp(:,1));
   BNRP(l) = sum(rnp(:,l))/length(rnp(:,1));
end

for i = 1:length(c)
    
    if dist(BRP,c(i,:)) > dist(BNRP,c(i,:))
        classed(i, length(classed(1,:))) = c2;
    else
       classed(i, length(classed(1,:))) = c1;
    end
end
   
%    if min(2) == c1
%        rp = cat(1,rp,c(i,:));
%    else
%        rnp = cat(1,rnp,c(i,:));
%    end

end