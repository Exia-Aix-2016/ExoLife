getd ('../../libs/')
img1 = readpbm('GD61.pbm')
maxI = max(img1)
minI = min(img1)

img2 = 255/(maxI-minI)*(img1 - minI)

scf(0)
display_gray(img1)

scf(1)
display_gray(img2)
