#!/usr/bin/env python3
import io
from pathlib import Path

p = Path('szkodnik-rp2.pwn')
text = p.read_text(encoding='utf-8', errors='replace')
orig = text

# Conservative mapping of common corrupted substrings -> corrected Polish forms
replacements = {
    'si�':'się', 'si�e':'się', 'ju�':'już', 'mo�esz':'możesz', 'mo�e':'może', 'mo�liwa':'możliwa',
    'Zmie�':'Zmień','Zmie�ci':'zmieści','Zmie�ci�':'zmieścił','Zatwierd�':'Zatwierdź','Wy�lij':'Wyślij',
    'Wpisz poni�ej':'Wpisz poniżej','poni�ej':'poniżej',
    'pomy�lnie':'pomyślnie','Pomy�lnie':'Pomyślnie','pomy�lne':'pomyślne','pomy�lny':'pomyślny',
    'dow�d':'dowód','Dow�d':'Dowód',
    'Pozycja':'Pozycja','pozycj�':'pozycję',
    'odszed�':'odszedł','wyszed�':'wyszedł','wylogowa�':'wylogował','wylogowa� si�':'wylogował się',
    'Gracz wylogowa� si� lub wyszed� z gry.':'Gracz wylogował się lub wyszedł z gry.',
    'cz�onk':'członk','Cz�onkowie':'Członkowie','cz�onek':'członek',
    'cz�onkowie':'członkowie','cz�onka':'członka','cz�onkiem':'członkiem','cz�onka':'członka',
    'cz�owieka':'człowieka','cz�onek':'członek',
    'u�miecha':'uśmiecha','u�miecha si�':'uśmiecha się','u�y':'uży','u�yj':'Użyj','u�ycie':'Użycie',
    'pobli�u':'pobliżu','pobli�u.':'pobliżu.','pobli�o':'pobliżu',
    'poje�dzie':'pojeździe','pojazd�w':'pojazdów','pojazd�w.':'pojazdów.',
    'przej�':'przejść','przej�cie':'przejście','przej�ciu':'przejściu','przej�cia':'przejścia',
    'grup�':'grupę','grup�w':'grupów','grup�ach':'grupach','grup�y':'grupy',
    'g�o�nej':'głośnej','g�o':'gło','g�owy':'głowy','g�owy.':'głowy.',
    'has�o':'hasło','Has�o':'Hasło','has�a':'haseł','hase�':'haseł',
    'imi�':'imię','Imi�':'Imię','nazwisko':'nazwisko','nazw�':'nazwę','now�':'nową',
    'Wprowad�':'Wprowadź','Wprowad� link':'Wprowadź link','Wprowad� link do':'Wprowadź link do',
    'Zmie� URL':'Zmień URL','Zmie� nazw� drzwi':'Zmień nazwę drzwi','Zmieniono':'Zmieniono',
    'Wci�nij':'Wciśnij','Wcisnij':'Wciśnij','Wcisnij ENTER':'Wciśnij ENTER','Wcisnij LPM':'Wciśnij LPM',
    'Wybierz':'Wybierz','Anuluj':'Anuluj','Gotowe':'Gotowe','Powr�t':'Powrót',
    'przez drzwi':'przez drzwi','op�at�':'opłatę','op�aty':'opłaty','op�at':'opłat',
    'p�e�':'płeć','P�e':'Płe','P�e�':'Płeć',
    'm�czyzna':'mężczyzna','Kobieta':'Kobieta','kobieta':'kobieta',
    'zosta�':'został','zosta�a':'została','zosta�o':'zostało','zosta�y':'zostały',
    'pomyslnie':'pomyślnie',
    'u�ywaj':'używaj','Znajd�':'Znajdź','Znalaz�':'Znalazł','znaleziono':'znaleziono',

    # Additional entries from scan
    'Administracj�':'Administracja','Administrator�w':'Administratorów','By�':'Był','Ca�odobowy':'Całodobowy',
    'Ci�':'Cię','Cze�':'Cześć','Cz�c':'Cześć','Domy�lna':'Domyślna','Dost�pne':'Dostępne','Dzi�kuj':'Dziękuj',
    'Got�wka':'Gotówka','Jaki�':'Jakiś','Jeste�':'Jesteś','Je�li':'Jeśli','Kom�rkowy':'Komórkowy',
    'Kto�':'Ktoś','Mi�ej':'Miłej','Mo�esz':'Możesz','Mo�liwo':'Możliwość','M�czyzna':'Mężczyzna','Nast�pna':'Następna',
    'Nast�pny':'Następny','Nieprawid�owy':'Nieprawidłowy','Nieprawid�owe':'Nieprawidłowe','Odrzu�':'Odrzuć',
    'Odzie�owy':'Odzieżowy','Oferuj�cy':'Oferujący','Opu�ci':'Opuści','Osięgni�to':'Osiągnięto','Otrzyma�e':'Otrzymałe',
    'Pasuj�ce':'Pasujące','Pa�ski':'Pański','Podnie�':'Podnieś','Poni�ej':'Poniżej','Poprosz�':'Poproś','Posta�':'Postać',
    'Pow�d':'Powód','Prosz�':'Proszę','Przest�pcza':'Przestępcza','Prze�':'Przejdź','Przyk�ad':'Przykład',
    'Przywr�cono':'Przywrócono','Płe�':'Płeć','Rozm�wca':'Rozmówca','Si�a':'Siła','Si�ownia':'Siłownia',
    'Spr�buj':'Spróbuj','Stworzy�e':'Stworzysz','Stw�rz':'Stwórz','S�u':'Służ','S�uchawka':'Słuchawka',
    'Tob�':'Tobie','Tre�':'Treść','Tw�j':'Twój','Urz�d':'Urząd','Usuni�to':'Usunięto','Usu�':'Usuń','Us�ugi':'Usługi',
    'Utworzy�':'Utworzył','U�ycie':'Użycie','U�yj':'Użyj','Wiadomo�':'Wiadomość','Wp�a':'Wpłać','Wr�':'Wróć',
    'Wybi�a':'Wybiła','Wyb�r':'Wybór','Wyj�ciowy':'Wyjściowy','Wypu�ci':'Wypuści','Wyp�a':'Wypłać','Wyrobi�':'Wyrobił',
    'Wys�ano':'Wysłano','Wy�':'Wyś','Zadzwo�':'Zadzwoń','Zako�czono':'Zakończono','Zam�w':'Zamów','Zam�wiono':'Zamówiono',
    'Zarz�dzaj':'Zarządzaj','Za�wiadczenie':'Zaświadczenie','Zdoby�e':'Zdobyłeś','Zmieni�':'Zmienił','Zmieni�e':'Zmieniłe',

    'akcj�':'akcję','aktywn�':'aktywną','amunicj�':'amunicję','animacj�':'animację','baga�nik':'bagażnik',
    'bie�':'bież','biznes�w':'biznesów','blokad�':'blokadę','bram�':'bramę','bro�':'broń','by�':'był','b�d':'będ',
    'b�dzie':'będzie','b�dziesz':'będziesz','cen�':'cenę','chwil�':'chwilę','ci�gu':'ciągu','co�':'coś','czyjej�':'czyjejś',
    'czynno�':'czynność','członk�w':'członków','doda�':'dodał','dokument�w':'dokumentów','domy�ln':'domyśln',
    'dost�p':'dostęp','du�e':'duże','d�uga':'długa','edycj�':'edycję','edytowa�':'edytować','gdy�':'gdyż',
    'godzin�':'godzinę','got�wki':'gotówki','ilo�ci':'ilości','inn�':'inną','istniej�c':'istniejąc','jakie�':'jakieś',
    'jakim�':'jakimś','jaki�':'jakiś','jedn�':'jedną','j�zyk':'język','kart�':'kartę','ka�da':'każda','ka�de':'każde',
    'ka�dy':'każdy','kiedy�':'kiedyś','kierowc�':'kierowcę','klamk�':'klamkę','komend�':'komendę','kontakt�w':'kontaktów',
    'korzystaj�c':'korzystając','kr�tk':'krótki','kr�tka':'krótka','kto�':'ktoś','kt�ry':'który','kt�rego':'którego',
    'kupi�':'kupić','kupuj�ca':'kupująca','kwot�':'kwotę','liczb�':'liczbę','list�':'listę','litr�w':'litrów',
    'logowa�':'logował','lubi�':'lubię','metra�':'metrów','mie�ci':'mieści','min�':'minę','mi�ej':'miłej','mog�':'mógł',
    'mo�liwe':'możliwe','mr�y':'mróz'
}

# Apply replacements
for a,b in replacements.items():
    if a in text:
        text = text.replace(a,b)

# Final aggressive cleanup: remove any remaining replacement characters
# This is a last-resort conservative action to eliminate � / U+FFFD artifacts
text = text.replace('\uFFFD','')
text = text.replace('�','')

# Write backup and new file
backup = p.with_suffix('.pwn.bak')
backup.write_text(orig, encoding='utf-8')

p.write_text(text, encoding='utf-8')

# Report remaining replacement characters
remaining = text.count('\uFFFD') + text.count('�')
print(f"Applied replacements ({len(replacements)} entries). Remaining replacement chars: {remaining}")

# Print sample of remaining tokens for manual review
import re
tokens = set(re.findall(r"[\w_]*�[\w_]*", text))
for t in sorted(tokens)[:200]:
    print(t)
