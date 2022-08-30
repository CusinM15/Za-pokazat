format long
T0 = [2.3; 3];  
T1 = [6; 1.4];
M = [1.0,2.0,4.8,1.2,1.0,2.0];
L = [1.0,1.5,1.0,1.4,1.0,1.3];

x = diskrVeriznica([-1; 1], T0, T1, L, M);
sredinaIn = 4;
levaPremica = [
desniVektor = [x(1, sredinaIn + 1) - x(1, sredinaIn); x(2, sredinaIn + 1) - x(2, sredinaIn)] 
%vmes = levaPremica * desniVektor / (norm(desniVektor) * norm(levaPremica)
%vmesniKot = acos(vmes) 