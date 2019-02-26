function [ theta ] = Orientation(SobelX, SobelY)

numerator = 0;
denominator = 0;
pi=3.1415926;

for i=1:9
    for j=1:9
        numerator = numerator + ( 2*SobelX(i,j)*SobelY(i,j));
        denominator = denominator + ((SobelX(i,j))^2-(SobelY(i,j))^2);
    end
end
theta =(1/2)*atan2(numerator,denominator)+pi/2; %function
end
