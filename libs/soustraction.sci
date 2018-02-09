//Calculate the soustraction from two images
//img1 : the first image
//img2 : the image to add to the first one
function render=soustraction(img1,img2)
    //The size of the images
    [wd,he]=size(img1);
    //Create an empty image
    render = zeros(wd,he);
    //For each lines
    for i=1:he
        //For each columns
        for j=1:wd
            pix1 = img1(j,i);
            pix2 = img2(j,i);
            render(j,i) = max(pix1 - pix2,0);
        end
    end
endfunction
