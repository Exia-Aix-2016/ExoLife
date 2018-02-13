getd ('../../libs/');

img = readpbm('HD215497.pbm');
xmax = size(img,1);
ymax = size(img,2);
hist = zeros(1,256);

// Réalisation de l'histogramme
for x=1:xmax
    for y=1:ymax
        hist(double(img(x,y))+1)=hist(double(img(x,y))+1)+1;
    end
end

// Affichage de l'histogramme
scf(0);
plot(hist);
xs2png(0, "img/histogramme.png");

// Calcul du seuillage
seuillage10 = linear(seuillage(img, 10));
seuillage16 = linear(seuillage(img, 16));
seuillage31 = linear(seuillage(img, 31));
seuillage255 = linear(seuillage(img, 255));

scf(1)
display_gray(seuillage10);
imwrite(to_native_img(seuillage10), "img/seuillage10.png");

scf(2)
display_gray(seuillage16);
imwrite(to_native_img(seuillage16), "img/seuillage16.png");

scf(3)
display_gray(seuillage31);
imwrite(to_native_img(seuillage31), "img/seuillage31.png");

scf(4)
display_gray(seuillage255);
imwrite(to_native_img(seuillage255), "img/seuillage255.png");