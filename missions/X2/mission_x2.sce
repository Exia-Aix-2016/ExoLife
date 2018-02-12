getd("..\ExoLife\libs\")
//CHARGEMENT IMAGES
img_origine_v2 = readpbm("missions\X2\Gliese 581d V2.pbm")
img_origine = readpbm("missions\X2\Gliese 581d.pbm")


//===============IMG V2===============
scf(1)
title("Image : Gliese 581d V2 bruitée")
display_gray(img_origine_v2)
//HISTOGRAMME IMAGE NON DEBRUITE
scf(2)
title("histogramme image non débruitée")
hist = histogramme(img_origine_v2)
plot(hist)


//Application du median afin de débruité
funcprot(0)
imgf = median(img_origine_v2, 1)

scf(3)
title("Image : Gliese 581d V2 débruitée")
display_gray(imgf)

//HISTOGRAMME IMAGE DEBRUITE
scf(4)
title("histogramme image débruitée")
hist = histogramme(imgf)
plot(hist)

//===============IMG V2===============
scf(5)
title("Image : Gliese 581d : bruitée")
display_gray(img_origine)


//HISTOGRAMME IMAGE NON DEBRUITE
scf(6)
title("histogramme image débruitée")
hist = histogramme(img_origine)
plot(hist)



//Application du median afin de débruité
funcprot(0)
imgf = median(img_origine, 0.1)

scf(7)
title("Image : Gliese 581d débruitée")
display_gray(imgf)

