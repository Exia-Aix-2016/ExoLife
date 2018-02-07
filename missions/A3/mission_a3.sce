getd ('../../libs/')
img = readpbm('Europa_surface.pbm')
xmax = size(img,1)
ymax = size(img,2)
noyau = [
1/24 1/24 1/24
1/24 15/24 1/24
1/24 1/24 1/24 
]
scf(0)
imshow(img)

for x=1:xmax
    for y=1:ymax
        if(img(x,y) < 255)then
            img(x,y) = 0
        end
    end
end

img=imfilter(img,noyau)

scf(1)
imshow(img)

