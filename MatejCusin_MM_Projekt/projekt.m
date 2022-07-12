r = 20;
n = 3; % Velikost n-kotnika.
k = 5; % Število odbojev.
x = n_kotnik(r, n); 
% Dobimo n- kotnik "sreduščem" v [r, r], Za Lažje določanje naključnega
% začetka. Lihi n-kotnik smo obrnili za 90° zato, da ne dobimo premice z
% naklonom neskončno.


poligon = polyshape(x(1, :), x(2, :)); 
% Spremenimo v poligon, ker ima Matlab za to že funkcije.
hold on
axis equal
polje = plot(poligon, 'LineWidth', 10);
% Biljardno polje je navadi zelene barve.
polje.FaceColor = 'green';

tocka = rand(2, 1) * 2 * r;
ali_je_notri = isinterior(poligon, tocka(1), tocka(2));

while ~ali_je_notri
    % Poskrbimo da je začetna točka znotraj n-kotnika.
    tocka = rand(2, 1) * r;
    ali_je_notri = isinterior(poligon, tocka(1), tocka(2));
end

% Določimo vektor za vsako stranico.
vektorji = zeros(2, n);
for i = 1: n - 1
    vektorji(1, i) = x(1, i + 1) - x(1, i); 
    vektorji(2, i) = x(2, i + 1) - x(2, i);
end
vektorji(1, n) = x(1, 1) - x(1, n); 
vektorji(2, n) = x(2, 1) - x(2, n);

% Prvi "strel" gre proti sredini prve stene (pri meni je to daljica med
% prvimadvema točkama v x.

zeljena_smer = [(x(1, 1) + x(1, 2))/ 2; (x(2, 1) + x(2, 2))/ 2];
seka = 1; % Prvič seka prvo stranico;
for z = 1: k + 1
    presek = [vektorji(1, seka); vektorji(2, seka)];
    vek = [tocka(1) - zeljena_smer(1); tocka(2) - zeljena_smer(2)];
    k_pre = (tocka(2) - zeljena_smer(2)) / (tocka(1) - zeljena_smer(1));
    yp = @(x) k_pre .* x + tocka(2) - k_pre * tocka(1);
    % Nastavimo omejitve x in y.
    x1 = linspace(tocka(1), zeljena_smer(1));
    y1 = yp(x1);
    hitrost = floor(norm(tocka - zeljena_smer)); 
    % Mogoče malo "lepše" teče kroglica, če uporabim to pri pavzi.
    %plot(x1, y1, 'r') 
    % Da lahko spremljamo pot kroglice ali pa zato, da "ugasnemo" animacijo
    % in vidimo, kakšno pot opravi pri veliko korakih.
    % Nastavimo grafični kazalec za žogico.
    krogla = plot(tocka(1), tocka(2), 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'w');
    % Poskrbi za animacijo, kako se žogica premika.
    for i = 1: length(x1)
        % En premik.
        set(krogla, 'XData', x1(i), 'YData', y1(i));
        % Pavza da je malo animacije.
        pause(hitrost * 0.0005);
    end
    if z ~= k + 1
        % Zbriše vse kroglice razen zadnje.
        delete(krogla);
    end
    % Za odboj.
    kot = acos(dot(vek, presek) / (norm(vek) * norm(presek)));
    rezerva = tocka;
    tocka = zeljena_smer;
    % To poskrbi za odboj v pravilno smer.
    if kot < pi / 2
        kot = pi - 2 * kot; % Da dobimo kot med vhodnim in izhodnim vektorjem.
        zeljena_smer(1) = cos(kot) .* vek(1) - sin(kot) .* vek(2);
        zeljena_smer(2) = sin(kot) * vek(1) + cos(kot) * vek(2);
    else
        kot = 2 * kot - pi; % Da dobimo kot med vhodnim in izhodnim vektorjem.
        zeljena_smer(1) = cos(kot) * vek(1) + sin(kot) * vek(2);
        zeljena_smer(2) = -sin(kot) * vek(1) + cos(kot) * vek(2);
    end
    % Dobili smo vektor potrebujemo le točko!
    zeljena_smer(1) = zeljena_smer(1) + rezerva(1);
    zeljena_smer(2) = zeljena_smer(2) + rezerva(2);

    kp_pre = (rezerva(2) - zeljena_smer(2)) / (rezerva(1) - zeljena_smer(1));
    pregledano = 0;
    for j = 1: n - 1
        if seka ~= j   % Ne more se dobiti nazaj v isto točko.                   
            kj = vektorji(2, j) / vektorji(1, j);
            yj = @(p) kj .* p + x(2, j) - kj * x(1, j);
            presecisce = (tocka(2) - kp_pre * tocka(1) - x(2, j) + kj * x(1, j)) / (kj - kp_pre);
            prvi = ((presecisce <= x(1, j) && presecisce >= x(1, j + 1) || (presecisce >= x(1, j) && presecisce <= x(1, j + 1))));
            drugi = ((yj(presecisce) <= x(2, j) && yj(presecisce) >= x(2, j + 1)) || (yj(presecisce) >= x(2, j) && yj(presecisce) <= x(2, j + 1)));
            if prvi && drugi && ~isnan(presecisce)
                seka = j; % Našli smo naslednje presečišče.
                zeljena_smer(1) = presecisce;
                zeljena_smer(2) = yj(presecisce);
                pregledano = 1;  
                break
            end
        end
    end
    if pregledano == 0 
        % Če ni presečišča na nobeni prejšni steni mora biti na tej ki povezuje točko n in 1
        kj = vektorji(2, n) / vektorji(1, n);
        yj = @(p) kj .* p + x(2, n) - kj * x(1, n);
        presecisce = (tocka(2) - kp_pre * tocka(1) - x(2, n) + kj * x(1, n)) / (kj - kp_pre);
        seka = n; % Našli naslednje presečišče.
        zeljena_smer(1) = presecisce;
        zeljena_smer(2) = yj(presecisce);
    end    
end
