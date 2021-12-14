clear 
clc;
X=load('Indian_pines_corrected.mat');%加载数据集
% Y=load('PaviaU_gt.mat');
% lab=cell2mat(struct2cell(Y));
N=16;%数据集类别数
K=35;%最大聚类数
iter_K=200;
maxiter=300;
pop_size=5;
% lab=cell2mat(struct2cell(Y));
data = cell2mat(struct2cell(X));
data_min=min(min(min(data)));
data_max=max(max(max(data)));
bound_date=(data-data_min)./(data_max-data_min).*255;
bound_date_huidu=uint8(bound_date)+1;
[long,high,him] = size(bound_date_huidu);
% bound_date_huidu=double(bound_date_huidu);
SS=SSIM(data);
 cos=SMA(data);
huxinxi_ALL=huxinxi_ALL(bound_date_huidu,him);
% bound_xgd_ALL = xiangguanxing_ALL(him,data);
rank=paixu(SS,huxinxi_ALL,cos,him);
% for l=2:K
%     NC=[];
%     Ncenter=[];
%     [NC,Ncenter,xxs]=julei(bound_date_huidu,rank,l,iter_K);
%     AC{l}=NC;
%     NCen{l}=Ncenter;
% end
LX=sandu(bound_date,him);
% hd=hist(bound_date_huidu,num_100);

[NC,Ncenter,xxs]=julei(data,rank,K,iter_K);%初始聚类

[AC,NCen]=Qcluster(NC,Ncenter,K,rank,xxs);%最差类消除
[pbest,pop_all]=chushihua(pop_size,K,AC,data,LX);
[npop,nbest]=cunei(NCen,pop_all,pbest,K,pop_size,AC,data,long,high,LX);
cujian_pbest=cujian(NCen,pbest,AC,K,data,long,high,LX);
nowiter=1;
while  nowiter<maxiter
        [npop,nbest]=cunei(NCen,npop,cujian_pbest,K,pop_size,AC,data,long,high,LX);
         cujian_pbest=cujian(NCen,pbest,AC,K,data,long,high,LX);

    
    nowiter=nowiter+1
end



