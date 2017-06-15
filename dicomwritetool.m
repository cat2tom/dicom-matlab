
mkdir([basename,'.mc'])  %'dcm'

metadata=header{1,1};
[ncol,nrow,nplane] = size(img);

% generate unique sieres UID
uid = dicomuid;
for i=1:nplane
        header{1,i}.SeriesInstanceUID = uid;
end

% update dimension if they are not standard
if ncol ~= 512  
    for i=1:nplane
        header{1,i}.Width = ncol;
        header{1,i}.Columns = 512;
    end
else
    for i=1:nplane
        header{1,i}.Width = 512;
        header{1,i}.Columns = 512;
    end
end
if nrow ~= 512  
    for i=1:nplane
        header{1,i}.Height = nrow;
        header{1,i}.Rows = nrow;
    end
else
    for i=1:nplane
        header{1,i}.Height = 512;
        header{1,i}.Rows = 512;
    end
end

%for i=1:153
%dicomwrite(int16(I(:,:,i))/metadata.RescaleSlope-metadata.RescaleIntercept,['dcm1/','0000',sprintf('%d',i),'.dcm'],header{i},'CreateMode','Copy');
%end

% write dicom
% only for flash?
for i=1:nplane
dicomwrite(int16(img(:,:,nplane+1-i))/metadata.RescaleSlope-metadata.RescaleIntercept,[[basename,'.mc/'],'0000',sprintf('%d',i),'.dcm'],header{i},'CreateMode','Copy');
end
%I(:,:,i)'

