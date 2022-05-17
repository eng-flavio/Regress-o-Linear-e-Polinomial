clc
Aero = fscanfMat('aerogerador.dat');
x=Aero(:,1); //valores de entrada
y=Aero(:,2); //valores de saída


plot(x,y,'b*')
title('Aerogerador');   //plota as funções High, Low e Medium
xlabel('Velocidade do Vento(m/s)');
ylabel('Potência Gerada(kW)');

//Divisão das regiões
x1 = x(1:50)
x2 = x(51:2000)
x3 = x(2001:2250)

y1 = y(1:50)
y2 = y(51:2000)
y3 = y(2001:2250)

//Cálculos
X1=[ones(length(x1),1)  x1]; //matriz de variáveis x (grau 1)
beta=inv(X1'*X1)*X1'*y1; //matriz de coeficientes
Y1=X1*beta;   //saída aproximada

X2=[ones(length(x2),1)  x2]; //matriz de variáveis x (grau 1)
beta=inv(X2'*X2)*X2'*y2; //matriz de coeficientes
Y2=X2*beta;   //saída aproximada


X3=[ones(length(x3),1)  x3]; //matriz de variáveis x (grau 1)
beta=inv(X3'*X3)*X3'*y3; //matriz de coeficientes
Y3=X3*beta;   //saída aproximada

//plots
Y(1:50) = Y1
Y(51:2000) = Y2
Y(2001:2250) = Y3

plot(x, Y,'r')

xgrid()
E=y-Y; //matriz dos erros
R2=1-sum((y-Y).^2)/sum((y-mean(y)).^2) //média R2
