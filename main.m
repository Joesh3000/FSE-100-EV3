% clearvars -global
% if there is a bug
% javaclasspath('/Applications/MATLAB_R2023b.app/toolbox/ev3')
% javaclasspath('C:\Program Files\MATLAB\R2023b\toolbox\EV3')
% brick = Brick('ioType','wifi','wfAddr','127.0.0.1','wfPort',5555,'wfSN','0016533dbaf5');

changeDetected = ultrasonic.wallChange(brick);

if changeDetected
    ultrasonic.goForward(brick, 60);  
    pause(5);
    ultrasonic.turnRight(brick, 60, 2.5); %impl gyro turns?
    ultrasonic.goForward(brick, 60);
    changeDetected = ultrasonic.wallChange(brick);
    ultrasonic.goForward(brick, 60);
    if changeDetected  %impl gyro turns? - do this again
        ultrasonic.turnRight(brick, 60, 2.5)
        ultrasonic.goForward(brick, 60);
    end
end

brick.SetColorMode(3, 2);  % Set Color Sensor connected to Port 3 to Color RGB Mode.

while true
    color = brick.ColorCode(3);
    if color == 5
        disp('Color is red');
        brick.StopAllMotors('Brake');
        break;
    end
end



%use gyro scope corrections, to keep it straight, if it hits walls it needs
%to have a good reaction