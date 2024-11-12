clc; clear;

dic  = "./Sec/Extra/";
name = strcat(dic,"analysis.tif");
blue = strcat(dic,"blue2analysis.tif");
red = strcat(dic,"red2analysis.tif");

imageGreen = imread(name); 
imageBlue = imread(blue);
imageRed = imread(red);

figure(1); imshow(imageBlue, []); impixelinfo;
axis on; hold on;

% Important params to change
N=20000; %number of points to measure per line (each red co-centric line)
it = 200; % number of co-centric lines

%MB/S2=250
%MB/S1=900
%MB/Main=250
%sec/main=250
%sec/s1=250
%sec/s2=250
%sec/extra=250
dist2center = 250; % start of co-centric lines in pixels
sep_lines = 10; % separation between lines
date = '092024'; % date of analysis for file generation

%variables used to save raw values and means, etc
cx_all = zeros(it, N);
cy_all = zeros(it, N);
mask_all = zeros(it, N);
mask_allb = zeros(it, N);
mask_allr = zeros(it, N);
means = zeros(it,1);
meansb = zeros(it,1);
meansr = zeros(it,1);

%User prompts used to identify center of the image
%--------------------------------------------------------
message = sprintf('Draw horizontal line (edge to edge of the circle).');
text(5, 250, "", 'Color', 'r', 'FontSize', 20);
uiwait(msgbox(message));
[cxh, cyh, maskh] = improfile();
x0h = cxh(ceil(length(cxh)/2),1);
y0h = cyh(ceil(length(cyh)/2),1);
plot(x0h, y0h, 'y*');
%--------------------------------------------------------

%--------------------------------------------------------
message = sprintf('Draw vertical line.');
text(15, 250, "", 'Color', 'r', 'FontSize', 20);
uiwait(msgbox(message));
[cxv, cyv, maskv] = improfile();
x1h = cxv(ceil(length(cxv)/2),1);
y1h = cyv(ceil(length(cyv)/2),1);
plot(x1h, y1h, 'r*');
%--------------------------------------------------------

%--------------------------------------------------------
message = sprintf('Using intersection of lines, choose center of circle');
text(25, 250, "", 'Color', 'r', 'FontSize', 12);
uiwait(msgbox(message));
[cx, cy, mask] = improfile();
x0 = cx(1,1);
y0 = cy(1,1);
phi360 = linspace(0,2*pi,361);
r0 = [x0,y0];
%--------------------------------------------------------
% for each of the co-centric lines (it), get N number of points
% and calculate means for each line for each channel.
for j=1:it 
    r = (sep_lines*j)+dist2center;
    x_j = r*cos(phi360(:))+r0(1);
    y_j = r*sin(phi360(:))+r0(2);
    [cx, cy, mask] = improfile(imageGreen, x_j, y_j,  N);
    [cxb, cyb, maskb] = improfile(imageBlue, x_j, y_j,  N);
    [cxr, cyr, maskr] = improfile(imageRed, x_j, y_j,  N);
    plot(cx, cy, 'r--', 'LineWidth', 0.2);
    cx_all(j,:) = transpose(cx);
    cy_all(j,:) = transpose(cy);
    data = mask(:,:,2);
    datab = maskb(:,:,3);
    datar = maskr(:,:,1);
    data(isnan(data))=mean(data,"omitnan");
    datab(isnan(datab))=mean(datab,"omitnan");
    datar(isnan(datar))=mean(datar,"omitnan");
    mask_all(j,:) = data;
    mask_allb(j,:) = datab;
    mask_allr(j,:) = datar;
    %mask_all(j,N) = 255;
    means(j) = mean(mask_all(j,:));
    meansb(j) = mean(mask_allb(j,:));
    meansr(j) = mean(mask_allr(j,:));
    %stds(j) = std(mask_all(j,:));
end

savefig(strcat(dic,'circles',date,'.fig'))

%figure(2);
%boxplot(mask_all.', 1:it, 'plotstyle', 'traditional', 'outliersize', 2,...
%    'Symbol', 'o', 'datalim', [0, 50],...
%    'ColorGroup',lines(size(means)));

%distance in pixels, not used in analysis tho
distances = zeros(it,1);
for d=1:it
    distances(d,1) = ((d-1)*sep_lines)+dist2center;
end

%writematrix(mask_all, strcat(dic,'pixel_vals-',date,'.csv'))
%writematrix(mask_allb, strcat(dic,'pixel_vals_blue-',date,'.csv'))
writematrix(means, strcat(dic,'pixel_means-',date,'.csv'))
writematrix(meansb, strcat(dic,'pixel_means_blue-',date,'.csv'))
writematrix(meansr, strcat(dic,'pixel_means_red-',date,'.csv'))
writematrix(distances, strcat(dic,'distances-',date,'.csv'))

means(means<median(means))=0;
means = means - min(means);

figure(2);
plot(distances, meansb);
hold on;
plot(distances, means);
hold on;
plot(distances, meansr);
savefig(strcat(dic,'profile-', date,'.fig'))

%writematrix(means, strcat(dic,'pixel_means_norm-',date,'.csv'))
%figure(5);
%plot(distances, means);

