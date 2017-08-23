MyMatrix = rand(5)
dlmwrite('MyMatrix.txt', MyMatrix) 
type('MyMatrix.txt')
MyMatrix = rand(5)
xlswrite('MyMatrix.xls', MyMatrix)
MyMatrix = rand(5)
csvwrite('MyMatrix.csv', MyMatrix) 
Coliseum = imread('coliseum.jpg');
imwrite(Coliseum,'coliseum2.jpg');
[apollo13,Fs] = audioread('apollo13.wav');
sound(apollo13,Fs)
Apollo13Obj = audioplayer(apollo13,Fs);
play(Apollo13Obj);
audiowrite('apollo13.wav',apollo13,Fs)
InfoAudio = audioinfo('apollo13.wav')