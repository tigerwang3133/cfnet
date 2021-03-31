%% Sample execution for CFNet-conv1
% hyper-parameters reported in Supp.material for CVPR'17, Table 2 for arXiv version
startup;
tracker_par.join.method = 'corrfilt';
tracker_par.net = 'cfnet-conv1_e75.mat';
tracker_par.net_gray = 'cfnet-conv1_gray_e55.mat';
tracker_par.scaleStep = 1.0355;
tracker_par.scalePenalty = 0.9825;
tracker_par.scaleLR = 0.7;
tracker_par.wInfluence = 0.2375;
tracker_par.zLR = 0.0058;

datatest='all';

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
