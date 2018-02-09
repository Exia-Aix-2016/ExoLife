function img=to_native_img(image)  
    xmax = size(image,1)
    ymax = size(image,2)

    img=[]

    for x=1:xmax
        for y=1:ymax
              img(y,x) = image(x,y) 
        end
    end

    img = uint8(img)
endfunction
  