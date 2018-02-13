function img = histeq(imsource)
      xmax = size(imsource,1);
      ymax = size(imsource,2);

      hist = zeros(1,256);
      hc = zeros(1,256);

      for x=1:xmax
        for y=1:ymax
              hist(double(imsource(x,y))+1) = hist(double(imsource(x,y))+1)+1;
        end
     end
     
     hc(1) = hist(1)
     for x=2:256
        hc(x) = hc(x-1) + hist(x);
     end
     
     for x=1:xmax
        for y=1:ymax
              img(x,y) = (hc(double(imsource(x,y))+1) * 255) / (xmax * ymax);
        end
     end

     img = uint8(img);
endfunction