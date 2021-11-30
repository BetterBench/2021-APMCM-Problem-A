clear;
clc;
tic;%启动计时器，计算程序运行时间
tau=25;
delt=0.5;
N=7;
picture_init=imread('Pic1_2.bmp');
picture_double=double(picture_init);
[height,wideth]=size(picture_double);

index=1;
fid=fopen('SubpixelEdgeData.txt', 'w');
yaxiangsu_e=zeros(height,wideth);%定义矩阵，并初始化为0，用于边缘的图像的显示
for j=4:1:height-3
    for i=4:1:wideth-3
         m1=juanji2(picture_double,1,j,i);%计算一阶灰度距
         m2=juanji2(picture_double,2,j,i);%计算二阶灰度距
         sigma=sqrt(m2-m1^2);
         if sigma>tau
             m3=juanji2(picture_double,3,j,i);%计算三阶灰度距
             s=(m3+2*m1^3-m1*m2*3)/(sigma^3);
             p1=(1+s*sqrt(1.0/(4+s^2)))/2;%归一化参数
             p2=1-p1;
             h1=m1-sigma*sqrt(p2/p1);
             h2=m1+sigma*sqrt(p1/p2);
             if abs(h1-h2)>sigma*2
                 A=min(p1,p2);
                 x=fzero(@(x)x-0.5*sin(2*x)-A*pi,1.42);%求解超越方程，得到x的值
                 rou =cos(x);
                 if rou <=delt*2/N
                     [x0,y0]=zhongxin(picture_double,j,i);%计算模板圆的灰度重心坐标
                     sin_o=y0/sqrt(x0^2+y0^2);
                     cos_o=x0/sqrt(x0^2+y0^2);
                     Xs(index)=i+rou*cos_o*N/2;%计算亚像素横坐标x坐标值,保存在数组Xs中，方便查看
                     Ys(index)=j+rou*sin_o*N/2;%计算亚像素纵坐标y坐标值
                     fprintf(fid, '%f\t%f\r\n', Xs(index), Ys(index));%将得到亚像素边缘数据保存到txt文件中方便查看
                     Xs_int=round(Xs(index));%取整用于显示结果
                     Ys_int=round(Ys(index));
                     yaxiangsu_e(Ys_int,Xs_int)=1;
                     index=index+1;
                 end
             end
         end      
    end
end
subplot(221);
imshow(yaxiangsu_e),title('灰度矩亚像素边缘检测结果'); 

subplot(222);
I41=imfill(yaxiangsu_e,'holes');
imshow(I41)
title('孔洞填充图像');
% 提取最外围边缘
subplot(223);
I4=bwperim(I41);                   
imshow(I4); title('边缘图像');
% 去除面积小于150px物体
subplot(224); 
I5=bwareaopen(I4,100);    
imshow(I5);


