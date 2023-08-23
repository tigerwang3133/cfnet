%% Sample execution for CFNet-conv2
% hyper-parameters reported in Supp.material for CVPR'17, Table 2 for arXiv version
startup;
tracker_par.join.method = 'corrfilt';
tracker_par.net = 'cfnet-conv2_e80.mat';
tracker_par.net_gray = 'cfnet-conv2_gray_e40.mat';
tracker_par.scaleStep = 1.0575;
tracker_par.scalePenalty = 0.9780;
tracker_par.scaleLR = 0.52;
tracker_par.wInfluence = 0.2625;
tracker_par.zLR = 0.005;

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