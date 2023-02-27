clear all; close all; clc

%  ONLY FOR IDEAL SOLUTION!

% Refer for technical details to : 
% https://chem.libretexts.org/Bookshelves/Physical_and_Theoretical_Chemistry_Textbook_Maps/DeVoes_Thermodynamics_and_Chemistry/13%3A_The_Phase_Rule_and_Phase_Diagrams/13.02%3A__Phase_Diagrams-_Binary_Systems

% This code can be modified for any ideal solution to obtain the T-xy 
% diagram. The default ideal solution is:
% Toluene-Benzene for the temperature range of 353.2 to 383.655 K at 1.01 bar

%%% AE = Antoine Equation (first step) %%%

% Edit Antoinecomp.mat to add the Antoine parameters for desired
% mixture. Alternatively, modify the excel sheet, import, and save mat file.

load Antoinecomp.mat

% Benzene - Temperature range: 333.4 - 373.5K. These parameters were obtained
% from: https://webbook.nist.gov/cgi/cbook.cgi?ID=C71432&Units=SI&Mask=4#Thermo-Phase

a_1 = Antoinecomp(1,1);
b_1 = Antoinecomp(1,2);
c_1 = Antoinecomp(1,3);

% Toluene - Temperature range: 308.52 - 384.66K. These parameters were obtained
% from: https://webbook.nist.gov/cgi/cbook.cgi?ID=C108883&Units=SI&Mask=4#Thermo-Phase

a_2 = Antoinecomp(2,1);
b_2 = Antoinecomp(2,2);
c_2 = Antoinecomp(2,3);

% Temperature range in Kelvin for calculation. Edit this line to
% solve for desired temperature range and data points.
T_K = linspace(353.2,383.655,20);

% Vapor pressure in bar
AE_1 = Antoine(a_1,b_1,c_1,T_K); % p1_pure
AE_2 = Antoine(a_2,b_2,c_2,T_K); % p2_pure

%%% RL = Raoult's law (second step) %%%

P = 1.01; % total pressure in bar

% Calculating liquid and gas composition
x1 = liquid(P, AE_2, AE_1);
y1 = vapor(x1, P, AE_1);


% Visualizing data

Temperature = T_K';
p1_pure = AE_1';
p2_pure = AE_2';
Liquid_comp = x1';
Gas_comp = y1';

data = flipud(table(Temperature, p1_pure, p2_pure, Liquid_comp, Gas_comp))
% data.Properties.VariableUnits = {'K','bar','bar','1','1'}; %
% summary(data)

%%% Plot %%%
% x is mole fraction in liquid and y is mole fraction in gas of component 1
plot (x1,T_K,'b', 'LineWidth',2.0)
hold on
plot(y1,T_K,'r','LineWidth',2.0)
legend('liqud','vapor','Location','northwest')
xlabel('x1, y1 (toluene) (mol fract.)')
ylabel('Temperature (K)')
%grid on
box off