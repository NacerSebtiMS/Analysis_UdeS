% Jean Rouat, 22 septembre 2014, Universite de Sherbrooke
% Fonction permettant de visualiser les 3histogrammes des caracteristiques
% stockees dans les matrices d'images.
function hist3Composantes=JR_Hist3Composantes(image)
% VARIABLES d'entree:
%       - image : matrice a 3 dimensions
%       (nbPixelsHauteur,nbPixelsLargeur,nbComposantes) d'entiers codes sur
%       8 bits
% VARIABLES de sortie:
%       - Les 3 histogrammes places dans une seule matrice a 3 colonnes:
%                       [H1 H2 H3]. Les indices de lignes correspondent aux
%                       valeurs numeriques des histogrammes.
%%%%%%%%%%%
% testee sur matlab version R2012a et sur octave 3.8.0
%% On prepare les histogrammes
nBins = 256; % nb de bins de l'histogramme
%% A completer le code pour pouvoir le faire fonctionner
comp1Hist = imhist(image(:,:,1), nBins); % histogramme de la composante 1
comp2Hist = imhist(image(:,:,2), nBins);
comp3Hist = imhist(image(:,:,3), nBins);

%% Sortie graphique
hFig = figure;
hold on
%% A completer le code pour pouvoir le faire fonctionner
hist3Composantes(1) = stem(1:nBins, comp1Hist,'r'); % y pour jaune, r pour rouge
hist3Composantes(2) = stem(nBins+1:nBins*2, comp2Hist,'g'); % m pour magenta, g pour green
hist3Composantes(3) = stem(nBins*2+1:nBins*3, comp3Hist,'b'); % c pour cyan, b pour bleu
title('Superposition des 3 histogrammes. Rouge: 1ere comp., Vert: 2nd comp., Bleu: 3iem comp.');

%% Creation de la matrice contenant les 3 histogrammes
% Les 3 histogrammes sont concatenes dans une seule matrice.
%hist3Composantes=[comp1Hist comp2Hist comp3Hist];