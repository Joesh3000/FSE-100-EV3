count = 0;
% brick.SetColorMode(3, 2);
initialDistance = brick.UltrasonicDist(4);

while true
    brick.SetColorMode(3, 2);
    color = brick.ColorCode(3);
    disp("Got Color");
    % Check for wall change
    fxcode.detectWallChange(brick, initialDistance)
    disp("Yes I did");
    % if fxcode.detectWallChange(brick)
    %     count = count + 1;
    % end

    % Perform actions based on color
    % color = brick.ColorCode(3);
    disp(color);
    if color == 5
        fprintf('Stop Sign \n');
        % brick.StopAllMotors('Brake');
    end
    if color == 4
        fprintf('Lifting lift\n');
        brick.StopAllMotors('Brake');
        brick.MoveMotor('C', 100);
        pause(2);
        brick.StopAllMotors('Brake');
        fprintf('Done Lifting\n');
    end
    if color == 3
        fprintf('Finish\n');
        brick.StopAllMotors('Brake');
    end



    %  Lift.liftUp(brick);

    % if color == 4
    %     fprintf('Lifting lift\n');
    %     brick.StopAllMotors('Brake');
    %     brick.MoveMotor('C', 250);
    %     pause(5);
    %     brick.StopAllMotors('Brake');
    %     fprintf('Done Lifting\n');
    % end
    % 
    % if color == 3
    %     fprintf('Finish\n');
    %     brick.StopAllMotors('Brake');
    % end
    % 
    % if color == 5
    %     brick.StopAllMotors('Brake');
    %     fprintf('yo')
    % end

    pause(1);
end