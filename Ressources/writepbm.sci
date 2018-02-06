// writing image PGM RAW (8 bits) (PBM)
// usage: writepbm(img,'image.pbm');

function writepbm(image,filename)  
  fd=mopen(filename,'wb');
  s=size(image);
  mputl('P5',fd);
  mputl(string(s(1)),fd);
  mputl(string(s(2)),fd);
  mputl("255",fd);
  
  mput(image,'uc');
  
  mclose();
endfunction
