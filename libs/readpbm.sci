// reading image PGM RAW (8 bits) (PBM)
// usage: img = readpbm('image.pbm');

function image=readpbm(filename)  
  [u,err]=mopen(filename,'rb')
  if err<>0 then error('Error opening file '+filename), end
  if mgetl(u,1)~='P5' error('Unrecognized format'), end
  z=mgetl(u,1), while part(z,1)=='#', z=mgetl(u,1), end
  n=strtod(z)
  z=mgetl(u,1)
  n=[n strtod(z) ]
  mgetl(u,1)
  image=matrix(mget(n(1)*n(2),'uc',u),n)
  mclose(u)
endfunction
