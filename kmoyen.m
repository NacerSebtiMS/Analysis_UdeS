function [C] = kmoyen(X,k)
    ran1 = rand(1);
    ran2 = rand(1);
    
    C = zeros(length(X),1);
    
    while ran1 == ran2
        ran1 = rand(1);
        ran2 = rand(1);
    end

    b1 = X(round(ran1*length(X)),:);
    b2 = X(round(ran2*length(X)),:);
    
    
    end_loop = 1;
    old_dist = 0;
    disb = 0;
    
    while end_loop  % tant que le l'etat des barycentes reste pareille
        old_dist = disb;
        disb = sum((b1 - b2).^2);
        disp(['Distance entre bericentres : ',num2str(disb)]);

        for r = 1:length(X)

            dc1 = sum((b1 - X(r,:)).^2);
            dc2 = sum((b2 - X(r,:)).^2);
            
            if dc1 < dc2
                C(r,1) = 1;
            else
                C(r,1) = 0;
            end
        end
        
        [a,b] = size(X);
        sd1 = zeros(1,b);
        sd2 = zeros(1,b);
        
        csd1 = 0;
        csd2 = 0;
        
        for r = 1:length(X)
            if C(r,1) == 1
                sd1 = X(r,:)+ sd1;
                csd1 = csd1 + 1;
            else
                sd2 = X(r,:)+ sd2;
                csd2 = csd2 + 1;
            end
        end
        
        nb1 = sd1./csd1;
        nb2 = sd2./csd2;
        
        if nb1 == b1 & nb2 == b2
            end_loop = 0;
        end
        
        b1 = nb1;
        b2 = nb2;

    end
    
end