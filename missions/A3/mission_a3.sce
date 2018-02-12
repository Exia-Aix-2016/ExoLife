getd ('../../libs/');

img = readpbm('Europa_surface.pbm');
xmax = size(img,1);
ymax = size(img,2);
noyau = [
    1/24 1/24 1/24
    1/24 15/24 1/24
    1/24 1/24 1/24 
];

scf(0)
display_gray(img)

// Garde uniquement les blancs
for x=1:xmax
    for y=1:ymax
        if(img(x,y) < 255)then
            img(x,y) = 0;
        end
    end
end

// Export step1 to png
imwrite(to_native_img(img), "img/step1.png");

// Filtre passe bas
img=imfilter(img,noyau);

scf(1)
display_gray(img)

// Export result to png
imwrite(to_native_img(img), "img/result.png");
