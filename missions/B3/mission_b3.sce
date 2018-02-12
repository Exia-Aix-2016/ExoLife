getd ('../../libs/')
img = readpbm('HD215497.pbm')
xmax = size(img,1)
ymax = size(img,2)
hist = zeros(1,256)

for x=1:xmax
    for y=1:ymax
        hist(double(img(x,y))+1)=hist(double(img(x,y))+1)+1;
    end
end

scf(0)
plot(hist)

seuillage(img, 10)
seuillage(img, 16)
seuillage(img, 31)
seuillage(img, 255)


