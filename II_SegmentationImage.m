% Jean Rouat, 22 septembre 2014, Universite de Sherbrooke
% 1) Comprehension du fonctionnement de l'algorithme
% 2) Segmentation d'image par regroupement de points a l'aide des K-Moyennes
% testee sur matlab version R2012a et sur octave 3.8.0
%% decommenter la ligne ci-dessous pour une utilisation avec octave
% pkg load image % Charger en memoire les outils de traitement d'image lorque octave est utilise

%% Demonstration de l'utilisation de l'algorithme des K-Moyennes pour trouver le centre de nuages de points
% On genere des donnees aleatoires
 C1 = randn (100, 2) + 1;
 C2 = randn (100, 2) - 1;
 C3 = 2 .* randn (100, 2);
 donnees = [C1; C2; C3];

% on fait le regroupement des points
  nbNuages=5; % Changer cette variable afin de comprendre l'impact du choix du nombre de nuages.
 [indexes, centres] = kmeans (donnees, nbNuages);

% Plot the result
 figure
 plot (donnees (indexes==1, 1), donnees (indexes==1, 2), 'ro');
 hold on
 plot (donnees (indexes==2, 1), donnees (indexes==2, 2), 'bs');
 plot (donnees (indexes==3, 1), donnees (indexes==3, 2), 'g+');
 plot (centres (:, 1), centres (:, 2), 'kv', 'markersize', 10);
 hold off
 
 
%% Lire un fichier quelconque d'images couleurs de typr RGB
%fichierImage = imread('forest_natu934.jpg');
%fichierImage = imread('coast_bea9.jpg');
fichierImage = imread('forest_natu934.jpg');
 % Examinez dans l'espace de travail la taille de l'image
whos fichierImage; % comprendre et examiner la facon dont les pixels sont cod'es dans l'image
 
%% visualiser l'image
figure, imshow(fichierImage);

%% On organise l'image sous forme de vecteurs a 3 dimensions (1 dimension par composante).
% Il y a donc 256 x 256 vecteurs par image puisqu'elles sont de taille 256
% x 256.
% Attention, ceci est un exemple d'utilisation des K-Moyennes et il ne
% s'agit pas de la meilleure des solutions qui est presentee ici.
taille = size(fichierImage);
hauteur=taille(1); 
largeur=taille(2);
nbComposantes=taille(3);

% on preserve l'image originale qui provient du fichier et on transforme en
% double pour permettre les calculs avec les K-Moyennes
imageApprentissage=double(fichierImage);

% On organise l'image en une serie de vecteurs de dimensions nbComposantes
%% A completer le code pour pouvoir le faire fonctionner
imageApprentissage=reshape(imageApprentissage,256*256,3);

%% On demande a l'algorithme des K-Moyennes de trouver K nuages de points
K=3;% essayer plusieurs valeurs de K et visualiser les resultats

%% On cherche les K nuages de points a l'aide des K-Moyennes.
% La distance entre les vecteurs est la distance euclidienne,
% 
[indexDesNuages, centresDesNuages] = kmeans(imageApprentissage,K,'distance','sqEuclidean');

%% Visualisation des resultats sur les images
% On transforme le vecteur d'index en image de dimension hauteur x largeur
%% A completer le code pour pouvoir le faire fonctionner
etiquettesDePixels = reshape(indexDesNuages,256,256);

figure, imshow(etiquettesDePixels,[]), title('image etiquettee')

%% Pour une meilleure visualisation, on superpose avec l'image d'origine et on reconstruit les segments
% on cree un tableau d'images de segments dont le nombre est egal au nombre de barycentres de K-Means
%% A completer le code pour pouvoir le faire fonctionner avec K>4
segments = cell(1,K);

% On attribue a chaque pixel de l'image une etiquette correspondant au
% groupe de points dans lequel le pixel se trouve. C'est equivalent a
% quantifier par K le nombre de niveaux de couleurs possibles
etiquetteRGB = repmat(etiquettesDePixels,[1 1 K]); % on reproduit K images d'etiquettes couleur

for k = 1:K
    imgageCouleur = fichierImage;
    imgageCouleur(etiquetteRGB ~= k) = 0; % On place les masques de segmentation sur les images
    segments{k} = imgageCouleur;
end

figure;
for i=1:K
    subplot(1,K,i), imshow(segments{i}),
    title(['segment ', int2str(i), ' image']),
end