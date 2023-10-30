%Test for turning check
brick.ResetMotorAngle('A');
brick.ResetMotorAngle('B');
brick.MoveMotorAngleRel('A', 30, 335, 'Brake');
brick.MoveMotorAngleRel('B', -30, 335, 'Brake');
brick.WaitForMotor('A');
brick.WaitForMotor('B');
pause(2);
ultrasonic.goForward(brick, 60);
pause(2.5);
ultrasonic.turnRight2(brick, 30, 168); %impl gyro turns?
pause(2);
ultrasonic.goForward(brick, 60);
pause(2.5);
ultrasonic.turnLeft2(brick, 30, 504); %impl gyro turns?
pause(2);

% Yellow Color Test
brick.SetColorMode(3, 2);
while true
    color = brick.ColorCode(3);
    if color == 4
        fprintf('Lifting lift\n');
        brick.StopAllMotors('Brake');
        brick.MoveMotor('C', 100);
        pause(2);
        brick.StopAllMotors('Brake');
        fprintf('Done Lifting\n');
        break;
    else
        ultrasonic.goForward(brick, 60);
        pause(0.25)
    end
end
disp("Veer is the GOAT! :)")