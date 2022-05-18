%tematyka: urzadzenia medyczne
% cel: pomoc w wyborze odpowiedniego sprzetu
% zastosowanie: wyszukiwarka w sklepie medycznym
% rozwiazuje problem podjecia decyzji w sprawie zakupu

%zdefiniowanie pozycji w sklepie wg schematu:
%sprzet(urzadzenie, marka, cena, ocena uzytkownikow)
sprzet(cisnieniomierz, accumed, 135, 5).
sprzet(cisnieniomierz, microlife, 206, 4.5).
sprzet(cisnieniomierz, accumed, 96, 4.5).
sprzet(cisnieniomierz, alphamed, 85, 4).
sprzet(cisnieniomierz, braun, 185, 5).
sprzet(cisnieniomierz, braun, 276, 4.5).
sprzet(cisnieniomierz, diagnosis, 279, 5).
sprzet(inhalator, dedakj, 2847, 4.5).
sprzet(inhalator, accumed, 119, 4).
sprzet(inhalator, accumed, 128, 5).
sprzet(inhalator, adamed, 191, 3).
sprzet(inhalator, alphamed, 88, 5).
sprzet(inhalator, babyono, 103, 2.5).
sprzet(inhalator, diagnostic, 95, 2).
sprzet(termometr, accumed, 117, 5).
sprzet(termometr, adiel, 27, 3.5).
sprzet(termometr, apteocare, 15, 4.5).
sprzet(termometr, babyono, 117, 4).
sprzet(termometr, babyono, 6, 4.5).
sprzet(termometr, braun, 229, 5).
sprzet(termometr, canpol, 85, 3).
sprzet(pulsoksymetr, beurer, 155, 5).
sprzet(pulsoksymetr, gima, 59, 4.5).
sprzet(pulsoksymetr, intec, 93, 5).
sprzet(pulsoksymetr, microlife, 128, 3.5).
sprzet(pulsoksymetr, pempa, 115, 4.5).
sprzet(pulsoksymetr, techmed, 70, 5).

%informacja o przeznaczeniu produktow
%sluzy_do(termometr, X).
sluzy_do(cisnieniomierz, 'cisnienie krwi').
sluzy_do(inhalator, 'udrozeninie oddechu').
sluzy_do(termometr, 'pomiar temperatury').
sluzy_do(pulsoksymetr, 'natlenienie krwi').


%wyswietla wszystkie dostepne urzadzenia
%urzadzenia.
urzadzenia():-sprzet(A,B,C,D),
    write(sprzet(A,B,C,D)).
%wyswietla urzadzenia o ktore prosimy
%pokaz(termometr).
pokaz(X):-sprzet(X,A,B,C), write(sprzet(X,A,B,C)).

%wyswietla wszystkie urzadzenia danej firmy
%pokaz_marka(braun).
pokaz_marka(X):-sprzet(A,X,B,C), write(sprzet(A,X,B,C)).

%pokazuje sprzet o ktory prosimy ponizej danej ceny
%pokaz_ponizej(termometr, 100).
pokaz_ponizej(X,Y):-sprzet(X,B,C,D),
    Y > C,
    write(sprzet(X,B,C,D)).

%pokazuje sprzet o ktory prosimy powyzej danej ceny
%pokaz_powyzej(termometr, 100).
pokaz_powyzej(X,Y):-sprzet(X,B,C,D),
    Y < C,
    write(sprzet(X,B,C,D)).

%pokazuje produkty powyzej danej oceny
%ocena_powyzej(termometr, 4).
ocena_powyzej(X,Y):-sprzet(X,B,C,D),
    Y < D,
    write(sprzet(X,B,C,D)).

%pokazuje polecane produkty, czyli takie z ocena wieksza lub rowna 4
%polecane(termometr).
polecane(X):-sprzet(X,B,C,D),
    D >=4,
    write(sprzet(X,B,C,D)).

%wyswietla typy urzadzen w porzadku alfabetycznym
%wyswietl_typy_urzadzen.
wyswietl_typy_urzadzen():-sort([cisnieniomierz, inhalator, termometr, puloksymetr], Dostepne_urzadzenia),
    write(Dostepne_urzadzenia).

%wyswietla marki w porzadku alfabetycznym
%wyswietl_marki.
wyswietl_marki():-sort([accumed, microlife, alphamed, braun, diagnosis, dedakj, adamed, babyono, diagnostic, adiel, apteocare, canpol, beurer, gima, intec, pempa, techmed], Marki),
    write(Marki).

%pokazuje produkty sposrod podanego zakresu cenowegi
%zakres_cenowy(1,100).
zakres_cenowy(X,Y):-sprzet(A,B,C,D),
    between(X,Y,C),
    write(sprzet(A,B,C,D)).

% zaawansowany sposob wyszukiwania w ktorym trzeba sprecyzowac sporo
% rzeczy
% wyszukiwanie_zaawansowane(termometr,babyono,1,100,1).
wyszukiwanie_zaawansowane(A,B,X,Y,Z):-sprzet(A,B,C,D),
    between(X,Y,C),
    Z < D,
    write(sprzet(A,B,C,D)).

