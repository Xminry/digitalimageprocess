function qr = encode_qr(message, width,height)
% 功能：把信息编码生成QR二维码图像，可以指定图像大小
%变量说明:
% ? 输入：
% ? ? ? message：字符串信息
% ? ? ? width ：指定生成的图像的宽度
% ? ? ? height：指定生成的图像的高度
% ? 输出：
% ? ? ? qr：得到QR二维码图像

writer = com.google.zxing.MultiFormatWriter();%创建MultiFormatWriter类的对象
M_java = writer.encode(message, com.google.zxing.BarcodeFormat.QR_CODE, ...
width, height);%调用MultiFormatWriter类的成员函数
%数据类型转化 ? ? ? ? ? ? ? ? ? ? ? ? ? ? ??
qr = char(M_java);
clear bitmtx writer
qr(qr==10) = [];
qr = reshape(qr(1:2:end), width, height)';
qr(qr~='X') = 1;
qr(qr=='X') = 0;

qr = double(qr);

end
