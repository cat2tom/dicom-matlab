%directory_name = uigetdir;
%if isequal(directory_name,0)
%    return
%end
currentFolder = pwd;
directory_name = [currentFolder,filesep,'siemensbone'];
x=strfind(directory_name,filesep);
ind = x(end)+1;
basename = directory_name(ind:length(directory_name));

files = dir(directory_name);
I = zeros(512,512,numel(files)-2);

for n=3:numel(files)
    metadata=dicominfo([directory_name,'\',files(n).name]);
    N=metadata.InstanceNumber;
      header{N}=dicominfo([directory_name,'\',files(n).name]);
    
   I(:,:,N) = dicomread([directory_name,'\',files(n).name])*metadata.RescaleSlope+metadata.RescaleIntercept; 
   % I(:,:,metadata.InstanceNumber) = I(:,:,metadata.InstanceNumber)';
end