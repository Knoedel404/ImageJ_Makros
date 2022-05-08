title="B9_vha100_ceramide_lc3_larva5_2021_06_29__08_07_01";
inputDirectory="C:/Users/tic45/Documents/Uni/BlockPraktika/Autophagy_vha100_5/ICC/Originals/Ceramide, LC3/B9_vha100_ceramide_lc3/29.06.21_larva 5o5/";
outputDirectory="C:/Users/tic45/Documents/Uni/BlockPraktika/Autophagy_vha100_5/ICC/PicturesTiff/Ceramide, LC3/B9_vha100/B9_vha100_5o5/";
list=getFileList(inputDirectory);
for (i = 0; i < list.length; i++) {													
	title=list[i].replace(".lsm","");
	open(inputDirectory+title+".lsm");
	selectWindow(title+".lsm");
	run("Z Project...", "projection=[Max Intensity]");
	run("Split Channels");
	//selectWindow("C2-MAX_"+title+".lsm");
	//run("RGB Color");
	selectWindow("C1-MAX_"+title+".lsm");
	run("RGB Color");
	selectWindow("C3-MAX_"+title+".lsm");
	run("RGB Color");
	//selectWindow("C2-MAX_"+title+".lsm");
	//saveAs("Tiff", outputDirectory+"C2-MAX_"+title+".tif");
	selectWindow("C1-MAX_"+title+".lsm");
	saveAs("Tiff", outputDirectory+"C1-MAX_"+title+".tif");
	selectWindow("C3-MAX_"+title+".lsm");
	saveAs("Tiff", outputDirectory+"C3-MAX_"+title+".tif");
	run("Merge Channels...", "c1=[C3-MAX_"+title+".tif] c3=[C1-MAX_"+title+".tif] create keep");
	selectWindow("Composite");
	run("RGB Color");
	saveAs("Tiff", outputDirectory+"MAX_"+title+".tif");
	run("Close All");
}
//red and blue