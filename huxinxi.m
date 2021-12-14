function mi=huxinxi(a,b)
%Caculate MI of a and b in the region of the overlap part
%计算重叠部分
[M,N]=size(a);
%初始化直方图数组
hab = zeros(256,256);
%归一化
%统计直方图
for i=1:M
for j=1:N
indexx = a(i,j);
indexy = b(i,j) ;
hab(indexx,indexy) = hab(indexx,indexy)+1;%联合直方图
end
end
%计算联合信息熵
hsum = sum(sum(hab));
index = find(hab~=0);
p = hab/hsum;
Hab = sum(-p(index).*log(p(index)));
%计算a图信息熵
Ha = entropy(a);
%计算b图信息熵
Hb = entropy(b);
%计算a和b的互信息（越大匹配结果越好）
mi = Ha+Hb-Hab;
end