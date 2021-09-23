noise = 500;

load handel
yn = awgn(y, noise);
c = xcorr(y,yn);
xd = conv(y, yn);
d = corrcoef(y, yn);

figure('Name', 'C', 'NumberTitle', 'off')
plot(c)
figure('Name', 'XD', 'NumberTitle', 'off')
plot(xd)
figure('Name', 'Y', 'NumberTitle', 'off')
plot(y)
figure('Name', 'YN', 'NumberTitle', 'off')
plot(yn)

sound(c)