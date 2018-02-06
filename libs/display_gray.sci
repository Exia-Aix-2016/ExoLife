// displaying an 8 bites gray level coded image (0..255)
// usage examples:
// display_gray(u); (without zoom)
// display_gray(u,3); (with zoom x3)
// display_gray([u;v]); (2 images side by side)

function display_gray(u,varargin)
  clf()
  xset("colormap",graycolormap(256))
  if size(varargin)==0 then z=1, else z=varargin(1), end
  xset("wdim",size(u,1)*z-1,size(u,2)*z-1)
  xsetech(arect=[0 0 0 0])
  Matplot(u',"020")
endfunction
