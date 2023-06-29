# Few facts about World Cups

&emsp;Zestawienie wyników meczów mistrzostw świata w piłce nożnej w latach 1930 - 2022 z wykorzystaniem SQL oraz oprogramowania Excel.

# Informacje ogólne

&emsp;Przeprowadzona analiza zawiera odpowiedzi na najbardziej nurtujące mnie pytania odnośnie mundiali:
- Ile rund było w poszczególnych turniejach mistrzostw świata oraz jak na przestrzeni lat zmieniała się średnia liczba goli na mecz?
- Czy to, że dane państwo jest organizatorem imprezy i ma po swojej stronie kibiców wpływa na wynik w danych mistrzostwach?
- Które kontynenty dominują, jeśli chodzi o wygrane mecze oraz o całe mistrzostwa?
- Które państwa grają najbardziej zachowawczo i miały najwięcej remisowych wyników w fazie grupowej?

# Dane oraz ich analiza

&emsp;Pobrałem dane od 1930 do 2014 a następnie uzupełniłem je o mundial w Rosji 2018 oraz Katarze 2022. Wyczyściłem dane, sformatowałem komórki, usunąłem zbędne oraz dodałem potrzebne kolumny do postawionych wcześniej pytań. Ostatecznie zbiór danych:
```bash
  world_cup.csv
```
 zawierał kolumny: `Year`, `Date Time`, `Round`, `Stadium`, `City`, `Country`, `HomeTeam`, `HomeGoals`, `AwayGoals`, `AwayTeam`, `Winner`, `HowEnd`

---

####

&emsp;Drugim zbiorem danych był plik csv zawierający państwa oraz kontynenty, w których te kraje się znajdują. Sformatowałem komórki oraz dodałem państwa, które już nie istnieją (np. Jugosławia) a w swojej historii brały udział w mistrzostwach świata. Zbiór danych:
```bash
  cotntinents.csv
```
  zawierał ostatecznie kolumny: `Continent`, `Country`

## Źródła danych

 - [FIFA World Cup Match Results 1930 - 2014](https://data.world/sportsvizsunday/sports-viz-sundays-2018/workspace/file?filename=World+Cup+Results.xlsx)
 - [Countries - continents](https://github.com/dbouquin/IS_608/blob/master/NanosatDB_munging/Countries-Continents.csv) 
