
      if brick.UltrasonicDist(4)<8
            fprintf('Correcting left\n');
            brick.StopAllMotors;
            brick.MoveMotorAngleRel('A', 90, 5); 
            pause(0.2);
            
     end

     if brick.UltrasonicDist(4)>11
         if brick.UltrasonicDist(4)<15 
            fprintf('Correcting right\n');                
            brick.StopAllMotors;
            brick.MoveMotorAngleRel('A', 90, 5); 
            pause(0.2);
         end

     end