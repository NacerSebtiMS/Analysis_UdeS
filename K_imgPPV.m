function classed = K_imgPPV(r1,r2,r3,c,c1,c2,c3)

classed = cat(2,c,zeros(length(c),1));
B1 = zeros(1,length(r1(1,:)));
B2 = zeros(1,length(r2(1,:)));
B3 = zeros(1,length(r3(1,:)));
for l = 1:length(r1(1,:))
    B1(l) = sum(r1(:,l))/length(r1(:,1));
    B2(l) = sum(r2(:,l))/length(r2(:,1));
    B3(l) = sum(r3(:,l))/length(r3(:,1));
end

for i = 1:length(c)
    min(1,:) = [dist(B1,c(i,:)) c1];
    min(2,:) = [dist(B2,c(i,:)) c2];
    min(3,:) = [dist(B3,c(i,:)) c3];
    min = sortrows(min,1);
    classed(i, length(classed(1,:))) = min(1,2);  
end
end