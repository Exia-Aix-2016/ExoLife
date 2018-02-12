getd ('../../libs/')

img = readpbm('Encelade_surface.pbm');
xmax = size(img,1);
ymax = size(img,2);
xcoord = 0;
ycoord = 0;
value = 0;

for x=1:xmax
    for y=1:ymax
        if(img(x,y) >= value) then
            value = uint8(img(x,y));
            xcoord = x;
            ycoord = y;
        end
    end
end

disp(xcoord, ycoord, value);
