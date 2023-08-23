%% Sample execution for Baseline on CFNet-conv3
% hyper-parameters reported in Supp.material for CVPR'17, Table 2 for arXiv version
tracker_par.join.method = 'corrfilt';
tracker_par.net = 'baseline-conv3-on-cfnet-conv3_e100.mat';
tracker_par.net_gray = 'baseline-conv3-on-cfnet-conv3_gray_e70.mat';
tracker_par.scaleStep = 1.034;
tracker_par.scalePenalty = 0.9820;
tracker_par.scaleLR = 0.66;
tracker_par.wInfluence = 0.27;
tracker_par.zLR = 0.008;

datatest='tc_Baby_ce';

tracker_par.kalman=false;
[~,~,dist,overlap,~,~,mean_t,~] = run_tracker_evaluation(datatest, tracker_par);
fid=fopen('results.csv','a+');
x={datatest,string(tracker_par.kalman),string(dist),string(overlap),string(mean_t)};
fprintf(fid,'%s,',x{1,1:end-1});
fprintf(fid,'%s\n',x{1,end});
tracker_par.kalman=true;
[~,~,dist,overlap,~,~,mean_t,~] = run_tracker_evaluation(datatest, tracker_par);
x={datatest,string(tracker_par.kalman),string(dist),string(overlap),string(mean_t)};
fprintf(fid,'%s,',x{1,1:end-1});
fprintf(fid,'%s\n',x{1,end});
fclose(fid);