Image=double(imread('pumpkins-input.png'));
Image = Image./255.0;
%image(Image)
%InitialDepth=max(Image,[],3);
%imshow(InitialDepth,[])
IntensitySum=sum(Image,3);
ChromR=Image(:,:,1)./IntensitySum;
ChromB=Image(:,:,2)./IntensitySum;
ChromG=Image(:,:,3)./IntensitySum;
Chrom=cat(3,ChromR,ChromB,ChromG);
[RGx,RGy]=imgradientxy(ChromR);
[BGx,BGy]=imgradientxy(ChromB);
[GGx,GGy]=imgradientxy(ChromG);
% [Gx,Gy]=imgradientxy(Chrom);
% RDta=vertcat(RGx,RGy);
% BDta=vertcat(BGx,BGy);
% GDta=vertcat(GGx,GGy);
% RDta=RDta/8.0;
% BDta=BDta/8.0;
% GDta=GDta/8.0;
% RDta(RDta>0.25)=[];
% RDta(RDta<-0.25)=[];
% BDta(BDta>0.25)=[];
% BDta(BDta<-0.25)=[];
% GDta(GDta>0.25)=[];
% GDta(GDta<-0.25)=[];
% [RCount,RValue]=histcounts(RDta,128);
% [BCount,BValue]=histcounts(BDta,128);
% [GCount,GValue]=histcounts(GDta,128);
% RCount=RCount./sum(RCount);
% BCount=BCount./sum(BCount);
% GCount=GCount./sum(GCount);
% RW=abs(RValue(2) - RValue(1))/2.0;
% BW=abs(BValue(2) - BValue(1))/2.0;
% GW=abs(GValue(2) - GValue(1))/2.0;
% RVal=RValue(1:128)+RW;
% BVal=BValue(1:128)+BW;
% GVal=GValue(1:128)+GW;
% 
% fun = @(x,xdata)exp((-(xdata.^x(1)))/x(2));
% 
% options = optimoptions('lsqcurvefit','Algorithm','levenberg-marquardt');
% lb = [];
% ub = [];
% x=lsqcurvefit(fun,[0.25,0.25],RVal,RCount,lb,ub,options);
