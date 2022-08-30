r = 10;
n = 5;
k = 15;
x = n_kotnik(r, n); % dobimo točke tega n kotnika tako da je najbolj leva točka v izhodišču
% sredušče tega poligona je [r, r], premaknjen zato ker sem imel z random
% pa je bilo tako lažje
poligon = polyshape(x(1, :), x(2, :)); % spremenimo v poligon, ker ima python za to že funkcije
hold on
axis equal
plot(poligon, 'LineWidth', 10)
tocka = rand(2, 1) * 2 * r;
ali_je_notri = isinterior(poligon, tocka(1), tocka(2));
while ~ali_je_notri
    % poskrbimo da je začetna točka znotraj poligona
    tocka = rand(2, 1) * r;
    ali_je_notri = isinterior(poligon, tocka(1), tocka(2));
end

% določimo vektor za vsako stranico
vektorji = zeros(2, n);
for i = 1: n - 1
    vektorji(1, i) = x(1, i + 1) - x(1, i); 
    vektorji(2, i) = x(2, i + 1) - x(2, i);
end
vektorji(1, n) = x(1, 1) - x(1, n); 
vektorji(2, n) = x(2, 1) - x(2, n);

% prvi strel gre proti sredini prve stene (pri meni je to tista ko sta x in
% y nenegativna

% spodaj se mora ponoviti k-krat
% sedaj pa še animacija 
zeljena_smer = [(x(1, 1) + x(1, 2))/ 2; (x(2, 1) + x(2, 2))/ 2];
seka = 1; % prvič seka prvo steno
oglisce = 0;
seka_prej = 1;
for z = 1: k + 1
    presek = [vektorji(1, seka); vektorji(2, seka)];
    vek = [tocka(1) - zeljena_smer(1); tocka(2) - zeljena_smer(2)];
    k_pre = (tocka(2) - zeljena_smer(2)) / (tocka(1) - zeljena_smer(1));
    y = @(x) k_pre .* x + tocka(2) - k_pre * tocka(1);
    % nastavimo omejitve x in y
    x1 = linspace(tocka(1), zeljena_smer(1));
    y1 = y(x1);
    hitrost = abs(r - abs(tocka(1) - zeljena_smer(1)));
    plot(x1, y1, 'r')
    % nastavimo grafični kazalec
    krogla = plot(tocka(1), tocka(2), 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'w');
    % sprehodimo se čez x, y ki smo jih prej omejili
    for i = 1: length(x1)
        % en premik
        set(krogla, 'XData', x1(i), 'YData', y1(i));
        % pavza 0.05 sekund
        pause(hitrost * 0.0005);
    end
    if z ~= k + 1
        % zbriše vse kroglice razen zadnje
        delete(krogla);
    end
    % za odboj
    kot = acos(dot(vek, presek) / (norm(vek) * norm(presek)));
    rezerva = tocka;
    tocka = zeljena_smer;
    % to poskrbi za odboj v pravilno smer
    if kot < pi / 2
        kot = pi - 2 * kot; % da dobimo kot med vhodnim in izhodnim vektorjem
        zeljena_smer(1) = cos(kot) * vek(1) - sin(kot) * vek(2);
        zeljena_smer(2) = sin(kot) * vek(1) + cos(kot) * vek(2);
    else
        kot = 2 * kot - pi; % da dobimo kot med vhodnim in izhodnim vektorjem
        zeljena_smer(1) = cos(kot) * vek(1) + sin(kot) * vek(2);
        zeljena_smer(2) = -sin(kot) * vek(1) + cos(kot) * vek(2);
    end
    % dobim vektor rabim le točko!
    zeljena_smer(1) = zeljena_smer(1) + tocka(1);
    zeljena_smer(2) = zeljena_smer(2) + tocka(2);
%     if oglisce == 1
%         seka = seka_prej;
%         zeljena_smer = rezerva;
%         oglisce = 0;
%     else
        kp_pre = (tocka(2) - zeljena_smer(2)) / (tocka(1) - zeljena_smer(1));
        yp = @(x) kp_pre .* x + tocka(2) - kp_pre * tocka(1);
        pregledano = 0;
        for j = 1: n - 1
            if seka ~= j  
                if vektorji(1, j) == 0
                    % če je stranica navpična
                    yj = @(p) x(1, j);
                    presecisce = x(1, j);
                    meja1 = x(1, j);
                    meja2 = x(1, j);
                else
                    kj = vektorji(2, j) / vektorji(1, j);
                    yj = @(p) kj .* p + x(2, j) - kj * x(1, j);
                    presecisce = (tocka(2) - kp_pre * tocka(1) - x(2, j) + kj * x(1, j)) / (kj - kp_pre);
                    meja1 = x(1, j);
                    meja2 = x(1, j + 1);
                end
                prvi = ((presecisce <= meja1 && presecisce >= meja2) || (presecisce >= meja1 && presecisce <= meja2));
                drugi = ((yp(presecisce) <= yp(meja1) && yp(presecisce) >= yp(meja2)) || (yp(presecisce) >= yp(meja1) && yp(presecisce) <= yp(meja2)));
                if prvi && drugi
                    tocno1 = ((presecisce == meja1 && presecisce == meja2) || (presecisce == meja1 && presecisce == meja2));
                    tocno2 = ((yp(presecisce) == yp(meja1) && yp(presecisce) == yp(meja2)) || (yp(presecisce) == yp(meja1) && yp(presecisce) == yp(meja2)));                    
                    if tocno1 && tocno2 % za lihe sem probal tu == 1 toda čudno dela
                        seka = seka_prej;
                        zeljena_smer = rezerva;
                    else
                        seka_prej = seka;
                        seka = j; % našli naslednje presečišče
                        zeljena_smer(1) = presecisce;
                        zeljena_smer(2) = yj(presecisce);
                        pregledano = 1;  
                    end
                    break
                end

            end

        end
        if pregledano == 0 
            % če ni presečišča na nobeni prejšni steni mora biti na tej ki povezuje točko n in 1
            kj = vektorji(2, n) / vektorji(1, n);
            yj = @(p) kj .* p + x(2, n) - kj * x(1, n);
            presecisce = (tocka(2) - kp_pre * tocka(1) - x(2, n) + kj * x(1, n)) / (kj - kp_pre);
            meja1 = x(1, n);
            meja2 = x(1, 1);
            seka_prej = seka;
            seka = n; % našli naslednje presečišče
            zeljena_smer(1) = presecisce;
            zeljena_smer(2) = yj(presecisce);
        end
    %end
end
