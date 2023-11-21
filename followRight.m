%brick = Brick('ioType','wifi','wfAddr','127.0.0.1','wfPort',5555,'wfSN','0016533dbaf5')
fprintf('starting followRight\n');
gyroTurn180;
brick.SetColorMode(3, 2);
lifted = false;

while true
    brick.StopAllMotors;
    d1 = brick.UltrasonicDist(4);   
    brick.MoveMotor('AB', -45);
    pause(0.75);
    d2 = brick.UltrasonicDist(4);
    if (d2 - d1) > 5
        fprintf('wall detected\n');
        brick.MoveMotor('AB', -30);
        pause(2.2);
        brick.StopAllMotors;
        gyroTurn;
        brick.StopAllMotors;
    end
    color = brick.ColorCode(3);
    if color == 4
        fprintf('Lifting lift\n');
        brick.StopAllMotors('Brake');
        brick.MoveMotor('C', 250);
        pause(5);
        brick.StopAllMotors('Brake');
        fprintf('Done Lifting\n');
        gyroTurn180;
        lifted = true;
    end
    
    if color == 3 && lifted
        fprintf('Finish\n');
        brick.StopAllMotors('Brake');
        break
    end
    touch = brick.TouchPressed(2);
        if touch
            brick.StopAllMotors;
            fprintf('Wall hit!\n');
            pause(0.5);
            brick.StopAllMotors;
            brick.MoveMotor('AB', 60);
    
            pause(0.9);
            brick.StopAllMotors;
            gyroTurn180;
            d2 = brick.UltrasonicDist(4);
            if d2 > 15
                gyroTurn;
            end

        end
        
    correction;

end
