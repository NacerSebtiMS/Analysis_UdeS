function classed = K_PPV(k,rp,rnp,c,c1,c2)
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
   min = zeros(k,2);
   for j = 1:k
       min(j,:) = [dist(rp(j,:),c(i,:)) c1];
   end
   min = sort(min,1);
   for a = 2:length(rp)
       d = dist(rp(a,:),c(i,:));
       if d < min(k,1)
           min = cat(1,min,[d c1]);
           min = sortrows(min,1);
           min = min(1:k,:);
       end
   end
   for a = 1:length(rnp)
       d = dist(rnp(a,:),c(i,:));
       if d < min(k,1)
           min = cat(1,min,[d c2]);
           min = sortrows(min,1);
           min = min(1:k,:);
       end
   end
   if sum(min(:,2)==c1) > (k/2)
       classed(i, length(classed(1,:))) = c1;
   else
       classed(i, length(classed(1,:))) = c2;
   end
   
%    if min(2) == c1
%        rp = cat(1,rp,c(i,:));
%    else
%        rnp = cat(1,rnp,c(i,:));
%    end

end