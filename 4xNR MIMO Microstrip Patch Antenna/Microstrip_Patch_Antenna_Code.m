%% Part B - Task 1: Microstrip Patch Design
ant = patchMicrostrip;
ant.Length = 75e-3;            %
ant.Width = 37.5e-3;             %
ant.GroundPlaneLength = 120e-3;  %
ant.GroundPlaneWidth = 120e-3;   %
ant.FeedOffset = [-18.75e-3, 0]; %

% 1. Show Antenna Layout
figure(1); show(ant); title('Task 1: Microstrip Patch Layout');

% 2. Find Operating Frequency via Impedance
figure(2); freqRange = linspace(0.5e9, 2e9, 50);
impedance(ant, freqRange); title('Impedance Plot to find Operating Frequency');

%% Part B - Task 2: 4xNR MIMO Antenna Array
% Determine frequency from impedance (approx 1.85GHz for these dimensions)
f_op = 1.85e9; 
lambda = 3e8/f_op; %

LA = linearArray;
LA.Element = ant;
LA.NumElements = 4;        %
LA.ElementSpacing = lambda/2; % Necessary spacing to overcome coupling

% 1. Show Array Layout
figure(3); show(LA); title('Task 2: 4-Element Linear Array Layout');

% 2. Show 3D Radiation Pattern
figure(4); pattern(LA, f_op); title('Far-field Radiation Pattern');

% 3. Show Current Distribution
figure(5); current(LA, f_op); title('Current Distribution');
