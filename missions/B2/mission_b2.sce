getd ('../../libs/');

img1 = readpbm('GD61.pbm');
maxI = max(img1);
minI = min(img1);

// Transformation linéaire
img2 = 255/(maxI-minI)*(img1 - minI);
imwrite(to_native_img(img2), "img/result.png")


scf(0)
display_gray(img1);

scf(1)
display_gray(img2);
