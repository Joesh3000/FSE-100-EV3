


    angle = brick.GyroAngle(1);
    angleReference = brick.GyroAngle(1);
    
    if angle >= 2 + angleReference
        fprintf('running correction\n');
        angle = brick.GyroAngle(1);
        brick.MoveMotor('A', -30); 
        pause(0.1);
    end
    if angle <= -2 + angleReference
        fprintf('running correction\n');
        angle = brick.GyroAngle(1);
        brick.MoveMotor('A', -30); 
        pause(0.1);
    end

    brick.GyroCalibrate(1);