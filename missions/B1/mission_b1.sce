getd ('../../libs/')

source = readpbm('Gliese 667Cc_surface.pbm')

// Transformation linéaire
result = 255 / (max(source) - min(source)) * (source - min(source))

// Export to png
imwrite(to_native_img(result), "img/result.png")
