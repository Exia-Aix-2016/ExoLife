//CHARGEMENT DE l'IMAGE
img = imread('U1_surface.pbm')

//AFFICHAGE DE l'IMAGE ORIGINALE
scf(0)
title("image originale")
imshow(img)

//HISTOGRAMME
hist = zeros(1,256)
xmax = size(imgF,1)
ymax = size(imgF,2)



//HISTOGRAMME DE L'IMAGE
for x=1:xmax
   for y=1:ymax
         hist(double(img(x,y))+1) = hist(double(img(x,y))+1)+1
   end
end

//AFFICHAGE HISTOGRAMME
scf(1)
title("Histogramme de limage")
plot(hist)


//FILTRAGE IMAGE : PASSE-HAUT
filtre_passe_haut = [
    0 -2 0
    -2 9 -2
    0 -2 0
]
//CREATION DE L'IMAGE FILTREE
imgF = imfilter(img, filtre_passe_haut)

//AFFICHAGE IMAGE FILTREE
scf(2)
title("image filtrée via passe-haut")
imshow(imgF)



//HISTOGRAMME
hist = zeros(1,256)
xmax = size(imgF,1)
ymax = size(imgF,2)



//HISTOGRAMME FILTRE
for x=1:xmax
   for y=1:ymax
         hist(double(imgF(x,y))+1) = hist(double(imgF(x,y))+1)+1
   end
end

//AFFICHAGE HISTOGRAMME
scf(3)
title("Histogramme de limage filtrée")
plot(hist)





