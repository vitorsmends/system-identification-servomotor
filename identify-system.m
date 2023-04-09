clear all;
clc;
close all;


raw_data = csvread("dados-identificao.csv");
time = raw_data(:,1);
velocity = raw_data(:,3);
pwm = raw_data(:,4);
position = raw_data(:,5);

% define the time sample
Ts = 0.001;

% transform data to a the standard format of system identification toolbox
data=iddata(velocity, pwm,Ts);

% conjunto de dados de estimação
datae=data(1:200);

% validation data-set
datav=data(201:end);

% ARX model

% identify parameters for arx model
M1 = arx(datae, [1 1 1])
% print the model founded as TF
tf(M1);

% compare with the validation data
compare(M1, datav);


