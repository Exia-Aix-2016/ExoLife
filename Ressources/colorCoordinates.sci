//Fonction to get the coordinates of the specified color in an image
//imgsrc : The source image to analyse
//clr : The color to find
function coordinates=colorCoordinates(imgsrc,clr)
    //Create empty matrix
    coordinates = []
    //The global index in the result matrix
    bi = 1
    //The size of the image
    [wd,he]=size(imgsrc)
    //For each lines
    for i=1:he
        //For each columns
        for j=1:wd
            pix = imgsrc(j,i)
            if pix == clr 
                coordinates(bi,1) = j
                coordinates(bi,2) = i
                bi = bi+1
            end
        end
    end
endfunction
