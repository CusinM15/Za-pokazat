format long

bC = [0 1 2.2 3 4 2.00 1.5 1;    
     0 2 -1 1 2.9 1.8 1 0];
% 1
odg1 = norm(bezierOdvod(bC, 0.25))