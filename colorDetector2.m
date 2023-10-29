% brick = Brick('ioType','wifi','wfAddr','127.0.0.1','wfPort',5555,'wfSN','0016533dbaf5')
fprintf('running\n');
while true
                brick.SetColorMode(3, 2);
                color = brick.ColorCode(3);
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

end