# 1 代码下载

（1）全家桶下载：[【问题1：亚像素边缘检测](https://mianbaoduo.com/o/bread/mbd-YpWYkpZx)，包含了实验图、实验结果表格、生成的轮廓坐标xls文件、代码、数学模型、参考文献

（2）全家桶下载:[【问题2】图像目标物理尺寸测量](https://mianbaoduo.com/o/bread/mbd-YpWYkpdq)，包括了实验图、数据、数学模型、代码、参考文献

（ 3）全家桶下载:[【问题3】根据亚像素点坐标划分圆弧、直线、椭圆](https://mianbaoduo.com/o/bread/mbd-YpWYkphw)，包括了实验代码、实验图、论文、数学模型、参考文献
# 2 题目

<center>  图像边缘分析与应用

随着科学技术的发展，对各种工件和零件的测量精度的要求越来越高，对测量仪器的要求也越来越高。各种图像测量设备如数字图像尺寸测量仪正在逐步取代传统的手工卡尺测量应用。一般情况下，摄像机经过标定后，根据标定后图像的点阵或棋盘格特征信息，对图像进行畸变校正，计算出图像坐标空间与世界坐标空间的映射关系。

目标物体的边缘在图像识别和计算机分析中是非常有用的。图像边缘是图像局部特征的不连续性的反映。边缘可以勾勒出目标物体的轮廓，使观察者一目了然。边缘包含丰富的内在信息(如方向、阶跃属性step property 、形状等)，是图像识别中提取图像特征的重要属性。图像边缘轮廓提取是图像边界分割中非常重要的一项处理，也是图像处理中的一个经典问题。轮廓提取和轮廓跟踪的目的都是为了获取图像的外部轮廓特征。在必要时应用某些方法来表达轮廓的特征，为图像形状分析做准备，对执行高级处理，如特征描述、识别和理解有重大影响。

轮廓可以描述为一组有序点，轮廓的一般表达式为多边形。轮廓可以是封闭的，也可以是开放的。图像上的封闭轮廓从头到尾都是连通的，开放轮廓通常与图像边界相交。在图1中，有五条封闭的等高线。虽然sobel和canny等边缘检测算法可以根据图像灰度值的差值来检测图像边缘像素的边界，但并没有将轮廓作为一个整体。在图像上，轮廓对应于一系列像素点。轮廓描述连续的点序列，边缘像素点可以组合成轮廓曲线来描述图像的边缘信息。

亚像素是定义在图像采集传感器的两个物理像素之间的虚拟像素。为了提高分辨率或图像质量，亚像素计算是非常有用的。亚像素边缘提取是一种比传统像素边缘提取更精确的方法。亚像素是指图像上每个像素点的坐标值不再是整数定位，而是浮点数定位。如果利用亚像素技术将精度提高到0.1像素，相当于提高10倍的图像系统分析分辨率。
![在这里插入图片描述](https://img-blog.csdnimg.cn/f24ba6bdf2ff4908a7f698759d7ce77d.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAQmV0dGVyIEJlbmNo,size_8,color_FFFFFF,t_70,g_se,x_16#pic_center)


上图中，每四个红色点围成的矩形区域为实际原件上的像素点，黑色点为亚像素点

以下三个示意图，在图1中，提取了图像的物体边缘轮廓线，并将图像边缘轮廓分割成直线段、圆弧段、圆等基本图形。在图2中，将一个圆角矩形的边缘轮廓分为几个几何形状。在图3中，在灰度像素图像网格的背景上绘制了一个椭圆的亚像素轮廓曲线。
![在这里插入图片描述](https://img-blog.csdnimg.cn/b002f2976f30481f869ec68ac378ca32.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAQmV0dGVyIEJlbmNo,size_15,color_FFFFFF,t_70,g_se,x_16#pic_center)

<center>图1. 图像边缘检测

![在这里插入图片描述](https://img-blog.csdnimg.cn/4de7f556cb264b04a6a8e5cef904973f.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAQmV0dGVyIEJlbmNo,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


<center>图2. 图像边缘轮廓

![在这里插入图片描述](https://img-blog.csdnimg.cn/1aca0b0eda9548d5afc9d0b318f4e73b.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAQmV0dGVyIEJlbmNo,size_14,color_FFFFFF,t_70,g_se,x_16#pic_center)


<center>图3. 图像的亚像素边缘轮廓


**问题1:** 建立一个数学模型,分析亚像素边缘提取的方法和过程。有1/10像素精度及以上、亚像素边缘提取轮廓边界的主要对象的边缘部分的三张图片(Pic1_1、Pic1_2 Pic1_3)在附件1中,和亚像素边缘点数据转换成命令边缘轮廓曲线数据,需要考虑如何消除边缘毛刺和阴影部分的干扰影响。需要注意的是，Pic1_3图像是在相对复杂的光照条件下拍摄的，干涉信息更多。

a) 将提取的不同颜色的边缘轮廓绘制在图像上，输出为彩色边缘轮廓图像，保存为png图像格式提交。文件名为pic1_1.png、pic1_2.png、pic1_3.png。
![在这里插入图片描述](https://img-blog.csdnimg.cn/ab3067d1b33b4049ac1e4b168269ca67.bmp?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAQmV0dGVyIEJlbmNo,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)
<center>Pic1_1.png

![在这里插入图片描述](https://img-blog.csdnimg.cn/ece08dc236be4c5b8dfef944741ba76d.bmp?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAQmV0dGVyIEJlbmNo,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)
<center>Pic1_2.png

![在这里插入图片描述](https://img-blog.csdnimg.cn/9f948772332c46bbae81c9cb5c45a2b2.bmp?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAQmV0dGVyIEJlbmNo,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)

<center>Pic1_3.png


b)将边缘轮廓数据以附件1中的EdgeContoursOutput.xls文件的格式输出，将Pic1_1和Pic1_2图像的数据分别输出到工作表对应的Sheet1和Sheet2。输出数据包含总边缘轮廓数、图像坐标空间中总边缘轮廓长度、每条轮廓曲线的点数和长度以及每条轮廓点的X、Y坐标数据。

c)文中给出每张图像的总轮廓曲线计数，以及每条曲线上的点计数和长度数据。见表1、表2、表3。

Table 1. Pic1_1 Edge Contour Data Output Format

| Total Edge Contours Count  |        |      |
| -------------------------- | ------ | ---- |
| Total Edge Contours Length |        |      |
| Edge Contour 1             | Length |      |
| PointCount                 |        |      |
| Edge Contour 2             | Length |      |
| PointCount                 |        |      |
| …                          | …      | …    |
|                            |        |      |

Table 2. Pic1_2 Edge Contour Data Output Format

| Total Edge Contours Count  |        |      |
| -------------------------- | ------ | ---- |
| Total Edge Contours Length |        |      |
| Edge Contour 1             | Length |      |
| PointCount                 |        |      |
| Edge Contour 2             | Length |      |
| PointCount                 |        |      |
| …                          | …      | …    |
|                            |        |      |

 

Table 3. Pic1_3 Edge Contour Data Output Format

| Total Edge Contours Count  |      |
| -------------------------- | ---- |
| Total Edge Contours Length |      |

 

**问题2:** 在拍摄被测图像时，有一个点矩阵校准板放置在目标物体的同一水平高度上。定标板上的网点直径为1mm，两点之间的中心距离为2mm。附件2包含三张不同角度拍摄的标定板图像和一张产品图像(pic2_1 .bmp)。请建立数学模型，利用标定板图像信息对产品图像进行图像校正分析，考虑如何尽可能准确地计算出产品图像上边缘分割拟合曲线段的实际物理尺寸。请计算每个边缘轮廓的长度(mm)，最后计算出总边缘轮廓长度(mm)。根据图4所示的轮廓数据标注，输出附件2中EdgeContoursLengthOutput.xls等表格格式文件的数据结果。
![在这里插入图片描述](https://img-blog.csdnimg.cn/4c3271fa5f334e8f9cf6a1fd7ec7c5a2.bmp?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAQmV0dGVyIEJlbmNo,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)

<center> pic2_1 .bmp

![在这里插入图片描述](https://img-blog.csdnimg.cn/8e3566cbc38745e5959a5fa9848b37b4.bmp?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAQmV0dGVyIEJlbmNo,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


<center>定位校验板 1

![在这里插入图片描述](https://img-blog.csdnimg.cn/176a20686fd1414dac2197135f3e9a9c.bmp?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAQmV0dGVyIEJlbmNo,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)

<center>定位校验板 2

![在这里插入图片描述](https://img-blog.csdnimg.cn/75624ee076734e91a174b459993589f1.bmp?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAQmV0dGVyIEJlbmNo,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)

<center>定位校验板 3
 

Table 4. Edge Contour Length Output Format (mm)

| Contour ID          | Length(mm) |
| ------------------- | ---------- |
| Total Edge Contours |            |
| Edge Contour 1      |            |
| Edge Contour 2      |            |
| Edge Contour 3      |            |
| Edge Contour 4      |            |
| Edge Contour 5      |            |
| Edge Contour 6      |            |

 

 

![在这里插入图片描述](https://img-blog.csdnimg.cn/42bb86a192084894a66766a4d7bc5b97.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAQmV0dGVyIEJlbmNo,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)
<center>待检测图轮廓标签

**问题3:** 附件3提供了两个亚像素轮廓边缘数据(EdgeContour1.xls和EdgeContour2.xls)，其形状如图5所示。建立数学模型，分析边缘轮廓曲线数据自动分割拟合为直线段、圆弧段(含圆)、椭圆圆弧段(含椭圆)，讨论边缘轮廓自动分割拟合的模型方法或策略。蓝色曲线从蓝色数字1标签开始，沿着箭头方向输出模型计算结果数据。绿色曲线从绿色数字1标签开始，沿箭头方向输出模型计算结果数据。请将分段曲线分段的参数按表格格式填写到表格中。提交表7和表8(轮廓1和轮廓2分割数据)。请注意，该表中的行类型是根据实际类型填充的。

![在这里插入图片描述](https://img-blog.csdnimg.cn/d45135d60ff044d4baeed7899cc4f54b.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAQmV0dGVyIEJlbmNo,size_18,color_FFFFFF,t_70,g_se,x_16#pic_center)

Figure 5. 边缘轮廓示例图

 

Table 5. Segmentation Data Geometric Shapes [Parameter] 

| TYPE        | PARAM   |         |                |            |            |               |
| ----------- | ------- | ------- | -------------- | ---------- | ---------- | ------------- |
| Line        | StartPt | EndPt   | Length (pixel) |            |            |               |
| Circle      | Center  | Radius  | Length (pixel) |            |            |               |
| CircularArc | Center  | StartPt | EndPt          | SweepAngle |            |               |
| Ellipse     | Center  | Size    | RotationAngle  |            |            |               |
| EllipticArc | Center  | Size    | StartPt        | EndPt      | SweepAngle | RotationAngle |

 

Table 6.Demo Coutour Segmentation Data 

| Edge Contour Demo |             |          |          |          |         |       |      |
| ----------------- | ----------- | -------- | -------- | -------- | ------- | ----- | ---- |
| NO                | TYPE        | PARAM    |          |          |         |       |      |
| S1                | Line        | (20,100) | (80,100) | 60 pixel |         |       |      |
| S2                | CircularArc | (80,90)  | (80,100) | (90,90)  | -90°    |       |      |
| S3                | Line        | (90,90)  | (90,60)  | 30 pixel |         |       |      |
| S4                | EllipticArc | (90,40)  | [20,10]  | (90,60)  | (90,20) | +180° | -90° |

 

Table 7. Contour 1 Segmentation Data Output Format

| Edge Contour 1 |      |       |      |      |      |      |      |
| -------------- | ---- | ----- | ---- | ---- | ---- | ---- | ---- |
| NO             | TYPE | PARAM |      |      |      |      |      |
| S1             |      |       |      |      |      |      |      |
| S2             |      |       |      |      |      |      |      |
| S3             |      |       |      |      |      |      |      |
| S4             |      |       |      |      |      |      |      |
| S5             |      |       |      |      |      |      |      |
| ...            |      |       |      |      |      |      |      |

Table 8. Contour 2 Segmentation Data Output Format

| Edge Contour 2 |      |       |      |      |      |      |      |
| -------------- | ---- | ----- | ---- | ---- | ---- | ---- | ---- |
| NO             | TYPE | PARAM |      |      |      |      |      |
| S1             |      |       |      |      |      |      |      |
| S2             |      |       |      |      |      |      |      |
| S3             |      |       |      |      |      |      |      |
| S4             |      |       |      |      |      |      |      |
| S5             |      |       |      |      |      |      |      |
| ...            |      |       |      |      |      |      |      |

 

备注:

 

1. SweepAngle表示从起始点到结束点的扫角，角系;

2. 尺寸Size：表示指定椭圆或椭圆弧在X、Y方向上的半径值;

 3. RotationAngle：表示指定椭圆或椭圆弧转角系统的转角值;

4. 对于旋转角度的方向，从x轴正方向到y轴正方向的旋转方向为正，反之为负。

5. 所有图像坐标点均在图像坐标系下表示，即左上角为(0,0)原点，x轴正方向向右，y轴正方向向下。



# 3 思路

基本思维方案框架如下图所示

![在这里插入图片描述](https://img-blog.csdnimg.cn/80726ce346c14c4a94d9a6be95e2349e.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAQmV0dGVyIEJlbmNo,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)



## 3.1 问题1 亚像素边缘检测

边缘是图像最基本的特征，边缘检测在计算机视觉、图像分析等应用中起着重要作用，是图像分析与识别的重要环节。这是因为图像的边缘包含了用于识别的有用息，它为人们描述或识别目标和解释图像提供了一个有价值的和重要的特征参数，所以边缘检测是图像分析和模式识别的主要特征提取手段。所谓边缘是指其周围像素灰度后阶变化或屋顶状变化的那些像素的集合，它存在于目标与背景、目标与目标、域与区域，基元与基元之间。因此它是图像分割所依赖的重要的特征，也是纹理特正的重要信息源和形状特征的基础。边缘检测广泛应用于轮廓、特征的抽取和纹理分析中，理想的边缘检测应当正确解决边缘的有无、真假和定位问题。但真正实现这一标尚有较大的难度，这是因为实际图像都含有噪声，并且噪声的分布、方差等信息都是未知的，同时噪声和边缘都是高频信号，虽然平滑滤波运算可消除噪声，但它学致一些边缘模糊，检测出的边缘往往移位。另外由于物理和光照等原因，实际图像的边缘常常发生在不同的尺度范围上，并且每一边缘像元的尺度信息是未知的，利用单一固定尺度的边缘检测算子不可能同时最佳的检测出这些边缘。

（1）技术分类

在精度上分为像素级和亚像素级边缘检测技术，边缘检测技术主要解决三个问题：找出强度的非连续性，又要抑制细节和噪声，同时还要保存边缘定位精度。
+  像素级
	+  基于局部图像函数的方法
  	+ 基于图像滤波的方法
	+  基于全局的边缘检测方法

- 亚像素级
亚像素边缘检测技术是一种新的高精度的图像边缘处理与检测技术，本质是通过软件算法来人为提高检测系统的分辨率。

	+ 基于矩的亚像素边缘检测：利用矩的积分算子来定位亚像素边缘，之所以选择矩，是因为这种算法对噪声不敏感。
	+ 基于拟合（重建）的亚像素边缘检测：通过拟合灰度值来获得高精度边缘位置
	+ 基于插值的亚像素边缘检测：是对图像中的灰度值或者灰度梯度进行估计和插值来获得亚像素级边缘。


（2）基于Zernike矩的边缘检测方法实现

```matlab

```
![在这里插入图片描述](https://img-blog.csdnimg.cn/90102a0d29fd46e78db767ac1353fd7d.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAQmV0dGVyIEJlbmNo,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


（3）基于灰度矩的边缘检测方法
```matlab

```
![在这里插入图片描述](https://img-blog.csdnimg.cn/d0febe6cab964084abd7f4ed0b5ffb20.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAQmV0dGVyIEJlbmNo,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)

（3）基于高斯拟合
```matlab

```
![在这里插入图片描述](https://img-blog.csdnimg.cn/858bd45313944d1c95610543e8d02963.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAQmV0dGVyIEJlbmNo,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)

完整源码下载[亚像素边缘检测MATLAB多方案实现](https://mianbaoduo.com/o/bread/YpWXlJxu)
边缘检测MATLAB能够简单实现，但是想要提取轮廓，并给不同的段绘制颜色，还需要Halcon。实现效果如下
halcon实现完整代码和原图PNG格式图片都在同一个链接中

![在这里插入图片描述](https://img-blog.csdnimg.cn/f06e693c316d431c9d81217d3f3c5983.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAQmV0dGVyIEJlbmNo,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)
![在这里插入图片描述](https://img-blog.csdnimg.cn/08cbf3b301df43ddaa4d8ceded589760.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAQmV0dGVyIEJlbmNo,size_17,color_FFFFFF,t_70,g_se,x_16#pic_center)

![在这里插入图片描述](https://img-blog.csdnimg.cn/bb46cfcc562844719eb4902d4f8e12bf.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAQmV0dGVyIEJlbmNo,size_17,color_FFFFFF,t_70,g_se,x_16#pic_center)


## 3.2 问题2 图像目标尺寸测量

是二维图像目标尺寸测量问题。思路是先在第一问的边缘检测的基础上

Halcon实现步骤如下

第一步：图像矫正

第二步：图像亚像素边缘提取

第三步：对提取的边缘进行拟合

分别针对直线、圆形、椭圆进行拟合。

（1） 直线拟合

（2） 圆形拟合

（3） 椭圆拟合

第四步：根据标定板和坐标系来计算圆形和直线像素点长度，并确定周长

代码下载看以上下载链接
实验部分内容截图
![在这里插入图片描述](https://img-blog.csdnimg.cn/c1b18776562f4a4dbeb0efcafe7cdde2.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAQmV0dGVyIEJlbmNo,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)


数据和图及代码实现见文章首部

## 3.3 问题3  亚像素直线段、圆弧段、椭圆段分割
 Halcon软件实现
![在这里插入图片描述](https://img-blog.csdnimg.cn/88203cf1f42444ba83e8becbf736cd99.png#pic_center)

halcon 软件实现流程图
将题目给定的2个excel文件读入Halcon，并对这些离散的亚像素坐标进行拟合。得到轮廓数据Edges。
采用halcon中的算子来进行轮廓的分割
采用segment_contours_xld函数将轮廓数据分割为直线、圆弧、椭圆弧
segment_contours_xld (SelectedContours, ContoursSplit, 'lines_circles', 5, 4, 3)
例如以上代码就实现了以线和圆作为分类切割
使用fit_line_circle_contour_xld函数来实现圆弧的拟合
使用gen_circle_contour_xld 来创建对应于圆或圆弧的XLD轮廓
*使用fit_line_contour_xld函数来实现直线的拟合

*使用fit_line_elipse_contour_xld函数来实现椭圆的拟合
具体实现参见代码
实现效果如下
![在这里插入图片描述](https://img-blog.csdnimg.cn/adc072167ced4db3a71ba1a0766f9158.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAQmV0dGVyIEJlbmNo,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)
完整代码、结果图和结果下载见文章首部





