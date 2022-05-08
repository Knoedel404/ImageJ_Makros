inputDirectory= getDirectory("input files");
outputDirectory=getDirectory("output files");
list=getFileList(inputDirectory);
for (i = 0; i < list.length; i++) {							
	open(inputDirectory+list[i]);
	title=getTitle();
	title=title.replace(".lsm","");
	selectWindow(title+".lsm");
	run("Z Project...", "projection=[Max Intensity]");
	run("Split Channels");
	selectWindow("C2-MAX_"+title+".lsm");
	run("RGB Color");
	selectWindow("C1-MAX_"+title+".lsm");
	run("RGB Color");
	selectWindow("C3-MAX_"+title+".lsm");
	run("RGB Color");
	selectWindow("C2-MAX_"+title+".lsm");
	saveAs("Tiff", outputDirectory+"C2-MAX_"+title+".tif");
	selectWindow("C1-MAX_"+title+".lsm");
	saveAs("Tiff", outputDirectory+"C1-MAX_"+title+".tif");
	selectWindow("C3-MAX_"+title+".lsm");
	saveAs("Tiff", outputDirectory+"C3-MAX_"+title+".tif");
	run("Merge Channels...", "c1=[C3-MAX_"+title+".tif] c2=[C2-MAX_"+title+".tif] c3=[C1-MAX_"+title+".tif] create keep");
	selectWindow("Composite");
	run("RGB Color");
	saveAs("Tiff", outputDirectory+"MAX_"+title+".tif");
	run("Close All");
}
// red and green and blue