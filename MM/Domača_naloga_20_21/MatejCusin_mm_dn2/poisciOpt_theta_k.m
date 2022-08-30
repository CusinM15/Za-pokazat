function [theta, k] = poisciOpt_theta_k(b, B)
% function [theta,k] = poisciOpt_theta_k(b,B)
% Funkcija poisce netrivialen theta za brahistohrono, tako da g(theta)=0.

% Pogleg thete vrne tudi konstanto k.


% definiramo funkcijo g (konec strani 2)



% resimo nelin. enacbo (s funkcijo fzero) --> theta, k
g = @(theta) (1 - cos(theta)) + (B / b) * (theta - sin(theta));
theta = fzero(g, 2 * pi);
k = (2 * b / (theta - sin(theta))) ^ 0.5;




end