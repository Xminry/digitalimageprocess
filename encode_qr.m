function qr = encode_qr(message, width,height)
% ���ܣ�����Ϣ��������QR��ά��ͼ�񣬿���ָ��ͼ���С
%����˵��:
% ? ���룺
% ? ? ? message���ַ�����Ϣ
% ? ? ? width ��ָ�����ɵ�ͼ��Ŀ��
% ? ? ? height��ָ�����ɵ�ͼ��ĸ߶�
% ? �����
% ? ? ? qr���õ�QR��ά��ͼ��

writer = com.google.zxing.MultiFormatWriter();%����MultiFormatWriter��Ķ���
M_java = writer.encode(message, com.google.zxing.BarcodeFormat.QR_CODE, ...
width, height);%����MultiFormatWriter��ĳ�Ա����
%��������ת�� ? ? ? ? ? ? ? ? ? ? ? ? ? ? ??
qr = char(M_java);
clear bitmtx writer
qr(qr==10) = [];
qr = reshape(qr(1:2:end), width, height)';
qr(qr~='X') = 1;
qr(qr=='X') = 0;

qr = double(qr);

end
