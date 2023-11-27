global key
InitKeyboard();
while true
    pause(0.1);
    switch key
    case 'uparrow'
      brick.MoveMotor('AB', -60);   
    case 'downarrow'
      brick.MoveMotor('AB', 60);   
    case 'leftarrow'
        brick.MoveMotor('A', 30);   
    case 'rightarrow'
        brick.MoveMotor('A', -30);          
    case 'w'
        brick.MoveMotor('C', 250);   
    case 's'
        brick.MoveMotor('C', -250); 
    case 0
        brick.StopMotor('AB', 'Brake');  
    end
end
CloseKeyboard();

