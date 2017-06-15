This is a folder contains codes to convert a image to a DICOM serie.

The input is: 1. 'input.raw' - raw data to be converted (saved from IDL or somewhere else)
              2. 'XXX' - the reference siemens DICOM folder (siemens dicom image)
			  
How to use? In matlab command line,
1. img = readraw('input.raw',[512,512,157],'float');
2. dicomreadtool
   select the siemens dicom folder "XXX"
3. dicomwritetool
   the output is in the folder "XXX.mc"
   
   
   
created @ 05.18.2017
author: tao sun - colddiesun@gmail.com