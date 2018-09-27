% Jean Rouat, 22 septembre 2014, Universite de Sherbrooke
% fonction permettant de visualiser les composantes d'une image, qu'elle soit
% representee par des composantes RGB, YUV ou autres.
% La visualisation est en niveaux de gris.
function JR_PlotRepresentation(image)
% VARIABLES d'entree:
%       - image, matrice à 3 dimensions
%       (nbPixelsHauteur,nbPixelsLargeur,nbComposantes) de pixels codes en
%       entier sur 8 bits.
% VARIABLES de sortie:
%       - aucune pour l'instant
%%%%%%%%%%%
% testee sur matlab version R2012a et sur octave 3.8.0

%% Validation de la taille de l'image
%% A completer le code pour pouvoir le faire fonctionner
taille = size(image);
hauteur=taille(1); % non utilisee ici
largeur=taille(2); % non utilisee ici
nbComposantes=taille(3);

%% On affiche chaque composante
figure;
for i=1:nbComposantes
    subplot(1,nbComposantes,i), imshow(image(:,:,i)),
    title(['Composante ', int2str(i), ' image']),
end
    
