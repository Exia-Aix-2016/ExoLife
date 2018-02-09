getd ('../../libs/')
img1 = readpbm('Jupiter1.pbm')
img2 = readpbm('Jupiter2.pbm')

img3 = soustraction(img2, img1)
img4 = soustraction(img1, img3)

result = median(img4, 25)

scf(0)
display_gray(img3)

//writepbm(result, 'result.pbm')

scf(1)
display_gray(result)
