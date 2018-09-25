% APP2 : Intelligence artificielle probabiliste
% Auteurs
% Bouhya, Meriem	    boum3445
% Sebti, Nacer          sebn3001 
% Sermaxhaj, Adriatik   sera1901
clear
clc

%% PARTIE 1.1 (�tudie et analyse des distributions)
%% Forme des lois de probabilit� (Afficher les points)
test_P300 = load('test_P300');
test_NP300 = load('test_NP300');
ref_P300 = load('ref_P300');
ref_NP300 = load('ref_NP300');
Inconnus = load('Inconnus');


figure(1)
bc = [sum(ref_P300(1,:)) sum(ref_P300(:,2)) sum(ref_P300(:,3)) sum(ref_P300(:,4))];
bc = bc/length(ref_P300);
plot_p300 = zeros(length(ref_P300),1);

for i = 1:length(ref_P300)
    plot_p300(i,1) = sum((ref_P300(i,:) - bc));
end

plotmatrix(plot_p300);

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
figure(6)
plotmatrix(ref_P300);

figure(7)
plotmatrix(ref_NP300);


%% Valeur propre matrice de covarience

moyP300_ref = [sum(ref_P300(:,1))/length(ref_P300); sum(ref_P300(:,2))/length(ref_P300) ; sum(ref_P300(:,3))/length(ref_P300) ; sum(ref_P300(:,4))/length(ref_P300)];
moyP300N_ref = [sum(ref_NP300(:,1))/length(ref_NP300); sum(ref_NP300(:,2))/length(ref_NP300) ; sum(ref_NP300(:,3))/length(ref_NP300) ; sum(ref_NP300(:,4))/length(ref_NP300)];

m = ref_P300'- moyP300_ref;
covarianceP300_ref = (m*m')/(length(ref_P300)-1);
m = ref_NP300'- moyP300N_ref;
covarianceP300N_ref = (m*m')/(length(ref_NP300)-1);


[vecp_P300,valp]= eig(covarianceP300_ref); 
%covarianceP300_ref_diago = vecp*valp*inv(vecp);
%covarianceP300_ref_diago2 = diag(covarianceP300_ref)

[vecp_NP300,valp]= eig(covarianceP300N_ref)
%covarianceNP300_ref_diago = vecp*valp*inv(vecp);





%% Pertinence d'une d�corr�lation des coordonn�es

ref_P300_dec = ref_P300*vecp_P300;
ref_NP300_dec = ref_NP300*vecp_NP300;

figure(6)
plotmatrix(ref_P300_dec);

figure(7)
plotmatrix(ref_NP300_dec);


% k = sym('k')
% 
% eq1 = det(covarianceP300_ref - k*eye(length(moyP300_ref)));
% vpa(root(det(covarianceP300_ref - k*eye(length(moyP300_ref))),k))
% [a,b ]= eig(covarianceP300_ref)
% 
% [a,b ]= eig(covarianceP300N_ref)


%% Pertinence de r�duction de dimension par d�corr�lation (performence)

%% Forme des probabilit�s apr�s d�corr�lation

%% Forme visuelle des �quations des fronti�res apr�s d�corr�lation



%% PARTIE 1.2 (Trois algorithmes de classification bayesienne)
%% Hypoth�se que les loi sont gaussienne

%% Utiliser le risque tel que d�fini par bayes

%% Utiliser fronti�re + densit�s de probabilit� gausiennes

%% Taux moyen de classification des 3 syst�mes

%% k-PPV
%K_PPV(ref_P300,ref_NP300,0,300,315)
%% k-moyennnes

%C = kmoyen(test_P300,2);

test2_p300 = cat(1,ref_P300_dec,ref_NP300_dec);
C = kmoyen(test2_p300,2);

c_p300 = 0;
c_np300 = 0;

for r = 1:length(ref_P300)
    c_p300 = c_p300 + 1;
end

for r = length(ref_P300)+1:length(ref_NP300)
    c_np300 = c_np300 + 1;
end
disp(['good p300 : ',num2str(c_p300),'  bad p300 : ',num2str(length(ref_P300) - c_p300)]);
disp(['good np300 : ',num2str(c_np300),'  bad np300 : ',num2str(length(ref_NP300) - c_np300)]);


%% Taux d'erreur de classification des 5 techiques




%% PARTIE 2
%% D�finir ensemble de testes d'apprentissage

%% Classification � l'aide d'une m�thode param�trique (supervis� ou non)

%% Testes avec deux experiences diff�rentes (pr�sentations diff�rentes de couleurs des images)

%% Performence et r�sultats obtenus

