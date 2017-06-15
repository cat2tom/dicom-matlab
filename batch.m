%img=analyze75read('reconmc.hdr');
%img=flipdim(img,1);
img = restore_idl('reconmctomatlab.sav');
img = img.RECON;
img = imrotate(img,-90);
img = flipdim(img,2);
dicomreadtool
dicomwritetool