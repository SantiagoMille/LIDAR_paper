clc;
clear;
name = "C:\Users\santi\OneDrive\Escritorio\Gao Lab\pictures_co-culture\MB_FULL___middle-5-11-2-5-17-mb-full\green_final.tif";
dic  = "C:\Users\santi\OneDrive\Escritorio\Gao Lab\pictures_co-culture\MB_FULL___middle-5-11-2-5-17-mb-full\";
imageGreen = imread(name);

figure(1);
imshow(imageGreen, []);
impixelinfo;
axis on;
hold on;
N=20000;
it = 170; % number of co-centric
cx_all = zeros(it, N);
cy_all = zeros(it, N);
mask_all = zeros(it, N);
means = zeros(it,1);
stds = zeros(it,1);

message = sprintf(' ');
text(5, 250, message, 'Color', 'r', 'FontSize', 12);
uiwait(msgbox(message));
[cxh, cyh, maskh] = improfile();
x0h = cxh(ceil(length(cxh)/2),1);
y0h = cyh(ceil(length(cyh)/2),1);
plot(x0h, y0h, '.');

message = sprintf(' ');
text(5, 250, message, 'Color', 'r', 'FontSize', 12);
uiwait(msgbox(message));
[cxv, cyv, maskv] = improfile();
x1h = cxv(ceil(length(cxv)/2),1);
y1h = cyv(ceil(length(cyv)/2),1);
plot(x1h, y1h, '.');

message = sprintf('Choose center of circle');
text(5, 250, message, 'Color', 'r', 'FontSize', 12);
uiwait(msgbox(message));
[cx, cy, mask] = improfile();
x0 = cx(1,1);
y0 = cy(1,1);
phi360 = linspace(0,2*pi,361);
r0 = [x0,y0];
for j=1:it 
    r = (10*j)+250; %and 900
    x_j = r*cos(phi360(:))+r0(1);
    y_j = r*sin(phi360(:))+r0(2);
    [cx, cy, mask] = improfile(imageGreen, x_j, y_j,  N);
    plot(cx, cy, 'r--', 'LineWidth', 0.2);
    cx_all(j,:) = transpose(cx);
    cy_all(j,:) = transpose(cy);
    data = mask(:,:,2);
    data(isnan(data))=0;
    if j==30
        disp('Stop!');
    end
    mask_all(j,:) = data;
    %mask_all(j,N) = 255;
    means(j) = mean(mask_all(j,:));
    stds(j) = std(mask_all(j,:));
end

savefig(strcat(dic,'circles-6-29-23.fig'))

figure(2);
boxplot(mask_all.', 1:it, 'plotstyle', 'traditional', 'outliersize', 2,...
    'Symbol', 'o', 'datalim', [0, 50],...
    'ColorGroup',lines(size(means)));

distances = zeros(it,1);
for d=1:it
    distances(d,1) = ((d-1)*10)+900;
end

figure(3);
plot(distances, means);

savefig(strcat(dic,'profile-line-6-29-23.fig'))
writematrix(mask_all, strcat(dic,'pixel_vals_6-29-23.csv'))
writematrix(means, strcat(dic,'pixel_means_6-29-23.csv'))
writematrix(distances, strcat(dic,'distances-6-29-23.csv'))

%means(means<median(means))=0;
means = means - min(means);
writematrix(means, strcat(dic,'pixel_means_norm_6-29-23.csv'))
figure(4);
plot(means);

