-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 27 Mar 2022, 14:16
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `komis`
--

DELIMITER $$
--
-- Funkcje
--
CREATE DEFINER=`root`@`localhost` FUNCTION `zmiana_ceny` (`cena` NUMERIC(11,2), `zmiana` NUMERIC(11,2)) RETURNS DECIMAL(11,2)  BEGIN  

DECLARE wynik NUMERIC(11,0);  

 SET wynik = (cena * zmiana);   

  RETURN wynik;  

 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `ID_klienta` int(11) NOT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `kod_pocztowy` varchar(6) DEFAULT NULL,
  `miejscowosc` varchar(50) DEFAULT NULL,
  `ulica` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`ID_klienta`, `imie`, `nazwisko`, `kod_pocztowy`, `miejscowosc`, `ulica`) VALUES
(1, 'Jan', 'Kowal', '87-100', 'Toruń', 'Gagarina 16'),
(2, 'Eryk', 'Deryk', '87-100', 'Toruń', 'Słoneczna 24/3b'),
(3, 'Bożena', 'Drewniak', '00-002', 'Warszawa', 'Krucza 88b/17'),
(4, 'Stefan', 'Kowal', '72-122', 'Bydgoszcz', 'Gagarina 16'),
(5, 'Natalia', 'Zamojska', '72-122', 'Bydgoszcz', 'Długa 7'),
(6, 'Marek', 'Kamiński', '00-002', 'Warszawa', 'Prosta 46c/24'),
(7, 'Jerzy', 'Włos', '82-112', 'Ciechocinek', 'Sosnowa 6e/2');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `ID_pracownika` int(11) NOT NULL,
  `ID_punktu` int(11) DEFAULT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `stanowisko` varchar(50) DEFAULT NULL,
  `pensja` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`ID_pracownika`, `ID_punktu`, `imie`, `nazwisko`, `stanowisko`, `pensja`) VALUES
(1, 1, 'Piotr', 'Kowalski', 'kierownik', 4000),
(2, 1, 'Kamil', 'Nowak', 'sprzedawca', 2500),
(3, 2, 'Witold', 'Wisniewski', 'sprzedawca', 2500),
(4, 3, 'Rafal', 'Piotrowski', 'sprzedawca', 2500);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `punkty_sprzedazy`
--

CREATE TABLE `punkty_sprzedazy` (
  `ID_punktu` int(11) NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL,
  `ulica` varchar(50) DEFAULT NULL,
  `miejscowosc` varchar(50) DEFAULT NULL,
  `kod_pocztowy` varchar(6) DEFAULT NULL,
  `telefon` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `punkty_sprzedazy`
--

INSERT INTO `punkty_sprzedazy` (`ID_punktu`, `nazwa`, `ulica`, `miejscowosc`, `kod_pocztowy`, `telefon`) VALUES
(1, 'York', 'Polna 34', 'Torun', '87-100', 790486798),
(2, 'Auto Komis Markol', 'Kwiatowa 87b', 'Warszawa', '00-002', 883083571),
(3, 'Laguna', 'Slupska 1', 'Bydgoszcz', '72-122', 123456789);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samochody`
--

CREATE TABLE `samochody` (
  `ID_samochodu` int(11) NOT NULL,
  `ID_punktu` int(11) DEFAULT NULL,
  `marka` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `silnik` varchar(4) DEFAULT NULL,
  `moc` varchar(6) DEFAULT NULL,
  `rok_produkcji` int(4) DEFAULT NULL,
  `stan` varchar(50) DEFAULT NULL,
  `cena` int(7) DEFAULT NULL,
  `rodzaj_pojazdu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `samochody`
--

INSERT INTO `samochody` (`ID_samochodu`, `ID_punktu`, `marka`, `model`, `silnik`, `moc`, `rok_produkcji`, `stan`, `cena`, `rodzaj_pojazdu`) VALUES
(1, 1, 'Audi', 'A4', '3.0l', '240KM', 2012, 'Bardzo dobry', 56905, 'sedan'),
(3, 3, 'Mercedes', 'A', '1.8l', '120KM', 2006, 'Dobry', 9900, 'hatchback'),
(4, 1, 'Porsche', 'Cayenne ', '4.2l', '380KM', 2003, 'Średni', 12900, 'SUV'),
(7, 2, 'Honda', 'Accord', '2.0l', '225KM', 2016, 'Bardzo dobry', 63900, 'sedan'),
(8, 2, 'Kia', 'Optima', '3.0l', '175KM', 2012, 'Bardzo dobry', 26900, 'sedan'),
(9, 1, 'Opel', 'Corsa', '1.2l', '95KM', 2018, 'Bardzo dobry', 44500, 'hatchback'),
(12, 2, 'Seatl', 'Ibiza', '1.4l', '125KM', 2016, 'Dobry', 12500, 'hatchback'),
(14, 3, 'Citroen', 'C4', '1.7l', '138KM', 2015, 'Średni', 48500, 'hatchback');

--
-- Wyzwalacze `samochody`
--
DELIMITER $$
CREATE TRIGGER `usun_auto` BEFORE DELETE ON `samochody` FOR EACH ROW BEGIN   

INSERT INTO sprzedane_auta (ID_samochodu , ID_punktu, marka , model, silnik, moc, rok_produkcji, stan, cena, rodzaj_pojazdu, czas_sprzedazy)  

VALUES (OLD.ID_samochodu, OLD.ID_punktu, OLD.marka, OLD.model, OLD.silnik, OLD.moc, OLD.rok_produkcji, OLD.stan, OLD.cena, OLD.rodzaj_pojazdu, NOW());  

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sprzedane_auta`
--

CREATE TABLE `sprzedane_auta` (
  `ID_samochodu` int(11) NOT NULL,
  `ID_punktu` int(11) DEFAULT NULL,
  `marka` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `silnik` varchar(4) DEFAULT NULL,
  `moc` varchar(6) DEFAULT NULL,
  `rok_produkcji` int(4) DEFAULT NULL,
  `stan` varchar(50) DEFAULT NULL,
  `cena` int(7) DEFAULT NULL,
  `rodzaj_pojazdu` varchar(50) DEFAULT NULL,
  `czas_sprzedazy` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `sprzedane_auta`
--

INSERT INTO `sprzedane_auta` (`ID_samochodu`, `ID_punktu`, `marka`, `model`, `silnik`, `moc`, `rok_produkcji`, `stan`, `cena`, `rodzaj_pojazdu`, `czas_sprzedazy`) VALUES
(2, 2, 'BMW', '5', '2.0l', '200KM', 2016, 'Bardzo dobry', 79900, 'sedan', '2022-03-25'),
(5, 2, 'Honda', 'Civic', '1.8l', '142KM', 2012, 'Dobry', 44900, 'hatchback', '2022-03-25'),
(6, 3, 'Kia', 'Ceed', '2.0l', '160KM', 2015, 'Uszkodzony', 29900, 'hatchback', '2022-03-25'),
(10, 3, 'Opel', 'Astra', '2.2l', '180KM', 2004, 'Średni', 11900, 'coupe', '2022-03-25'),
(11, 1, 'Skoda', 'Octavia', '1.8l', '180KM', 2013, 'Dobry', 31900, 'sedan', '2022-03-25'),
(13, 3, 'Fiat', 'Panda', '1.0l', '60KM', 2004, 'Średni', 6500, 'hatchback', '2022-03-25');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `status_platnosci`
--

CREATE TABLE `status_platnosci` (
  `ID_transakcji` int(11) DEFAULT NULL,
  `status_platnosci` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `status_platnosci`
--

INSERT INTO `status_platnosci` (`ID_transakcji`, `status_platnosci`) VALUES
(1, 'Zapłacono'),
(2, 'Oczekujące'),
(3, 'Zapłacono'),
(4, 'Zapłacono'),
(5, 'Oczekujące'),
(6, 'Zapłacono');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `szczegóły_transakcji`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `szczegóły_transakcji` (
`Klient` varchar(101)
,`Samochód` varchar(101)
,`Cena` int(7)
,`Salon` varchar(50)
,`Sprzedawca` varchar(101)
,`Data transakcji` date
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `transakcje`
--

CREATE TABLE `transakcje` (
  `ID_transakcji` int(11) NOT NULL,
  `wartosc_transakcji` int(6) DEFAULT NULL,
  `rodzaj_platnosci` varchar(20) DEFAULT NULL,
  `data_transakcji` date DEFAULT NULL,
  `ID_klienta` int(11) DEFAULT NULL,
  `ID_pracownika` int(11) DEFAULT NULL,
  `ID_samochodu` int(11) DEFAULT NULL,
  `status_platnosci` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `transakcje`
--

INSERT INTO `transakcje` (`ID_transakcji`, `wartosc_transakcji`, `rodzaj_platnosci`, `data_transakcji`, `ID_klienta`, `ID_pracownika`, `ID_samochodu`, `status_platnosci`) VALUES
(1, 79990, 'Przelew', '2022-03-18', 2, 3, 2, 'Zapłacono'),
(2, 29990, 'Przelew', '2022-03-24', 3, 4, 6, 'Oczekujące'),
(3, 11900, 'Gotówka', '2022-03-20', 6, 4, 10, 'Zapłacono'),
(4, 6500, 'Gotówka', '2022-03-25', 1, 4, 13, 'Zapłacono'),
(5, 44900, 'Przelew', '2022-03-25', 7, 3, 5, 'Oczekujące'),
(6, 31900, 'Gotówka', '2022-03-02', 4, 1, 11, 'Zapłacono');

--
-- Wyzwalacze `transakcje`
--
DELIMITER $$
CREATE TRIGGER `dodaj_status` AFTER INSERT ON `transakcje` FOR EACH ROW INSERT INTO status_platnosci (ID_transakcji , status_platnosci)    

VALUES (NEW.ID_transakcji, NEW.status_platnosci)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_status` AFTER UPDATE ON `transakcje` FOR EACH ROW UPDATE status_platnosci as sp, transakcje as t 
SET sp.status_platnosci = t.status_platnosci
WHERE t.ID_transakcji = sp.ID_transakcji
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `wyniki_sprzedazy`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `wyniki_sprzedazy` (
`Pracownik` varchar(101)
,`Salon` varchar(50)
,`Ilość sprzedanych aut` bigint(21)
);

-- --------------------------------------------------------

--
-- Struktura widoku `szczegóły_transakcji`
--
DROP TABLE IF EXISTS `szczegóły_transakcji`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `szczegóły_transakcji`  AS SELECT concat(`k`.`imie`,' ',`k`.`nazwisko`) AS `Klient`, concat(`s`.`marka`,' ',`s`.`model`) AS `Samochód`, `s`.`cena` AS `Cena`, `pk`.`nazwa` AS `Salon`, concat(`p`.`imie`,' ',`p`.`nazwisko`) AS `Sprzedawca`, `t`.`data_transakcji` AS `Data transakcji` FROM ((((`transakcje` `t` left join `sprzedane_auta` `s` on(`t`.`ID_samochodu` = `s`.`ID_samochodu`)) left join `klienci` `k` on(`t`.`ID_klienta` = `k`.`ID_klienta`)) left join `pracownicy` `p` on(`p`.`ID_pracownika` = `t`.`ID_pracownika`)) left join `punkty_sprzedazy` `pk` on(`p`.`ID_punktu` = `pk`.`ID_punktu`))  ;

-- --------------------------------------------------------

--
-- Struktura widoku `wyniki_sprzedazy`
--
DROP TABLE IF EXISTS `wyniki_sprzedazy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wyniki_sprzedazy`  AS SELECT concat(`p`.`imie`,' ',`p`.`nazwisko`) AS `Pracownik`, `pk`.`nazwa` AS `Salon`, count(`t`.`ID_pracownika`) AS `Ilość sprzedanych aut` FROM ((`pracownicy` `p` join `transakcje` `t` on(`t`.`ID_pracownika` = `p`.`ID_pracownika`)) left join `punkty_sprzedazy` `pk` on(`pk`.`ID_punktu` = `p`.`ID_punktu`)) GROUP BY `t`.`ID_pracownika`;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`ID_klienta`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`ID_pracownika`),
  ADD KEY `ID_punktu` (`ID_punktu`);

--
-- Indeksy dla tabeli `punkty_sprzedazy`
--
ALTER TABLE `punkty_sprzedazy`
  ADD PRIMARY KEY (`ID_punktu`);

--
-- Indeksy dla tabeli `samochody`
--
ALTER TABLE `samochody`
  ADD PRIMARY KEY (`ID_samochodu`),
  ADD KEY `ID_punktu` (`ID_punktu`);

--
-- Indeksy dla tabeli `sprzedane_auta`
--
ALTER TABLE `sprzedane_auta`
  ADD PRIMARY KEY (`ID_samochodu`);

--
-- Indeksy dla tabeli `status_platnosci`
--
ALTER TABLE `status_platnosci`
  ADD KEY `ID_transakcji` (`ID_transakcji`);

--
-- Indeksy dla tabeli `transakcje`
--
ALTER TABLE `transakcje`
  ADD PRIMARY KEY (`ID_transakcji`),
  ADD KEY `ID_klienta` (`ID_klienta`),
  ADD KEY `ID_pracownika` (`ID_pracownika`),
  ADD KEY `ID_samochodu` (`ID_samochodu`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `ID_klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `ID_pracownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `punkty_sprzedazy`
--
ALTER TABLE `punkty_sprzedazy`
  MODIFY `ID_punktu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `samochody`
--
ALTER TABLE `samochody`
  MODIFY `ID_samochodu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT dla tabeli `sprzedane_auta`
--
ALTER TABLE `sprzedane_auta`
  MODIFY `ID_samochodu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT dla tabeli `transakcje`
--
ALTER TABLE `transakcje`
  MODIFY `ID_transakcji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD CONSTRAINT `pracownicy_ibfk_1` FOREIGN KEY (`ID_punktu`) REFERENCES `punkty_sprzedazy` (`ID_punktu`);

--
-- Ograniczenia dla tabeli `samochody`
--
ALTER TABLE `samochody`
  ADD CONSTRAINT `samochody_ibfk_1` FOREIGN KEY (`ID_punktu`) REFERENCES `punkty_sprzedazy` (`ID_punktu`);

--
-- Ograniczenia dla tabeli `status_platnosci`
--
ALTER TABLE `status_platnosci`
  ADD CONSTRAINT `status_platnosci_ibfk_1` FOREIGN KEY (`ID_transakcji`) REFERENCES `transakcje` (`ID_transakcji`);

--
-- Ograniczenia dla tabeli `transakcje`
--
ALTER TABLE `transakcje`
  ADD CONSTRAINT `transakcje_ibfk_1` FOREIGN KEY (`ID_klienta`) REFERENCES `klienci` (`ID_klienta`),
  ADD CONSTRAINT `transakcje_ibfk_2` FOREIGN KEY (`ID_pracownika`) REFERENCES `pracownicy` (`ID_pracownika`),
  ADD CONSTRAINT `transakcje_ibfk_3` FOREIGN KEY (`ID_samochodu`) REFERENCES `sprzedane_auta` (`ID_samochodu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
