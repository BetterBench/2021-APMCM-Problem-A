function [x,y]=zhongxin(picture,j,i)
%-------用于计算灰度圆的灰度重心坐标-------%
huidu_sum=0;
huidu_x=0;
huidu_y=0;
for m=j-3:1:j+3
    for n=i-3:1:i+3
        huidu_sum=huidu_sum+picture(m,n);
        huidu_x=huidu_x+picture(m,n)*n;
        huidu_y=huidu_y+picture(m,n)*m;
    end
end
huidu_sum=huidu_sum-picture(j-3,i-3)-picture(j-3,i+3)-picture(j+3,i-3)-picture(j+3,i+3);
huidu_x=huidu_x-picture(j-3,i-3)*(i-3)-picture(j-3,i+3)*(i+3)-picture(j+3,i-3)*(i-3)-picture(j+3,i+3)*(i+3);
huidu_y=huidu_y-picture(j-3,i-3)*(j-3)-picture(j-3,i+3)*(j-3)-picture(j+3,i-3)*(j+3)-picture(j+3,i+3)*(j+3);
x=huidu_x/(huidu_sum+eps);
y=huidu_y/(huidu_sum+eps);