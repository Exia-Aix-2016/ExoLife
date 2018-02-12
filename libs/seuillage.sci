function seuillage(img,seuil)
    xmax = size(img,1)
    ymax = size(img,2)
    colorMin = 0
    for x=1:xmax
        for y=1:ymax
            if (img(x,y) < seuil) then
                img(x,y) = colorMin;
            else
                img(x,y) = seuil;
            end
        end
    end
    scf(seuil)
    display_gray(img)
endfunction
