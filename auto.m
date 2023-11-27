%brick = Brick('ioType','wifi','wfAddr','127.0.0.1','wfPort',5555,'wfSN','0016533dbaf5')
fprintf('starting followRight\n');
gyroTurn180;
brick.SetColorMode(3, 2);
lifted = false;

ovverideGo = false; %if this is true it opens up the manual controls

while ~ovverideGo %while this is not true it does the normal followRight
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
end

ovveride = input('enter to ovveride');

if strcmp(override, 'yes') %if the user wants to ovveride than it sets ovveride go to true and opens the manual control.
    ovverideGo = true;
end

while ovverideGo %here is where it opens up manual 
    manual();
end

%I don't know how to order the code to get it working where it while prompt
%the user to enter yes, but will keep doing the normal "followRight" code
%until yes is prompted then it will stop and open up manual controls. 
