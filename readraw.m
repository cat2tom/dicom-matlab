function I=readraw(filename,ndim,type)
% name='total_1cm_act_1.im';

	disp(['	Retrieving Image ' filename ' ...']);
	fid=fopen(filename,'rb');
	if (fid==-1)
	  	error('can not open imput image filem press CTRL-C to exit \n');
	  	pause
	end

        height=ndim(1);        % y
        width=ndim(2);         % x
        nImages=ndim(3);       % z
        
switch type                         % data type
    case 'uint'
        bytes=4;
    case 'uint8'
        bytes=1;
    case 'uint16'
        bytes=2;
    case 'uint32'
        bytes=4;
    case 'uint64'
        bytes=8;
    case 'int'
        bytes=4;
    case 'int8'
        bytes=1;
    case 'int16'
        bytes=2;
    case 'int32'
        bytes=4;
    case 'int64'
        bytes=8;  
    case 'single'
        bytes=4;
    case 'double'
        bytes=8;
    case 'float'
        bytes=4;
    case 'float32'
        bytes=4;
    case 'float64'
        bytes=8;
    case default
         disp 'unknown format'
         return
end
  
if nImages~=1                % 3-dimension
I=zeros(height,width,nImages);

for i=1:nImages
    fseek(fid,height*width*bytes*(i-1),'bof');    % jump to next image
temp = fread(fid,[height width],'float32');
temp=temp';
I(:,:,i) = temp;
end

else                                 % 2-dimension
    I=zeros(heught,width);
%     fseek(fid,height*width*bytes,'bof'); 
temp = fread(fid,[height width],'float32');
temp=temp';
I = temp;    
end

fclose(fid);