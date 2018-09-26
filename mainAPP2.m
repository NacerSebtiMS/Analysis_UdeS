% APP2 : Intelligence artificielle probabiliste
% Auteurs
% Bouhya, Meriem	    boum3445
% Sebti, Nacer          sebn3001 
% Sermaxhaj, Adriatik   sera1901
clear
close all
clc

%% PARTIE 1.1 (Étudie et analyse des distributions)
%% Forme des lois de probabilité (Afficher les points)
test_P300 = load('test_P300');
test_NP300 = load('test_NP300');
ref_P300 = load('ref_P300');
ref_NP300 = load('ref_NP300');
Inconnus = load('Inconnus');

if 0
    figure(1)
    plotmatrix(ref_P300(:,1));

    figure(2)
    plotmatrix(ref_NP300(:,1));

    figure(3)
    plotmatrix(ref_P300(:,2));

    figure(4)
    plotmatrix(ref_NP300(:,2));

    figure(5)
    plotmatrix(ref_P300(:,3));

    figure(6)
    plotmatrix(ref_NP300(:,3)); 
    
    figure(7)
    plotmatrix(ref_P300(:,4));

    figure(8)
    plotmatrix(ref_NP300(:,4)); 
    
end

% Probabile par rapport au barycentre
if 0
    
    figure(1)
    bc = [sum(ref_P300(1,:)) sum(ref_P300(:,2)) sum(ref_P300(:,3)) sum(ref_P300(:,4))];
    bc = bc/length(ref_P300);
    plot_p300 = zeros(length(ref_P300),1);

    for i = 1:length(ref_P300)
        plot_p300(i,1) = sum((ref_P300(i,:) - bc));
    end

    plotmatrix(plot_p300);
    
    
    figure(2)
    bc = [sum(ref_NP300(1,:)) sum(ref_NP300(:,2)) sum(ref_NP300(:,3)) sum(ref_NP300(:,4))];
    bc = bc/length(ref_NP300);
    plot_p300 = zeros(length(ref_NP300),1);

    for i = 1:length(ref_NP300)
        plot_p300(i,1) = sum((ref_NP300(i,:) - bc));
    end

    plotmatrix(plot_p300);

end

% Probabile par rapport a la moyenne
if 0
    
    figure(1)
    bc = sum(ref_P300(1,:));
    bc = bc/length(ref_P300);
    p300 = ones(length(ref_P300),1)*bc;   
    distrib_p300 = ref_P300(:,1) - p300;
    plotmatrix(distrib_p300);
    
    figure(2)
    bc = sum(ref_NP300(1,:));
    bc = bc/length(ref_NP300);
    np300 = ones(length(ref_NP300),1)*bc;   
    distrib_np300 = ref_NP300(:,1) - np300;
    plotmatrix(distrib_np300);
    
    figure(3)
    bc = sum(ref_P300(2,:));
    bc = bc/length(ref_P300);
    p300 = ones(length(ref_P300),1)*bc;   
    distrib_p300 = ref_P300(:,2) - p300;
    plotmatrix(distrib_p300);
    
    figure(4)
    bc = sum(ref_NP300(2,:));
    bc = bc/length(ref_NP300);
    np300 = ones(length(ref_NP300),1)*bc;   
    distrib_np300 = ref_NP300(:,2) - np300;
    plotmatrix(distrib_np300);
    
    figure(5)
    bc = sum(ref_P300(3,:));
    bc = bc/length(ref_P300);
    p300 = ones(length(ref_P300),1)*bc;   
    distrib_p300 = ref_P300(:,3) - p300;
    plotmatrix(distrib_p300);
    
    figure(6)
    bc = sum(ref_NP300(3,:));
    bc = bc/length(ref_NP300);
    np300 = ones(length(ref_NP300),1)*bc;   
    distrib_np300 = ref_NP300(:,3) - np300;
    plotmatrix(distrib_np300);
    
    figure(7)
    bc = sum(ref_P300(4,:));
    bc = bc/length(ref_P300);
    p300 = ones(length(ref_P300),1)*bc;   
    distrib_p300 = ref_P300(:,4) - p300;
    plotmatrix(distrib_p300);
    
    figure(8)
    bc = sum(ref_NP300(4,:));
    bc = bc/length(ref_NP300);
    np300 = ones(length(ref_NP300),1)*bc;   
    distrib_np300 = ref_NP300(:,4) - np300;
    plotmatrix(distrib_np300);

end


if 0
%     x1 = ones(1,length(ref_P300));
%     x2 = ones(1,length(ref_NP300))*2;
    
    x1 = randn(1,length(ref_P300));
    x2 = randn(1,length(ref_NP300));

    figure(1);
    plot(x1,ref_P300(:,1)','o',x2,ref_NP300(:,1)','*');
    
    figure(2);
    plot(x1,ref_P300(:,2)','o',x2,ref_NP300(:,2)','*');
    
    figure(3);
    plot(x1,ref_P300(:,3)','o',x2,ref_NP300(:,3)','*');
    
    figure(4);
    plot(x1,ref_P300(:,4)','o',x2,ref_NP300(:,4)','*');
    
    figure(5);
    plot(ref_P300(:,1)',ref_P300(:,4)','o',ref_NP300(:,1)',ref_NP300(:,4)','*');
   

end

% figure(2)
% plotmatrix(ref_P300(:,1));
% 
% figure(3)
% plotmatrix(ref_P300(:,2));
% 
% figure(4)
% plotmatrix(ref_P300(:,3));
% 
% figure(5)
% plotmatrix(ref_P300(:,4));
% 
% figure(6)
% plotmatrix(ref_P300);
% 
% figure(7)
% plotmatrix(ref_NP300);


%% Valeur propre matrice de covarience

moyP300_ref = [sum(ref_P300(:,1))/length(ref_P300); sum(ref_P300(:,2))/length(ref_P300) ; sum(ref_P300(:,3))/length(ref_P300) ; sum(ref_P300(:,4))/length(ref_P300)];
moyP300N_ref = [sum(ref_NP300(:,1))/length(ref_NP300); sum(ref_NP300(:,2))/length(ref_NP300) ; sum(ref_NP300(:,3))/length(ref_NP300) ; sum(ref_NP300(:,4))/length(ref_NP300)];

m = ref_P300'- moyP300_ref;
covarianceP300_ref = (m*m')/(length(ref_P300)-1)
m = ref_NP300'- moyP300N_ref;
covarianceP300N_ref = (m*m')/(length(ref_NP300)-1)


[vecp_P300,valp]= eig(covarianceP300_ref) 
%covarianceP300_ref_diago = vecp*valp*inv(vecp);
%covarianceP300_ref_diago2 = diag(covarianceP300_ref)

[vecp_NP300,valp]= eig(covarianceP300N_ref)
%covarianceNP300_ref_diago = vecp*valp*inv(vecp);





%% Pertinence d'une décorrélation des coordonnées

ref_P300_dec = ref_P300*vecp_P300;
ref_NP300_dec = ref_NP300*vecp_NP300;

test_P300_dec = ref_NP300*vecp_NP300;
if 0
    figure(1)
    plotmatrix(ref_P300_dec(:,1));

    figure(2)
    plotmatrix(ref_NP300_dec(:,1));

    figure(3)
    plotmatrix(ref_P300_dec(:,2));

    figure(4)
    plotmatrix(ref_NP300_dec(:,2));

    figure(5)
    plotmatrix(ref_P300_dec(:,3));

    figure(6)
    plotmatrix(ref_NP300_dec(:,3)); 
    
    figure(7)
    plotmatrix(ref_P300_dec(:,4));

    figure(8)
    plotmatrix(ref_NP300_dec(:,4)); 
    
end

% figure(6)
% plotmatrix(ref_P300_dec);
% 
% figure(7)
% plotmatrix(ref_NP300_dec);


% k = sym('k')
% 
% eq1 = det(covarianceP300_ref - k*eye(length(moyP300_ref)));
% vpa(root(det(covarianceP300_ref - k*eye(length(moyP300_ref))),k))
% [a,b ]= eig(covarianceP300_ref)
% 
% [a,b ]= eig(covarianceP300N_ref)


%% Pertinence de réduction de dimension par décorrélation (performence)

%% Forme des probabilités après décorrélation

%% Forme visuelle des équations des frontières après décorrélation



%% PARTIE 1.2 (Trois algorithmes de classification bayesienne)
%% Hypothèse que les loi sont gaussienne

%% Utiliser le risque tel que défini par bayes

%% Utiliser frontière + densités de probabilité gausiennes

%% Taux moyen de classification des 3 systèmes

%% k-PPV
%K_PPV(ref_P300,ref_NP300,0,300,315)
%% k-moyennnes

%C = kmoyen(test_P300,2);

% test2_p300 = cat(1,[ref_P300_dec,ref_NP300_dec);
%test2_p300 = cat(1,[ref_P300_dec(:,1) ref_P300_dec(:,4)],[ref_NP300_dec(:,1) ref_NP300_dec(:,4)]);
test2_p300 = cat(1,[ref_P300(:,1) ref_P300(:,4)],[ref_NP300(:,1) ref_NP300(:,4)]);

test_rand = cat(1,(abs(round(randn(1,40)))+10)',(abs(round(randn(1,40))))');

test_rand = cat(2,test_rand,ones(length(test_rand),1));
C = kmoyen(test2_p300,2);

if 0
    figure(9)
    plot(test2_p300(:,1),test2_p300(:,2),'o');
    
    figure(10)
    plot(ref_P300(:,1),ref_P300(:,4),'o');
    
    figure(11)
    plot(ref_NP300(:,1),ref_NP300(:,4),'o');
    
    
    figure(12)
    plot(test2_p300(:,1),test2_p300(:,2),'o',ref_P300_dec(:,1),ref_P300_dec(:,4),'*',ref_NP300_dec(:,1),ref_NP300_dec(:,4),'+');
    
end

c_p300 = 0;
c_np300 = 0;

for r = 1:length(ref_P300)
    if C(r,1) == 1
        c_p300 = c_p300 + 1;
    end
end

for r = length(ref_P300)+1:length(ref_NP300)
    if C(r,1) == 0
        c_np300 = c_np300 + 1;
    end
end

disp(['good p300 : ',num2str(c_p300),'  bad p300 : ',num2str(length(ref_P300) - c_p300)]);
disp(['good np300 : ',num2str(c_np300),'  bad np300 : ',num2str(length(ref_NP300) - c_np300)]);


%% Taux d'erreur de classification des 5 techiques


%% PARTIE 2
%% Définir ensemble de testes d'apprentissage

%% Classification à l'aide d'une méthode paramétrique (supervisé ou non)

%% Testes avec deux experiences différentes (présentations différentes de couleurs des images)

%% Performence et résultats obtenus

