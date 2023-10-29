count = 0;

while true
    brick.SetColorMode(3, 2);
    color = brick.ColorCode(3);
    fx.detectWallChange(brick)
    % Check for wall change
    if fx.detectWallChange(brick)
        count = count + 1;
    end

    % Perform actions based on color
    if color == 4
        fprintf('Lifting lift\n');
        brick.StopAllMotors('Brake');
        brick.MoveMotor('C', 250);
        pause(5);
        brick.StopAllMotors('Brake');
        fprintf('Done Lifting\n');
    end
    
    if color == 3
        fprintf('Finish\n');
        brick.StopAllMotors('Brake');
    end
    
    if color == 5
        brick.StopAllMotors('Brake');
        fprintf('yo')
    end

    pause(1);
end
