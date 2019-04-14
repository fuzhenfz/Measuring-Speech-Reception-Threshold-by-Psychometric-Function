%计算被试，在每种condition下的可懂度
%一共有2 noise* 6 SNR种condition
%返回值ssnResult ttsResult是N个被试在每种condition下的可懂度结果 N*6

%% HI subjects
clear

subject = {'ZXQ','zl','JJK','HXL','WGX','lx','MQF','NYH','ZHY','XCQ'};
root_path = 'result/';
N = length(subject);
ttsResult = zeros(N,6);
ssnResult = zeros(N,6);
ttsSNR = zeros(N,6);
ssnSNR = zeros(N,6);

for i = 1:N
    ssn_path = strcat(root_path,subject{i},'-ssn.mat');
    tts_path = strcat(root_path,subject{i},'-tts.mat');
    load(ssn_path);
    ssnSNR(i,:) = unique(randSNR);
    for j = 1:length(ssnSNR(i,:))
        index = find(randSNR == ssnSNR(i,j));
        tmp = results(index,:);
        countOne = sum(tmp(:) == 1);
        ssnResult(i,j) =countOne;
    end
    srt(i,1) = CalSRT(ssnSNR(i,:),ssnResult(i,:));
    
    load(tts_path);
    ttsSNR(i,:) = unique(randSNR);   % ttsSNR是排好序的，从小到大
    for j = 1:length(ttsSNR(i,:))
        index = find(randSNR == ttsSNR(i,j));
        tmp = results(index,:);
        countOne = sum(tmp(:) == 1);
        ttsResult(i,j) = countOne;
    end
%     srt(i,2) = CalSRT(ttsSNR(i,:),ttsResult(i,:));
    
end

%
figure
for i = 1:N
    plot(ssnSNR(i,:),ssnResult(i,:),'-*');
    hold on;
end
xlim([-10 6]);
legend(subject);
set(gca,'XTick',[-10 -8 -6 -4 -2 0 2 4 6],'XTickLabel',{-10 -8 -6 -4 -2 0 2 4 6});
xlabel('SNR/dB','FontWeight','bold','FontSize',20,'FontName','Times New Roman');
ylabel('Correct rate (%)','FontWeight','bold','FontSize',20,'FontName','Times New Roman');
title('Subject Speech Intelligibility(SSN)','FontWeight','bold','FontSize',20,'FontName','Times New Roman');
figure_FontSize=16;
set(get(gca,'XAxis'),'FontSize',figure_FontSize);
set(get(gca,'YAxis'),'FontSize',figure_FontSize);
set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);

figure
for i = 1:N
    plot(ttsSNR(i,:),ttsResult(i,:),'-*');
    hold on;
end
xlim([-12 6]);
legend(subject);
set(gca,'XTick',[-10 -8 -6 -4 -2 0 2 4 6],'XTickLabel',{-10 -8 -6 -4 -2 0 2 4 6});
xlabel('SNR/dB','FontWeight','bold','FontSize',20,'FontName','Times New Roman');
ylabel('Correct rate (%)','FontWeight','bold','FontSize',20,'FontName','Times New Roman');
title('Subject Speech Intelligibility(TTS)','FontWeight','bold','FontSize',20,'FontName','Times New Roman');
figure_FontSize=16;
set(get(gca,'XAxis'),'FontSize',figure_FontSize);
set(get(gca,'YAxis'),'FontSize',figure_FontSize);
set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);


%% NH subjects
clear

subject = {'dyf','nyd','cgf','pc','lx2','cjx','lxy','lj','hql','wyy'};
root_path = 'result/';
N = length(subject);
ttsResult = zeros(N,6);
ssnResult = zeros(N,6);
ttsSNR = zeros(N,6);
ssnSNR = zeros(N,6);

for i = 1:N
    ssn_path = strcat(root_path,subject{i},'-ssn.mat');
%     tts_path = strcat(root_path,subject{i},'-tts.mat');
    load(ssn_path);
    ssnSNR(i,:) = unique(randSNR);
    for j = 1:length(ssnSNR(i,:))
        index = find(randSNR == ssnSNR(i,j));
        tmp = results(index,:);
        countOne = sum(tmp(:) == 1);
        ssnResult(i,j) =countOne;
    end
    srt(i,1) = CalSRT(ssnSNR(i,:),ssnResult(i,:));
%     
%     load(tts_path);
%     ttsSNR(i,:) = unique(randSNR);   % ttsSNR是排好序的，从小到大
%     for j = 1:length(ttsSNR(i,:))
%         index = find(randSNR == ttsSNR(i,j));
%         tmp = results(index,:);
%         countOne = sum(tmp(:) == 1);
%         ttsResult(i,j) = countOne;
%     end
%     srt(i,2) = CalSRT(ttsSNR(i,:),ttsResult(i,:));
    
end

%
figure
for i = 1:N
    plot(ssnSNR(i,:),ssnResult(i,:),'-*');
    hold on;
end
xlim([-12 6]);
legend(subject);
set(gca,'XTick',[-10 -8 -6 -4 -2 0 2 4 6],'XTickLabel',{-10 -8 -6 -4 -2 0 2 4 6});
xlabel('SNR/dB','FontWeight','bold','FontSize',20,'FontName','Times New Roman');
ylabel('Correct rate (%)','FontWeight','bold','FontSize',20,'FontName','Times New Roman');
title('Subject Speech Intelligibility(SSN)','FontWeight','bold','FontSize',20,'FontName','Times New Roman');
figure_FontSize=16;
set(get(gca,'XAxis'),'FontSize',figure_FontSize);
set(get(gca,'YAxis'),'FontSize',figure_FontSize);
set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);

% figure
% for i = 1:N
%     plot(ttsSNR(i,:),ttsResult(i,:),'-*');
%     hold on;
% end
% xlim([-10 6]);
% legend(subject);
% set(gca,'XTick',[-10 -8 -6 -4 -2 0 2 4 6],'XTickLabel',{-10 -8 -6 -4 -2 0 2 4 6});
% xlabel('SNR/dB','FontWeight','bold','FontSize',20,'FontName','Times New Roman');
% ylabel('Correct rate (%)','FontWeight','bold','FontSize',20,'FontName','Times New Roman');
% title('Subject Speech Intelligibility(TTS)','FontWeight','bold','FontSize',20,'FontName','Times New Roman');
% figure_FontSize=16;
% set(get(gca,'XAxis'),'FontSize',figure_FontSize);
% set(get(gca,'YAxis'),'FontSize',figure_FontSize);
% set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);

