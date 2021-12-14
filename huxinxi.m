function mi=huxinxi(a,b)
%Caculate MI of a and b in the region of the overlap part
%�����ص�����
[M,N]=size(a);
%��ʼ��ֱ��ͼ����
hab = zeros(256,256);
%��һ��
%ͳ��ֱ��ͼ
for i=1:M
for j=1:N
indexx = a(i,j);
indexy = b(i,j) ;
hab(indexx,indexy) = hab(indexx,indexy)+1;%����ֱ��ͼ
end
end
%����������Ϣ��
hsum = sum(sum(hab));
index = find(hab~=0);
p = hab/hsum;
Hab = sum(-p(index).*log(p(index)));
%����aͼ��Ϣ��
Ha = entropy(a);
%����bͼ��Ϣ��
Hb = entropy(b);
%����a��b�Ļ���Ϣ��Խ��ƥ����Խ�ã�
mi = Ha+Hb-Hab;
end