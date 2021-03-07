folderdir='C:\Users\admin\Documents\GitHub\ee554\cfnet\data\validation\tc_Airport_ce\';
filelist=dir(strcat(folderdir,'*.jpg'));
for i =1:length(filelist)
    rgbImage=imread(strcat(folderdir,filelist(i).name));
    all_type(i)
    imshow(rgbImage)
    hold on
    for j=1:1%(length(all_type)-1)/length(filelist)
        index=find(all_type==j);
        rectangle('Position', all_boxes(index(i),1:4),'EdgeColor','r', 'LineWidth', 3)
        rectangle('Position', all_gt(index(i),1:4),'EdgeColor','g', 'LineWidth', 3)
    end
    pause(1/min(100,length(filelist)))
end
hold off