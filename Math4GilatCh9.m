%%Chapter 9 Problems
%
%  <20140417>
%   <Brett Davis>
%    <Gilat, 4th ed. Problems 2 6 8 10 12>

%% Problem 1
clear all
close all
%The position of a moving particle is given by an equation, plot3 it.

%problem 1 switch
if 1;

%vars

t = 1:.01:50;

x = (1+.01.*t).*cos(t);

y = (1 +.01.*t).*sin(t);

z = .02.*sqrt(t);

plot3(x,y,z)
title('Chapter 9, Problem 1','FontSize',16)
grid on
view(-70,10)

%switchlet
end


%% Problem 2
clear all
close all
%An eliptical staircase can be moddeled by some equations, plot it.

%Problem 2 switch

if 1;

%given vars

a = 10;

b = 5;

h = 6;

n = 4;

t = 1:0.1:50;

e = sqrt(1-(b^2/a^2));

r = b./sqrt(1-(e^2.*(cos(t).^2)));

%eqs

x = r.*cos(t);

y = r.*sin(t);

z = (h.*t)/(2*pi*n);

%plot

plot3(x,y,z)
title('Chapter 9, Problem 2','FontSize',16)

%switchlet
end

%% Problem 6
clear all
close all 
%Make a 3d surface plot of a given function.

%switch
if 1;


x = 0:60;

y = 0:60;

[X,Y] = meshgrid(x,y);

z = sin(2*pi.*X./60).*sin(3*pi.*Y./60);

surf(x,y,z)
xlabel('x')
ylabel('y')
zlabel('z')
title('Chapter 9, Problem 6','FontSize',16)
view(-64,44)

%switchlet
end

%% Problem 8
clear all
close all
% Molecules of gas in a container are moving around at different speeds.
%maxwells speed distribution law gives the probability distribution P(v) as
% a function of temperature and speed. Make a 3d plot of the given function
% for the given rates of v & t.


%Problem 8 switch
if 1;

M = 0.032;

R = 8.31;

v = 0:1000;

t = 70:320;

[V,T] = meshgrid(v,t);

P = 4*pi.*(M./(2.*pi.*R.*T).^(3/2)).*((V.^2).*exp((-M.*V.^2)./(2*R.*T)));

%plot

plot3(V,T,P);
title('Chapter 9, Problem 8','FontSize',16)
grid on

%switchlet
end

%% Problem 10
clear all
close all
%Aj RLC circut with an alternating voltage source is shown. The Source voltage
% v_s is given by v_s = v_m(sin(w_d*t) whereby: w_d = 2pi*f_d in which f_d is the
%driving frequency. The amplitude of the current, I in this circut is given by an
%equation.

%problem 10 switch

if 1;


%given vars

C   = 15 * 10^-6;

L   = 240 * 10^-3;

v_m = 24;

%A) make a 3d plot of I (z axis) as a function of w_d (x axis) for 60<=f<=110
% and a function of R (y axis) for 10<=R<=40

f = 60:110;

R = linspace(10,40,51);

w_d = 2.*pi.*f;

I = v_m./(sqrt((R.^2)+(((w_d.*L)-1)./(w_d.*C)).^2))


%plot

plot3(f,R,I)
grid on
xlabel('Frequency')
ylabel('Resistance')
zlabel('Amplitude of the Current')
view(8,8)
title('Chapter 9 Problem 10-A','FontSize',16)

%B) Make a plot that is a projection on the x-z plane. Estimate from this plot the
% natural frequency of the circut (The frequency at which I is maximum), compare
% the estimate with the calculated value of 1/2pi*sqrt(LC)

format long

%note...these values dont seem to match up very well

I_max = max(I);

calc_val = 1/(2*pi*sqrt(L*C));


%switchlet
end

%% Problem 12
clear all
close all
% A defect in a crystal lattice where a row of atoms is missing is called
% an edge dislocation. The stress field around an edge dislocation is 
% given by some formulas for x y and z. Plot the coordinates x and y in the 
% horizontal plane, and the stresses in the vertical direction.

%given vars

G = 27.7 * 10^9; %shear modulus in Pa

b = 0.286 * 10^-9; % burgers vector in m

v = 0.334; % Poisson's ratio.

x = linspace((-5*10^-9),(5*10^-9),300); 

y = linspace((-5 * 10^-9),(-1*10^-9),300);

%main

[X Y] = meshgrid(x,y);

sigma_xx = (-G*b)/(2*pi*(1-v)) .* ((Y.*((3.*X.^2)+Y.^2))./(((X.^2)+(Y.^2)).^2));

sigma_yy = (G*b)/(2*pi*(1-v)) .* ((Y.*((X.^2)-(Y.^2)))./(((X.^2)+(Y.^2)).^2));

tau_xy   = (G*b)/(2*pi*(1-v)) .* ((X.*((X.^2)-(Y.^2)))./(((X.^2)+(Y.^2)).^2));

%plot

%subplot(2,2,1)
figure
mesh(X,Y,sigma_xx)
title('Chapter 9 Problem 12-A','FontSize',16)
zlabel('\bf\sigma_x_x','FontSize',13)
xlabel('x (m)')
ylabel('y (m)')
%subplot(2,2,2)
figure
mesh(X,Y,sigma_yy)
title('Chapter 9 Problem 12-B','FontSize',16)
zlabel('\bf\sigma_y_y','FontSize',13)
xlabel('x (m)')
ylabel('y (m)')
%subplot(2,2,3)
figure
mesh(X,Y,tau_xy)
view(-10,26)
title('Chapter 9 Problem 12-C','FontSize',16)
zlabel('\bf\tau_x_y','FontSize',13)
xlabel('x (m)')
ylabel('y (m)')
