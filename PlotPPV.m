function [C1,C2] = PlotPPV(X,C)
    count_c1 = 0;
    count_c2 = 0;

    for r = 1:length(X)
        if C(r,1) == 1
            count_c1 = count_c1 + 1;
        else
            count_c2 = count_c2 + 1;
        end
    end
    
    [a,b] = size(X);
    C1 = zeros(count_c1,b);
    C2 = zeros(count_c2,b);
    
    for r = 1:length(X)
        if C(r,1) == 1
            C1(r,:) = X(r,:);
        else
            C2(r,:) = X(r,:);
        end
    end
    
    figure
    plot(C1(:,1),C1(:,2),'*',C2(:,1),C2(:,2),'+');
end