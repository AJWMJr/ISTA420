use TSQLV4;

drop table if exists dbo.Presidents;
create table dbo.Presidents
(
	ID varchar(50) not null,
	LastName varchar(50) not null,
	FirstName varchar(50) not null,
	MiddleName varchar(50),
	OrderOfPresidency varchar(50) not null,
	DateOfBirth varchar(50) not null,
	DateOfDeath varchar(50),
	TownOfBirth varchar(50) not null,
	StateOfBirth varchar(50) not null,
	HomeState varchar(50) not null,
	PartyAffiliation varchar(50) not null,
	DateTookOffice varchar(50) not null,
	DateLeftOffice varchar(50),
	AssassinationAttempt varchar(50) not null,
	Assassinated varchar(50) not null,
	ReligiousAffiliation varchar(50),
	ImagePath varchar(50)
);

BULK INSERT dbo.Presidents FROM 'C:\Users\wwstudent\Documents\ISTA420\exercises\Data4EX03.csv'
  WITH 
    (
       DATAFILETYPE    = 'char',
       FIELDTERMINATOR = ',',
       ROWTERMINATOR   = '\n'
    );

ALTER TABLE dbo.Presidents DROP COLUMN imagepath;

delete from dbo.Presidents
output deleted.id, deleted.LastName, deleted.FirstName, deleted.MiddleName, deleted.OrderOfPresidency,
	deleted.DateOfBirth, deleted.DateOfDeath, deleted.TownOfBirth, deleted.StateOfBirth, deleted.HomeState,
	deleted.PartyAffiliation, deleted.DateTookOffice, deleted.DateLeftOffice, deleted.AssassinationAttempt,
	deleted.Assassinated, deleted.ReligiousAffiliation
where ID = 'ID';

Alter table dbo.Presidents
alter column ID int not null;
Alter table dbo.Presidents add newColumn int not null identity
constraint newCon check(newColumn > 0 and newColumn < 46)
Alter table dbo.Presidents
add constraint PK_pres primary key(newColumn);

update dbo.Presidents
set DateLeftOffice = '1/20/2017', AssassinationAttempt = 'false', Assassinated = 'false'
where LastName = 'Obama';

insert into dbo.Presidents (id, LastName, FirstName, MiddleName, OrderOfPresidency,
	DateOfBirth, DateOfDeath, TownOfBirth, StateOfBirth, HomeState,
	PartyAffiliation, DateTookOffice, DateLeftOffice, AssassinationAttempt,
	Assassinated, ReligiousAffiliation)
output inserted.id, inserted.LastName, inserted.FirstName, inserted.MiddleName, inserted.OrderOfPresidency,
	inserted.DateOfBirth, inserted.DateOfDeath, inserted.TownOfBirth, inserted.StateOfBirth, inserted.HomeState,
	inserted.PartyAffiliation, inserted.DateTookOffice, inserted.DateLeftOffice, inserted.AssassinationAttempt,
	inserted.Assassinated, inserted.ReligiousAffiliation
values (45, 'Trump', 'Donald', 'John', '45', '6/14/1946', null, 'New York', 'New York', 'New York', 'Republican', '1/20/2017', null, 'false', 'false', 'Presbyterian');

select HomeState, PartyAffiliation, count(ID) as 'Number of Presidents'
from dbo.Presidents
group by PartyAffiliation, HomeState
order by HomeState;
select * from dbo.Presidents order by HomeState asc;