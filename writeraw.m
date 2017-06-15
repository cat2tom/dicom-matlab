function writeraw(fname,I,type)

rawFilename=fname;
fid=fopen(rawFilename,'w+');
fwrite(fid,I,type);
fclose(fid);


end