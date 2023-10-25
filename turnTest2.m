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
ultrasonic.goForward(brick, 60);
pause(2.5);