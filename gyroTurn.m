%brick = Brick('ioType','wifi','wfAddr','127.0.0.1','wfPort',5555,'wfSN','0016533dbaf5')
brick.GyroCalibrate(1);
fprintf('running gyroTurn\n');
brick.MoveMotorAngleRel('B', 60, 200); 
while true
    angle = brick.GyroAngle(1);
    
    
    if angle <= 86
        angle = brick.GyroAngle(1);
        brick.MoveMotorAngleRel('A', -30, 5); 
    else 
        fprintf('turnDone\n');
        brick.StopAllMotors('Break');
        brick.GyroCalibrate(1);
        break;
    end
end

