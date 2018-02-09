//Apply a median filter to the image
//imgsrc : the image to apply the filter
function render=median(imgsrc,tolerance)
    //The size of the images
    [wd,he]=size(imgsrc);
    //Create an empty image
    render = zeros(wd,he);
    //For each lines
    for i=1:he
        //For each columns
        for j=1:wd
            pix = imgsrc(j,i)
            if j-1 > 0 & j+1 < wd & i-1 > 0 & i+1 < he then
                values = []
                ncx = 2
                ncy = 2
                for y=1:3
                    for x=1:3
                        values(length(values)+1) = imgsrc(j+(x-ncx),i+(y-ncy))
                    end
                end
                values = gsort(values,"g","i")
                avg = 0
                for a=1:length(values)
                    avg = avg + values(a)
                end
                avg = avg / length(values)
                if imgsrc(j,i) > avg+tolerance | imgsrc(j,i) < (avg-tolerance) then
                    render(j,i) = values(round(length(values)/2))
                else
                    render(j,i) = imgsrc(j,i)
                end
            end
        end
    end
endfunction
