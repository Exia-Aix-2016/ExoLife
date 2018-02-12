getd ('../../libs/');

img1 = readpbm('Jupiter1.pbm');
img2 = readpbm('Jupiter2.pbm');

// Definir une image bruit
img3 = soustraction(img2, img1);
imwrite(to_native_img(img3), "img/step1.png");

// Soustraire le bruit
img4 = soustraction(img1, img3);
imwrite(to_native_img(img4), "img/step2.png");

// Appliquer un filtre median
result = median(img4, 25);
imwrite(to_native_img(result), "img/result.png");

scf(0)
display_gray(img3);

scf(1)
display_gray(img4);

scf(2)
display_gray(result);
