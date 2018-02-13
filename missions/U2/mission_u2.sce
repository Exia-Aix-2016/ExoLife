getd ('../../libs/');

//CHARGEMENT DE l'IMAGE
img = imread('U2_surface.pbm');

//AFFICHAGE IMAGE
scf(0);
title("Image orginale");
imshow(img);

// Detection de contours
result = edge(img, 'sobel', 0.6);

scf(10);
title("Result");
imshow(result);
imwrite(result, 'img/result.png');