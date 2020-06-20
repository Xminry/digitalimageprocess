x=-5:0.01:5;
y=(-1).*(x>=-5&x<=-1)+(0).*(x<1&x>-1)+(1).*(x<5&x>1);
plot(x,y);
grid on
set(gca,'XLim',[-5 5]);
set(gca,'YLim',[-4 4]);