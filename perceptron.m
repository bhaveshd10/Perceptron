%% Perceptron without additional margin
clear all;clc;close all;
% two defined classes
class1=[1,2,1;3,3,1;4,1,1;4,2,1;4,3,1;4,4,1;5,1,1;5,2,1];
class2=[1.5,7,1;2,6,1;2,8,1;3,7,1;3,8,1;4,7,1;4,9,1;5,5,1];

% normalised class 2
norm_class2=-class2;

% counter if separation is not reached
k=0;

% initialization of vector a and eta
a=[0;0;0];eta=1;

% Combined vector Y of both classes
Y=[class1;norm_class2];

while k<500
    prev_a=a;
    for i=1:length(Y)        
        temp=Y(i,:);
        ax=a'*temp';        
        if ax<=0           
            a=a+(eta*temp');
        end
    end    
    if prev_a==a
        break;
    end
    k=k+1;
end

% Creating a line
x1=0:0.1:6;
x2=(a(1)/(-a(2)))*x1+a(3)/(-a(2));

% Plot 
figure,scatter(class1(:,1),class1(:,2))
hold on
scatter(class2(:,1),class2(:,2))
plot(x1,x2)
grid on
hold off
legend('class1','class2','separating plane','best');

%% Perceptron with additional margin

clear all;clc;close all;

% two defined classes
class1=[1,2,1;3,3,1;4,1,1;4,2,1;4,3,1;4,4,1;5,1,1;5,2,1];
class2=[1.5,7,1;2,6,1;2,8,1;3,7,1;3,8,1;4,7,1;4,9,1;5,5,1];

% normalised class 2
norm_class2=-class2;

% counter if separation is not reached
k=0;

% Setting additional Threshold/Margin
b=2.6;

% initialization of vector a and eta
a=[0;0;0];eta=1;

% Combined vector Y of both classes
Y=[class1;norm_class2];

while k<500
    prev_a=a;
    for i=1:length(Y)        
        temp=Y(i,:);
        ax=a'*temp';        
        if ax<=b
            dist_point=b-ax;
            a=a+(eta*(dist_point*temp')/(norm(temp'))^2);
        end
    end    
    if prev_a==a
        break;
    end
    k=k+1;
end
% Creating a line
x1=0:0.1:6;
x2=(a(1)/(-a(2)))*x1+a(3)/(-a(2));

% Plot
figure,scatter(class1(:,1),class1(:,2))
hold on
scatter(class2(:,1),class2(:,2))
plot(x1,x2)
grid on
hold off
title('b=2 and eta=1/k')
legend('class1','class2','separating plane');
