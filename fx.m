classdef fx
    methods(Static)
          function detectWallChange(brick)
            initialDistance = brick.UltrasonicDist(4);
            changeDetected = false; 
            while true
                currentDistance = brick.UltrasonicDist(4);
                 if (currentDistance - initialDistance) > 0.5
                    brick.StopAllMotors('Coast');%lol 
                    pause(3);
                    fx.turnRight(brick);
                    changeDetected = true;
                    fprintf('New wall at %.3f cm away. Changing direction.\n', currentDistance);
                    fx.nextSearch(brick);
                    break;
                 else
                     fx.goForward(brick, 60);
                     pause(1);
                end 
            end
          end 
        
        function goForward(brick, speed)
            brick.MoveMotor('AB', speed);
        end
        
        function goBackward(brick, speed)
            brick.MoveMotor('AB', -speed);
        end
        
        function turnLeft(brick)
            brick.ResetMotorAngle('A');
            brick.MoveMotorAngleRel('A', 30, 335, 'Brake');
            brick.WaitForMotor('A');
            pause(3);  % Buffer time so it fully does the turn
        end
        
        function turnRight(brick)
            brick.ResetMotorAngle('B');
            brick.MoveMotorAngleRel('B', 30, 335, 'Brake');
            brick.WaitForMotor('B'); 
            pause(3);
        end

        function nextSearch(brick) % Stops once its passed the wall so it can turn
            fx.detectWallChange(brick);
        end
    end
end
