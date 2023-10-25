classdef Turnaround2
    properties(Constant)
end
methods(Static)
    function turnAroundThing = turnAround2(brick)
    fprintf('Running turnAround2\n');
    angle = 335;
    fprintf('Spinning\n');
    brick.ResetMotorAngle('A');
    brick.ResetMotorAngle('B');
    brick.MoveMotorAngleRel('A', -30, angle, 'Brake'); 
    brick.MoveMotorAngleRel('B', 30, angle, 'Brake');
    pause(4);
    fprintf('Done spinning\n');
    speed = 60;

    while true
           
           touch = brick.TouchPressed(2);
           touch2 = brick.TouchPressed(1);
           brick.MoveMotor('AB', -speed);
           if touch || touch2
               brick.StopAllMotors('Brake');
               fprintf('Wall hit!\n');
               fprintf('Reversing\n');
               brick.MoveMotor('AB', speed);
               pause(1);
               brick.ResetMotorAngle('A');
               brick.ResetMotorAngle('B'); 
               
               

               brick.StopAllMotors('Brake');
               fprintf('Turning\n');
               brick.ResetMotorAngle('A');
               brick.ResetMotorAngle('B'); 
               brick.MoveMotorAngleRel('A', -30, angle, 'Brake'); 
               brick.MoveMotorAngleRel('B', 30, angle, 'Brake'); 
               brick.ResetMotorAngle('A');
               brick.ResetMotorAngle('B'); 
               pause(5);
               brick.StopAllMotors('Brake');
           end
    end
    end

end
end



             
