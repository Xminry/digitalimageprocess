
function [C] = binary1(A,B)
C=zeros(1,B);
temp = A;
for i=1:B
    temp = temp*2;
    if temp >= 1
        temp = temp - 1;
        C(1,i) = 1;
    else
        C(1,i) = 0;
    end
end
end
