% Jean Rouat, 22 septembre 2014, Universite de Sherbrooke
% Fonction permettant de convertir une image RGB en image Y'uv selon la 
% convention initiale en video analogique.
% http://en.wikipedia.org/wiki/YUV
% Y: luminance
% U et V : chrominances (i.e. codent les couleurs)
% Ceci permet de mieux separer les composantes couleurs des composantes de
% luminosite.
function imageYUV=JR_Rgb2Yul(imageRGB)
% VARIABLES d'entree:
%       - image RGB, matrice a 3 dimensions
%       (nbPixelsHauteur,nbPixelsLargeur,nbComposantes) d'entiers codes sur
%       8 bits
% VARIABLES de sortie:
%       - image Y'UV, matrice a 3 dimensions
%       (nbPixelsHauteur,nbPixelsLargeur,nbComposantes) d'entiers codes sur
%       8 bits
%%%%%%%%%%%
% testee sur matlab version R2012a et sur octave 3.8.0

%% Creation des variables intermediaires
red=double(imageRGB(:,:,1));
green=double(imageRGB(:,:,2));
%% A completer le code pour pouvoir le faire fonctionner
blue=double(imageRGB(:,:,3));

taille = size(imageRGB);
%% A completer le code pour pouvoir le faire fonctionner
hauteur=taille(1);
largeur=taille(2); 

%% On fait la conversion selon le standard donne a http://en.wikipedia.org/wiki/YUV
% Il existe en effet plusieurs standards Yuv. On prend ici le plus courant
% Une fois les calculs faits on converti de nouveau en entiers apres
% arrondissement
y = floor(0.299*red + 0.587*green + 0.114*blue);
u = floor(-0.14713*red - 0.28886*green + 0.436*blue+128);
v = floor(0.615*red - 0.51498*green - 0.10001*blue+128);

%% On verifie que les valeurs sont compatibles avec un codage en entier sur 8 bits.
y(y > 255) = 255;
y(y < 0)   = 0;
u(u > 255) = 255;
u(u < 0)   = 0;
v(v > 255) = 255;
v(v < 0)   = 0;

%% On convertit en entiers sur 8 bits puis on reorganise afin d'obtenir un format conventionnel d'image
imageYUV=uint8([y u v]);
imageYUV=reshape(imageYUV, [hauteur largeur 3]);



