function classed = K_PPV(rp,rnp,c,c1,c2)
% r = zeros( length(rp) + length(rnp) , length(rp(1,:))+1 );
% 
% for i = 1:length(rp)
%     for j = 1:length(rp(1,:))
%         r(i,j) = rp(i,j);
%     end
%     r(i,length(r(1,:))) = c1;
% end
% for i = length(rp)+1:length(r)
%     for j = 1:length(rnp(1,:))
%         r(i,j) = rnp(i-length(rp),j);
%     end
%     r(i,length(r(1,:))) = c2;
% end
classed = cat(2,c,zeros(length(c),1));
for i = 1:length(c)
   min = [dist(rp(1,:),c(i,:)) c1];
   for a = 2:length(rp)
       d = dist(rp(a,:),c(i,:));
       if d < min(1)
           min = [d c1];
       end
   end
   for a = 1:length(rnp)
       d = dist(rnp(a,:),c(i,:));
       if d < min(1)
           min = [d c2];
       end
   end
   classed(i, length(classed(1,:))) = min(2);
%    if min(2) == c1
%        rp = cat(1,rp,c(i,:));
%    else
%        rnp = cat(1,rnp,c(i,:));
%    end
end