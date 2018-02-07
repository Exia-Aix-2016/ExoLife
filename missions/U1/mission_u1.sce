
//CHARGEMENT DE l'IMAGE
img = imread('U1_surface.pbm')

//AFFICHAGE DE l'IMAGE ORIGINALE
scf(0)
imshow(img)

//PASSE-HAUT
filtre_passe_haut = [
    0 -2 0
    -2 9 -2
    0 -2 0
]
//CREATION DE L'IMAGE FILTREE
imgF = imfilter(img, filtre_passe_haut)
//AFFICHAGE IMAGE FILTREE
scf(1)
imshow(imgF)



//





