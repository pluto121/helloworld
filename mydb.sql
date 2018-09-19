drop table if exists MSZuordnung;
drop table if exists Preis;
drop table if exists Teilnehmer;
drop table if exists Person;
drop table if exists Sponsor;
drop table if exists Mitglied;


create table Mitglied(
MitID int unsigned auto_increment primary key,
Titel varchar(50)
);

create table Sponsor(
SponsID int unsigned auto_increment primary key,
Firmenname varchar(50)
);

create table Person(
PersID int unsigned auto_increment primary key,
Name varchar(50),
Vorname varchar(50),
TelefonNr varchar(15),
EMail varchar(50),
pMitID int unsigned unique,
pSponsID int unsigned unique,
foreign key(pMitID) references Mitglied(MitID)
    on delete cascade
    on update cascade,
foreign key(pSponsID) references Sponsor(SponsID)
    on delete cascade
    on update cascade
);

create table Teilnehmer(
KalendarID int unsigned auto_increment primary key
);

create table Preis(
PreisID int unsigned auto_increment primary key,
Bezeichnung varchar(50),
Wert float(10,2)
);

create table MSZuordnung(
msMitID int unsigned,
msSponsID int unsigned,
msKalendarID int unsigned default 0,
msPreisID int unsigned,
primary key(msMitID, msSponsID, msKalendarID, msPreisID),
foreign key(msMitID) references Mitglied(MitID)
    on delete cascade
    on update cascade,
foreign key(msSponsID) references Sponsor(SponsID)
    on delete cascade
    on update cascade,
foreign key(msKalendarID) references Teilnehmer(KalendarID)
    on delete cascade
    on update cascade,
foreign key(msPreisID) references Preis(PreisID)
    on delete cascade
    on update cascade
);