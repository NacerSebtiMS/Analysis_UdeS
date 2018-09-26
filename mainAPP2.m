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


%% Valeur propre matrice de covarience

M = min(length(ref_P300),length(ref_NP300));
X1_ref = [ref_P300(1:M,1) ref_NP300(1:M,1)];
X2_ref = [ref_P300(1:M,2) ref_NP300(1:M,2)];
X3_ref = [ref_P300(1:M,3) ref_NP300(1:M,3)];
X4_ref = [ref_P300(1:M,4) ref_NP300(1:M,4)];

moy_X1_ref = [sum(ref_P300(:,1))/length(ref_P300); sum(ref_NP300(:,1))/length(ref_NP300)];
moy_X2_ref = [sum(ref_P300(:,2))/length(ref_P300); sum(ref_NP300(:,2))/length(ref_NP300)];
moy_X3_ref = [sum(ref_P300(:,3))/length(ref_P300); sum(ref_NP300(:,3))/length(ref_NP300)];
moy_X4_ref = [sum(ref_P300(:,4))/length(ref_P300); sum(ref_NP300(:,4))/length(ref_NP300)];

vX1 = X1_ref'- moy_X1_ref;
cov_X1_ref = (vX1*vX1')/(M-1);

vX2 = X2_ref'- moy_X2_ref;
cov_X2_ref = (vX2*vX2')/(M-1);

vX3 = X3_ref'- moy_X3_ref;
cov_X3_ref = (vX3*vX3')/(M-1);

vX4 = X4_ref'- moy_X4_ref;
cov_X4_ref = (vX4*vX4')/(M-1);

P300_both_ref = cat(1,ref_P300,ref_NP300);
moyP300_ref = [sum(ref_P300(:,1))/length(ref_P300); sum(ref_P300(:,2))/length(ref_P300) ; sum(ref_P300(:,3))/length(ref_P300) ; sum(ref_P300(:,4))/length(ref_P300)];
moyP300N_ref = [sum(ref_NP300(:,1))/length(ref_NP300); sum(ref_NP300(:,2))/length(ref_NP300) ; sum(ref_NP300(:,3))/length(ref_NP300) ; sum(ref_NP300(:,4))/length(ref_NP300)];
moyP300_both_ref = [sum(P300_both_ref(:,1))/length(P300_both_ref); sum(P300_both_ref(:,2))/length(P300_both_ref) ; sum(P300_both_ref(:,3))/length(P300_both_ref) ; sum(P300_both_ref(:,4))/length(P300_both_ref)];


m = ref_P300'- moyP300_ref;
covarianceP300_ref = (m*m')/(length(ref_P300)-1);
m = ref_NP300'- moyP300N_ref;
covarianceP300N_ref = (m*m')/(length(ref_NP300)-1);

m = P300_both_ref'- moyP300_both_ref;
covarianceP300_both_ref = (m*m')/(length(P300_both_ref)-1);


[vecp_P300,valp]= eig(covarianceP300_ref); 
[vecp_NP300,valp]= eig(covarianceP300N_ref);
[vecp_P300_both,valp]= eig(covarianceP300_both_ref);

[vecp_X1_ref,valp]= eig(cov_X1_ref);
[vecp_X4_ref,valp]= eig(cov_X4_ref);


if 0
%     x1 = ones(1,length(ref_P300));
%     x2 = ones(1,length(ref_NP300))*2;
    
    x1 = randn(1,length(ref_P300));
    x2 = randn(1,length(ref_NP300));

    figure
    plot(x1,ref_P300(:,1)','o',x2,ref_NP300(:,1)','*');
    
    figure
    plot(x1,ref_P300(:,2)','o',x2,ref_NP300(:,2)','*');
    
    figure
    plot(x1,ref_P300(:,3)','o',x2,ref_NP300(:,3)','*');
    
    figure
    plot(x1,ref_P300(:,4)','o',x2,ref_NP300(:,4)','*');
    
    figure
    plot(ref_P300(:,1)',ref_P300(:,4)','o',ref_NP300(:,1)',ref_NP300(:,4)','*');
   
end

%% Pertinence d'une décorrélation des coordonnées

% ref_P300_dec = ref_P300*vecp_P300;
% ref_NP300_dec = ref_NP300*vecp_NP300;
ref_P300_dec = ref_P300*vecp_P300_both;
ref_NP300_dec = ref_NP300*vecp_P300_both;
test_P300_dec = test_P300*vecp_P300_both;
test_NP300_dec = test_NP300*vecp_P300_both;

%% Pertinence de réduction de dimension par décorrélation (performence)

test_both_p300_dec = cat(1,[test_P300_dec(:,1) test_P300_dec(:,4)],[test_NP300_dec(:,1) test_NP300_dec(:,4)]);
ref_both_dec = cat(1,[ref_P300_dec(:,1) ref_P300_dec(:,4)],[ref_NP300_dec(:,1) ref_NP300_dec(:,4)]); 

%% Forme des probabilités après décorrélation

figure
plot(ref_P300_dec(:,1),ref_P300_dec(:,4),'*',ref_NP300_dec(:,1),ref_NP300_dec(:,4),'+');

%% Forme visuelle des équations des frontières après décorrélation



%% PARTIE 1.2 (Trois algorithmes de classification bayesienne)
%% Hypothèse que les loi sont gaussienne

%% Utiliser le risque tel que défini par bayes

%% Utiliser frontière + densités de probabilité gausiennes

%% Taux moyen de classification des 3 systèmes

%% k-PPV

R = K_PPV(1,ref_P300,ref_NP300,test_P300,300,315);
C_kppv = K_PPV(1,[ref_P300_dec(:,1) ref_P300_dec(:,4)],[ref_NP300_dec(:,1) ref_NP300_dec(:,4)],test_both_p300_dec,0,1);
[C1,C2] = PlotPPV(test_both_p300_dec,C_kppv(:,3));

%% k-moyennnes

% test_rand = cat(1,(abs(round(randn(1,40)))+10)',(abs(round(randn(1,40))))');
% test_rand = cat(2,test_rand,ones(length(test_rand),1));

C = kmoyen(test_both_p300_dec,2);
figure
plot(test_P300_dec(:,1),test_P300_dec(:,4),'*',test_NP300_dec(:,1),test_NP300_dec(:,4),'o')
[C1,C2] = PlotPPV(test_both_p300_dec,C);


%% Taux d'erreur de classification des 5 techiques


%% PARTIE 2
%% Définir ensemble de testes d'apprentissage

%% Classification à l'aide d'une méthode paramétrique (supervisé ou non)

%% Testes avec deux experiences différentes (présentations différentes de couleurs des images)

%% Performence et résultats obtenus

