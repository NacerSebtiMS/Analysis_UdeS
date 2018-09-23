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
   min = [dist(rn(i,:)) c1];
   for a = 1:length(rp)
       
   end
classed = r;
end