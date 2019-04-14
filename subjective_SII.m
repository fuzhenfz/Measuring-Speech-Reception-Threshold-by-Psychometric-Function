%计算被试，在每种condition下的可懂度
%一共有2 noise* 6 SNR种condition
%返回值ssnResult ttsResult是N个被试在每种condition下的可懂度结果 N*6

clear

ssnResult = [22	35	62	88	97	97];% Percent correct
ssnSNR = [-10	-8	-6	-4	-2	0];% signal-to-noise ratio
srt = CalSRT(ssnSNR,ssnResult);
