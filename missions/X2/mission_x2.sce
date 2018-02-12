//CHARGEMENT IMAGE : Gliese 581d.pbm
getd("..\ExoLife\libs\")


img_origine_v2 = readpbm("missions\X2\Gliese 581d V2.pbm")

scf(1)
title("Image : Gliese 581d V2")
display_gray(img_origine_v2)



