getd ('../../libs/')

img = readpbm('Mars_surface.pbm');
xmax = size(img,1);
ymax = size(img,2);
total = 0;


for x=1:xmax
    for y=1:ymax
        total = total + img(x,y);
    end
end

total = (total / (xmax * ymax)) *100 / 255;

disp(total)
