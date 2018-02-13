getd ('../../libs/');

//CHARGEMENT IMAGES
img_origine_v2 = readpbm("Gliese 581d V2.pbm");
img_origine = readpbm("Gliese 581d.pbm");

//===============IMG V2===============

scf(1);
title("Image : Gliese 581d V2 bruitée");
display_gray(img_origine_v2);

//HISTOGRAMME IMAGE NON DEBRUITE
scf(2);
title("histogramme image non débruitée");
hist = histogramme(img_origine_v2);
plot(hist);

//Application du median afin de débruité
funcprot(0);
imgf = median(img_origine_v2, 1);

scf(3);
title("Image : Gliese 581d V2 débruitée");
display_gray(imgf);

// Export
imwrite(to_native_img(imgf), 'img/result_v2.png');

//HISTOGRAMME IMAGE DEBRUITE
scf(4);
title("histogramme image débruitée");
hist = histogramme(imgf);
plot(hist);

//===============IMG V1===============
scf(5);
title("Image : Gliese 581d : bruitée");
display_gray(img_origine);

xmax = size(img_origine,1);
ymax = size(img_origine,2);

for x=1:xmax
   for y=1:ymax
       if img_origine(x,y) < 100 then
           img_origine(x,y) = 0;
       elseif img_origine(x,y) > 150 then
           img_origine(x,y) = 0;
       else
           img_origine(x,y) = 255;       
         end
   end
end

scf(7);
display_gray(img_origine);

// Export
imwrite(to_native_img(img_origine), 'img/result_v1.png');