% Jean Rouat, 22 septembre 2014, Universite de Sherbrooke
% Familiarisation avec les outils de traitement d'images d'Octave
% testee sur matlab version R2012a et sur octave 3.8.0
%% decommenter la ligne ci-dessous pour une utilisation avec octave
% pkg load image % Charger en memoire les outils de traitement d'image lorque octave est utilise
clear
close all
clc

%% Lire un fichier quelconque d'images couleurs de typr RGB
fichierImage = imread('forest_natu934.jpg');
%fichierImage = imread('coast_bea9.jpg');
%fichierImage = imread('/Donnees12/baseDeDonneesImages/coast_arnat59.jpg');
%fichierImage = imread('coast_arnat59.jpg');
 % Examinez dans l'espace de travail la taille de l'image
whos fichierImage; % comprendre et examiner la facon dont les pixels sont cod'es dans l'image
 
%% visualiser l'image
figure, imshow(fichierImage);

%% Visualiser les histogrammes des 3 composantes
hist3ComposantesRGB=JR_Hist3Composantes(fichierImage);
 
 %% Visualiser les composantes RGB de l'image
 JR_PlotRepresentation(fichierImage);
 % Remarquez les valeurs de pixels differentes.
 % La premiere image code le niveau de rouge (R)
 % La seconde image code le niveau de vert (G)
 % La troisieme image code le niveau de bleu (B)
 % La combinaison des 3 couleurs donne la representation RGB de l'image.
 % 
 % Visualisation avec les couleurs
 JR_PlotRepresentationCouleur(fichierImage);
 
 %% Conversion des images en Yuv selon le standard utilise en video analogique
 imageYUV=JR_Rgb2Yul(fichierImage);
 
 % Visualiser les histogrammes des 3 composantes
 hist3ComposantesYUV=JR_Hist3Composantes(imageYUV)

 % On est curieux et on regarde ce que ca donne visuellement
 figure, imshow(imageYUV), title('representation RGB!!! de l image convertie en YUV');
 % On peut s'amuser a regarder les composantes separemment en niveaux de
 % gris ou en couleur
 JR_PlotRepresentation(imageYUV);
 JR_PlotRepresentationCouleur(imageYUV);
 
 %% Conversion de l'image de RGB a YCbCr selon le standard utilise en video numerique
 imageYCbCr=rgb2ycbcr(fichierImage);
 
  % Visualiser les histogrammes des 3 composantes
hist3ComposantesYCbCr=JR_Hist3Composantes(imageYCbCr)

 % on est curieux et on regarde ce que ca donne visuellement
 figure, imshow(imageYCbCr), title('representation RGB!!! de l image convertie en YCbCr');
 % On peut s'amuser a regarder les composantes separemment en niveaux de
 % gris ou en couleur
 JR_PlotRepresentation(imageYCbCr);
 JR_PlotRepresentationCouleur(imageYCbCr);
 
 %% Conversion de l'image de RGB en Lab selon le standard de transformation perceptive
 [imageLab(:,:,1),imageLab(:,:,2),imageLab(:,:,3)]=RGB2Lab(fichierImage(:,:,1),fichierImage(:,:,2),fichierImage(:,:,3));
 
 % Visualiser les histogrammes des 3 composantes
 hist3ComposantesLab=JR_Hist3Composantes(imageLab)

 % on est curieux et on regarde ce que ca donne visuellement
 figure, imshow(imageLab), title('representation RGB!!! de l image convertie en Lab');
 % On peut s'amuser a regarder les composantes separemment en niveaux de
 % gris ou en couleur
 JR_PlotRepresentation(imageYCbCr);
 JR_PlotRepresentationCouleur(imageYCbCr);
 
  
  %%%%% Quelques fonctions qui peuvent etre utiles:
  % Conversion de YCbCr a RGB : ycbcr2rgb
  % Conversion de l'image en niveaux de gris: rgb2gray
 
 