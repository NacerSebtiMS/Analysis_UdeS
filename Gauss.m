function classed = Gauss(c,ref_P300,ref_NP300,c1,c2)
len = length(ref_P300(1,:));
% if len == 2
%     x=[x1;x2];
% elseif len == 4
%     x=[x1,x2,x3,x4];
% end

moyP300_ref = zeros(1,length(ref_P300(1,:)));
moyP300N_ref = zeros(1,length(ref_P300(1,:)));
for l = 1:length(ref_P300(1,:))
    moyP300_ref(l) = sum(ref_P300(:,l))/length(ref_P300(:,1));
    moyP300N_ref(l) = sum(ref_NP300(:,l))/length(ref_NP300(:,1));
end

m1 = ref_P300 - moyP300_ref;
covarianceP300_ref = (m1*m1')/(length(ref_P300)-1);
m2 = ref_NP300 - moyP300N_ref;
covarianceP300N_ref = (m2*m2')/(length(ref_NP300)-1);

classed = cat(2,c,zeros(length(c),1));

for i = 1:length(c)
    x = c(i,:);
    temp = x-moyP300_ref;
    covarianceP300_ref
    d = temp*covarianceP300_ref*temp'
    px_C1= (1/sqrt(det(covarianceP300_ref)*(2*pi)^2)).*exp(-0.5*d);
    temp = x-moyP300_ref;
    px_C2= (1/sqrt(det(covarianceP300N_ref)*(2*pi)^2)).*exp(-0.5*d);
    
    if px_C1 > px_C2
        classed(i, length(classed(1,:))) = c1;
    else
        classed(i, length(classed(1,:))) = c2;
    end  
end