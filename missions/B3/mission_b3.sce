getd ('../../libs/')
img = readpbm('HD215497.pbm')
xmax = size(img,1)
ymax = size(img,2)
hist = zeros(1,256)

// Réalisation de l'histogramme
for x=1:xmax
    for y=1:ymax
        hist(double(img(x,y))+1)=hist(double(img(x,y))+1)+1;
    end
end

// Affichage de l'histogramme
scf(0)
plot(hist)
xs2png(0, "img/histogramme.png");

// Calcul du seuillage
scf(1)
display_gray(seuillage(img, 10))
imwrite(to_native_img(seuillage(img, 10)), "img/seuillage10.png");

scf(2)
display_gray(seuillage(img, 16))
imwrite(to_native_img(seuillage(img, 16)), "img/seuillage16.png");

scf(3)
display_gray(seuillage(img, 31))
imwrite(to_native_img(seuillage(img, 31)), "img/seuillage31.png");

scf(4)
display_gray(seuillage(img, 255))
imwrite(to_native_img(seuillage(img, 255)), "img/seuillage255.png");
