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


[vecp_P300,valp]= eig(covarianceP300_ref)
[vecp_NP300,valp]= eig(covarianceP300N_ref)

% Rot = [vecp_P300(:,3) vecp_P300(:,4) vecp_NP300(:,3) vecp_NP300(:,4)]
Rot = [vecp_P300(:,1) vecp_NP300(:,4)]
% Rot = [vecp_P300(:,1) vecp_P300(:,4)]
% Rot = vecp_P300 * vecp_NP300
% Rot = eye(4);
L = length(Rot(1,:))+1;

R1 = ref_P300 * Rot;

R2 = ref_NP300 * Rot;
data = test_P300*Rot;
data2 = test_NP300*Rot;

if 0

subplot(2,2,1)
plot(R1(:,1),R1(:,2),'x',R2(:,1),R2(:,2),'o');
subplot(2,2,2)
plot(R1(:,1),R1(:,2),'x');
title('P300')
subplot(2,2,3)
plot(R2(:,1),R2(:,2),'o');

title("NP300")
end

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

% figure
% plot(ref_P300_dec(:,1),ref_P300_dec(:,4),'*',ref_NP300_dec(:,1),ref_NP300_dec(:,4),'+');

%% Forme visuelle des équations des frontières après décorrélation



%% PARTIE 1.2 (Trois algorithmes de classification bayesienne)
%% Hypothèse que les loi sont gaussienne

gauss = Gauss(test_P300*Rot,ref_P300*Rot,ref_NP300*Rot,300,315);
gauss_P300 = (sum(gauss(:,L)==300)/length(gauss(:,L)))*100;


gauss2 = Gauss(test_NP300*Rot,ref_P300*Rot,ref_NP300*Rot,300,315);
gauss_NP300 = (sum(gauss2(:,L)==315)/length(gauss2(:,L)))*100;

fprintf('%2.2f%% de reussite gauss P300\n',gauss_P300);
fprintf('%2.2f%% de reussite gauss NP300\n',gauss_NP300);


%% Utiliser le risque tel que défini par bayes



%% Utiliser frontière + densités de probabilité gausiennes

%% Taux moyen de classification des 3 systèmes

%% k-PPV


R = K_PPV(135,R1,R2,test_P300*Rot,300,315);
gud_P300 = (sum(R(:,L)==300)/length(R(:,L)))*100;
fprintf('%2.2f%% de reussite P300\n',gud_P300);
kppvNP300 = K_PPV(135,R1,R2,test_NP300*Rot,300,315);
gud_NP300 = (sum(kppvNP300(:,L)==315)/length(kppvNP300(:,L)))*100;
fprintf('%2.2f%% de reussite NP300\n',gud_NP300);

kppvP300 = K_baryPPV(1,R1,R2,test_P300*Rot,300,315);
gud_P300 = (sum(kppvP300(:,L)==300)/length(kppvP300(:,L)))*100;
fprintf('%2.2f%% de reussite P300\n',gud_P300);
kppvNP300 = K_baryPPV(1,R1,R2,test_NP300*Rot,300,315);
gud_NP300 = (sum(kppvNP300(:,L)==315)/length(kppvNP300(:,L)))*100;
fprintf('%2.2f%% de reussite NP300\n',gud_NP300);
% C_kppv = K_PPV(1,[ref_P300_dec(:,1) ref_P300_dec(:,4)],[ref_NP300_dec(:,1) ref_NP300_dec(:,4)],test_both_p300_dec,0,1);
% [C1,C2] = PlotPPV(test_both_p300_dec,C_kppv(:,3));

%% k-moyennnes
Lkm = length( data(1,:))+1;
[indexes, centres] = kmeans (data, 10);
km1 = K_baryPPV(1,R1,R2,centres,300,315);
for i = 1:length(indexes)
    indexes(i) = km1( indexes(i), Lkm);
end
km300 = (sum(indexes==300)/length(indexes))*100;
fprintf('%2.2f%% de reussite KMeans P300\n',km300);

% Plot the resu

Lkm = length( data2(1,:))+1;
[indexes, centres] = kmeans (data2, 10);
km1 = K_baryPPV(1,R1,R2,centres,300,315);
for i = 1:length(indexes)
    indexes(i) = km1( indexes(i), Lkm);
end
kmN300 = (sum(indexes==315)/length(indexes))*100;
fprintf('%2.2f%% de reussite KMeans NP300\n',kmN300);


% test_rand = cat(1,(abs(round(randn(1,40)))+10)',(abs(round(randn(1,40))))');
% test_rand = cat(2,test_rand,ones(length(test_rand),1));

%C = kmoyen(test_both_p300_dec,2);
% figure
% plot(test_P300_dec(:,1),test_P300_dec(:,4),'*',test_NP300_dec(:,1),test_NP300_dec(:,4),'o')
% [C1,C2] = PlotPPV(test_both_p300_dec,C);


%% Taux d'erreur de classification des 5 techiques


%% PARTIE 2
%% Définir ensemble de testes d'apprentissage

addpath('codeOctaveMatlabEtudiantImages/')

%% Load all images from folder. Source: stack-overflow
if 1
listeImages = dir('F:\universite\SESSION 8\APP2\git\Analysis_UdeS\Donnees12\baseDeDonneesImages');

%Count images
foret_count = 0;
street_count = 0;
coast_count = 0;

for x = 1:length(listeImages)
    if strncmp('forest',listeImages(x).name,6)
        foret_count = foret_count +1;
    end
    
    if strncmp('coast',listeImages(x).name,5)
        coast_count = coast_count + 1;
    end
    
    if strncmp('street',listeImages(x).name,6)
        street_count = street_count + 1;
    end
end

ref_foret = zeros(foret_count,12);
ref_coast = zeros(coast_count,12);
ref_street = zeros(street_count,12);

foret_count = 1;
street_count = 1;
coast_count = 1;
%extraire les donnes essentiels
for x = 1:length(listeImages)
    
    disp(listeImages(x).name);
    
    if strncmp('forest',listeImages(x).name,6) | strncmp('coast',listeImages(x).name,5)|strncmp('street',listeImages(x).name,6)
        fichierImage = imread(listeImages(x).name);
        
        imageRGB=double(fichierImage);
        imageYUV=double(JR_Rgb2Yul(fichierImage));
        imageYCbCr=double(rgb2ycbcr(fichierImage));
        [imLab(:,:,1),imLab(:,:,2),imLab(:,:,3)]=RGB2Lab(fichierImage(:,:,1),fichierImage(:,:,2),fichierImage(:,:,3));
        
        RGB = reshape(imageRGB,256*256,3);
        YUV = reshape(imageYUV,256*256,3);
        YCbCr = reshape(imageYCbCr,256*256,3);
        Lab = reshape(imLab,256*256,3);
        
        d1 = [sum(RGB(:,1)/length(RGB)), sum(RGB(:,2)/length(RGB)), sum(RGB(:,3)/length(RGB))];
        d2 = [sum(YUV(:,1)/length(YUV)), sum(YUV(:,2)/length(YUV)), sum(YUV(:,3)/length(YUV))];
        d3 = [sum(YCbCr(:,1)/length(YCbCr)), sum(YCbCr(:,2)/length(YCbCr)), sum(YCbCr(:,3)/length(YCbCr))];
        d4 = [sum(Lab(:,1)/length(Lab)), sum(Lab(:,2)/length(Lab)), sum(Lab(:,3)/length(Lab))];
        
%         d1 = [sum(RGB(:,1) - d1(1)),sum(RGB(:,2) - d1(2)),sum(RGB(:,3) - d1(3))];
%         d2 = [sum(YUV(:,1) - d2(1)),sum(YUV(:,2) - d2(2)),sum(YUV(:,3) - d2(3))];
%         d3 = [sum(YCbCr(:,1) - d3(1)),sum(YCbCr(:,2) - d3(2)),sum(YCbCr(:,3) - d3(3))];
%         d4 = [sum(Lab(:,1) - d4(1)),sum(Lab(:,2) - d4(2)),sum(Lab(:,3) - d4(3))];
%         
        
        mean_all_dim = [d1(1),d1(2),d1(3),d2(1),d2(2),d2(3),d3(1),d3(2),d3(3),d4(1),d4(2),d4(3)];
        %mean_all_dim = [d1(1),d1(2),d1(3),d2(1),d2(2),d2(3),d3(1),d3(2),d3(3),d4(1),d4(2),d4(3)];
    end
    
    if strncmp('forest',listeImages(x).name,6)
        ref_foret(foret_count,:) = mean_all_dim;
        foret_count = foret_count +1;
    end
    
    if strncmp('coast',listeImages(x).name,5)
        ref_coast(coast_count,:) = mean_all_dim;
        coast_count = coast_count +1;
    end
    
    if strncmp('street',listeImages(x).name,6)
        ref_street(street_count,:) = mean_all_dim;
        street_count = street_count +1;
    end
end




Li = length(ref_foret);
rfi = ref_foret;
moy_ref_foret = [sum(rfi(:,1))/Li; sum(rfi(:,2))/Li; sum(rfi(:,3))/Li; sum(rfi(:,4))/Li; sum(rfi(:,5))/Li; sum(rfi(:,6))/Li; sum(rfi(:,7))/Li; sum(rfi(:,8))/Li;sum(rfi(:,9))/Li;sum(rfi(:,10))/Li;sum(rfi(:,11))/Li;sum(rfi(:,12))/Li;];

Li = length(ref_coast);
rfi = ref_coast;
moy_ref_coast = [sum(rfi(:,1))/Li; sum(rfi(:,2))/Li; sum(rfi(:,3))/Li; sum(rfi(:,4))/Li; sum(rfi(:,5))/Li; sum(rfi(:,6))/Li; sum(rfi(:,7))/Li; sum(rfi(:,8))/Li;sum(rfi(:,9))/Li;sum(rfi(:,10))/Li;sum(rfi(:,11))/Li;sum(rfi(:,12))/Li;];

Li = length(ref_street);
rfi = ref_street;
moy_ref_street = [sum(rfi(:,1))/Li; sum(rfi(:,2))/Li; sum(rfi(:,3))/Li; sum(rfi(:,4))/Li; sum(rfi(:,5))/Li; sum(rfi(:,6))/Li; sum(rfi(:,7))/Li; sum(rfi(:,8))/Li;sum(rfi(:,9))/Li;sum(rfi(:,10))/Li;sum(rfi(:,11))/Li;sum(rfi(:,12))/Li;];


ref_vectors_images = cat(1,ref_foret,ref_coast);
rfi = cat(1,ref_vectors_images,ref_street);
Li = length(ref_vectors_images);

moy_ref_vectors_images = [sum(rfi(:,1))/Li; sum(rfi(:,2))/Li; sum(rfi(:,3))/Li; sum(rfi(:,4))/Li; sum(rfi(:,5))/Li; sum(rfi(:,6))/Li; sum(rfi(:,7))/Li; sum(rfi(:,8))/Li;sum(rfi(:,9))/Li;sum(rfi(:,10))/Li;sum(rfi(:,11))/Li;sum(rfi(:,12))/Li;];

m = rfi'- moy_ref_vectors_images;
cov_ref_vectors_images = (m*m')/(Li-1);


x1 = randn(length(ref_foret),1);
x2 = randn(length(ref_coast),1);
x3 = randn(length(ref_street),1);
   
figure
subplot(2,3,1)
plot(x1,ref_foret(:,1),'o',x2,ref_coast(:,1),'*',x3,ref_street(:,1),'+');
title('RGB: c1')

subplot(2,3,2)
plot(x1,ref_foret(:,2),'o',x2,ref_coast(:,2),'*',x3,ref_street(:,2),'+');
title('RGB: c2')

subplot(2,3,3)
plot(x1,ref_foret(:,3),'o',x2,ref_coast(:,3),'*',x3,ref_street(:,3),'+');
title('RGB: c3')

subplot(2,3,4)
plot(0,moy_ref_foret(1),'o',0,moy_ref_coast(1),'*',0,moy_ref_street(1),'+');
title('RGB: c1')

subplot(2,3,5)
plot(0,moy_ref_foret(2),'o',0,moy_ref_coast(2),'*',0,moy_ref_street(2),'+');
title('RGB: c2')

subplot(2,3,6)
plot(0,moy_ref_foret(3),'o',0,moy_ref_coast(3),'*',0,moy_ref_street(3),'+');
title('RGB: c3')



figure
subplot(2,3,1)
plot(x1,ref_foret(:,4),'o',x2,ref_coast(:,4),'*',x3,ref_street(:,4),'+');
title('YUV: c1')

subplot(2,3,2)
plot(x1,ref_foret(:,5),'o',x2,ref_coast(:,5),'*',x3,ref_street(:,5),'+');
title('YUV: c2')

subplot(2,3,3)
plot(x1,ref_foret(:,6),'o',x2,ref_coast(:,6),'*',x3,ref_street(:,6),'+');
title('YUV: c3')

subplot(2,3,4)
plot(0,moy_ref_foret(4),'o',0,moy_ref_coast(4),'*',0,moy_ref_street(4),'+');
title('YUV: c1')

subplot(2,3,5)
plot(0,moy_ref_foret(5),'o',0,moy_ref_coast(5),'*',0,moy_ref_street(5),'+');
title('YUV: c2')

subplot(2,3,6)
plot(0,moy_ref_foret(6),'o',0,moy_ref_coast(6),'*',0,moy_ref_street(6),'+');
title('YUV: c3')



figure
subplot(2,3,1)
plot(x1,ref_foret(:,7),'o',x2,ref_coast(:,7),'*',x3,ref_street(:,7),'+');
title('YCbCr: c1')

subplot(2,3,2)
plot(x1,ref_foret(:,8),'o',x2,ref_coast(:,8),'*',x3,ref_street(:,8),'+');
title('YCbCr: c2')

subplot(2,3,3)
plot(x1,ref_foret(:,9),'o',x2,ref_coast(:,9),'*',x3,ref_street(:,9),'+');
title('YCbCr: c3')

subplot(2,3,4)
plot(0,moy_ref_foret(7),'o',0,moy_ref_coast(7),'*',0,moy_ref_street(7),'+');
title('YCbCr: c1')

subplot(2,3,5)
plot(0,moy_ref_foret(8),'o',0,moy_ref_coast(8),'*',0,moy_ref_street(8),'+');
title('YCbCr: c2')

subplot(2,3,6)
plot(0,moy_ref_foret(9),'o',0,moy_ref_coast(9),'*',0,moy_ref_street(9),'+');
title('YCbCr: c3')


figure
subplot(2,3,1)
plot(x1,ref_foret(:,10),'o',x2,ref_coast(:,10),'*',x3,ref_street(:,10),'+');
title('Lab: c1')

subplot(2,3,2)
plot(x1,ref_foret(:,11),'o',x2,ref_coast(:,11),'*',x3,ref_street(:,11),'+');
title('YCbCr: c2')

subplot(2,3,3)
plot(x1,ref_foret(:,12),'o',x2,ref_coast(:,12),'*',x3,ref_street(:,12),'+');
title('Lab: c3')

subplot(2,3,4)
plot(0,moy_ref_foret(10),'o',0,moy_ref_coast(10),'*',0,moy_ref_street(10),'+');
title('Lab: c1')

subplot(2,3,5)
plot(0,moy_ref_foret(11),'o',0,moy_ref_coast(11),'*',0,moy_ref_street(11),'+');
title('Lab: c2')

subplot(2,3,6)
plot(0,moy_ref_foret(12),'o',0,moy_ref_coast(12),'*',0,moy_ref_street(12),'+');
title('Lab: c3')

disp(['street_count:',num2str(street_count),'  coast_count:',num2str(coast_count),'  foret_count:',num2str(foret_count)]);

%% Classification à l'aide d'une méthode paramétrique (supervisé ou non)
% on fait le regroupement des points
donnees = cat(1,ref_foret,ref_coast);
donnees = cat(1,donnees,ref_street);
nbNuages=50; % Changer cette variable afin de comprendre l'impact du choix du nombre de nuages.



donnees_forest = [ref_foret(:,1) ref_foret(:,6) ref_foret(:,9)];
donnees_coast = [ref_coast(:,1) ref_coast(:,6) ref_coast(:,9)];
donnees_street = [ref_street(:,1) ref_street(:,6) ref_street(:,9)];


Lkm = length( donnees_forest(1,:))+1;
[indexes, centres] = kmeans (donnees_forest, nbNuages);
km1 = K_imgPPV(donnees_forest,donnees_coast,donnees_street,centres,1,2,3);
for i = 1:length(indexes)
    indexes(i) = km1( indexes(i), Lkm);
end
km300 = (sum(indexes==1)/length(indexes))*100;
fprintf('%2.2f%% de reussite KMeans Foret\n',km300);

Lkm = length( donnees_coast(1,:))+1;
[indexes, centres] = kmeans (donnees_coast, nbNuages);
km1 = K_imgPPV(donnees_forest,donnees_coast,donnees_street,centres,1,2,3);
for i = 1:length(indexes)
    indexes(i) = km1( indexes(i), Lkm);
end
km300 = (sum(indexes==1)/length(indexes))*100;
fprintf('%2.2f%% de reussite KMeans Coast\n',km300);

Lkm = length( donnees_street(1,:))+1;
[indexes, centres] = kmeans (donnees_street, nbNuages);
km1 = K_imgPPV(donnees_forest,donnees_coast,donnees_street,centres,1,2,3);
for i = 1:length(indexes)
    indexes(i) = km1( indexes(i), Lkm);
end
km300 = (sum(indexes==1)/length(indexes))*100;
fprintf('%2.2f%% de reussite KMeans Street\n',km300);



%% Testes avec deux experiences différentes (présentations différentes de couleurs des images)

%% Performence et résultats obtenus


end
