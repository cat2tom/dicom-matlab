
mkdir 'anony'
values.StudyInstanceUID = dicomuid;
values.SeriesInstanceUID = dicomuid;
 
d = dir('SCHEDEL_-C_WD_1_0_H30S_0002/*.IMA');
for p = 1:numel(d)
	dicomanon(d(p).name, sprintf('anony/anon%d.dcm', p), ...
		'update', values)
end