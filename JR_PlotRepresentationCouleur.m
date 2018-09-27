% Jean Rouat, 22 septembre 2014, Universite de Sherbrooke
% fonction permettant de visualiser les composantes d'une image, qu'elle soit
% representee par des composantes RGB, YUV ou autres.
% La visualisation est en couleur
function JR_PlotRepresentationCouleur(image)
% VARIABLES d'entree:
%       - image, matrice à 3 dimensions
%       (nbPixelsHauteur,nbPixelsLargeur,nbComposantes) de pixels codes en
%       entier sur 8 bits.
% VARIABLES de sortie:
%       - aucune pour l'instant
%%%%%%%%%%%
% testee sur matlab version R2012a et sur octave 3.8.0

%% Validation de la taille de l'image
taille = size(image);
hauteur=taille(1); % non utilisee ici
largeur=taille(2); % non utilisee ici
nbComposantes=taille(3);

%% on cree les images intermediaires qui representeront composantes avec les couleurs
% Attention, on suppose que les images utilisent 3 composantes!!!
 %% A completer le code pour pouvoir le faire fonctionner
 imageComp1=(image); imageComp1(:,:,2)=zeros(256,256); imageComp1(:,:,3)=zeros(256,256);
 imageComp2=(image); imageComp2(:,:,1)=zeros(256,256); imageComp2(:,:,3)=zeros(256,256);
 imageComp3=(image); imageComp3(:,:,1)=zeros(256,256); imageComp3(:,:,2)=zeros(256,256);
 tableauTemporaire=[imageComp1 imageComp2 imageComp3];
%% On affiche chaque composante
figure;
for i=1:nbComposantes
    subplot(1,nbComposantes,i), imshow(tableauTemporaire(:,(i-1)*256+1:i*256,:)),
    title(['Composante ', int2str(i), ' image']),
end