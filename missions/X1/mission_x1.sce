getd ('../../libs/');

//CHARGEMENT DE l'IMAGE
load('Asellus_Secundus.sod');

scf(0);
title("Images Originale");
display_gray(asellus_secundus);

result = real(ifft(asellus_secundus));
result = uint8(result);

scf(10);
title("Images Result");
display_gray(result);

imwrite(to_native_img(result), 'img/result.png');