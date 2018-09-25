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

% figure(1)
% plotmatrix(ref_P300(:,1));
% 
% figure(2)
% plotmatrix(ref_P300(:,2));
% 
% figure(3)
% plotmatrix(ref_P300(:,3));
% 
% figure(4)
% plotmatrix(ref_P300(:,4));
% 
% figure(5)
% plotmatrix(ref_P300);


%% Valeur propre matrice de covarience

moyP300_ref = [sum(ref_P300(:,1))/length(ref_P300); sum(ref_P300(:,2))/length(ref_P300) ; sum(ref_P300(:,3))/length(ref_P300) ; sum(ref_P300(:,4))/length(ref_P300)];
moyP300N_ref = [sum(ref_NP300(:,1))/length(ref_NP300); sum(ref_NP300(:,2))/length(ref_NP300) ; sum(ref_NP300(:,3))/length(ref_NP300) ; sum(ref_NP300(:,4))/length(ref_NP300)];

m = ref_P300'- moyP300_ref;
covarianceP300_ref = (m*m')/(length(ref_P300)-1)

m = ref_NP300'- moyP300N_ref;
covarianceP300N_ref = (m*m')/(length(ref_NP300)-1)





%% Pertinence d'une d�corr�lation des coordonn�es

k = sym('k')

eq1 = det(covarianceP300_ref - k*eye(length(moyP300_ref)));
vpa(root(det(covarianceP300_ref - k*eye(length(moyP300_ref))),k))
[a,b ]= eig(covarianceP300_ref)
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
K_PPV(1,ref_P300,ref_NP300,test_P300,300,315)
%% k-moyennnes

%% Taux d'erreur de classification des 5 techiques




%% PARTIE 2
%% D�finir ensemble de testes d'apprentissage

%% Classification � l'aide d'une m�thode param�trique (supervis� ou non)

%% Testes avec deux experiences diff�rentes (pr�sentations diff�rentes de couleurs des images)

%% Performence et r�sultats obtenus

