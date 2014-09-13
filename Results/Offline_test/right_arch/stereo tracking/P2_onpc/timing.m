Acq1 = load('fpsAcquisition1.txt');
Acq2 = load('fpsAcquisition2.txt');
Acq1 = Acq1(1:739, :);
Acq2 = Acq2(1:739, :);
Com1 = load('fpsCommunication1.txt');
Com2 = load('fpsCommunication2.txt');
seg1 = load('fpsSegmentation1.txt');
seg2 = load('fpsSegmentation2.txt');


millis1 = [Acq1, seg1, Com1];
millis2 = [Acq2, seg2, Com2];

med1 = [sum(millis1(:,1))/739, sum(millis1(:,2))/739, sum(millis1(:,3))/739, sum(millis1(:,4))/739, sum(millis1(:,5))/739, sum(millis1(:,6))/739];
med2 = [sum(millis2(:,1))/739, sum(millis2(:,2))/739, sum(millis2(:,3))/739, sum(millis2(:,4))/739, sum(millis2(:,5))/739, sum(millis2(:,6))/739];

fps1 = 1./med1
fps2 = 1./med2
