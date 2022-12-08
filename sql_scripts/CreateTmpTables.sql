USE GlobalTerrorism;

CREATE TABLE TmpDimData(
	DataId int IDENTITY(1,1) NOT NULL, 
	Dzien tinyint NOT NULL, 
	Miesiac tinyint NOT NULL,
	Rok smallint NOT NULL,

	CONSTRAINT PK_TmpDimData PRIMARY KEY (DataId)
);


CREATE TABLE TmpDimBron(
	BronId int IDENTITY(1,1) NOT NULL,
	TypBroni nvarchar(128) NOT NULL,
	PodTypBroni nvarchar(64) NULL, -- 11% NULL

	CONSTRAINT PK_TmpDimBron PRIMARY KEY (BronId)
);


CREATE TABLE TmpDimCelAtaku (
	CelAtakuId int IDENTITY(1,1) NOT NULL,
	Natality nvarchar(64) NOT NULL,
	TargetType nvarchar(64) NOT NULL, 
	TargetSubType nvarchar(128) NULL, -- 5% NULL

	CONSTRAINT PK_TmpDimCelAtaku PRIMARY KEY (CelAtakuId)
);

CREATE TABLE TmpDimGrupaTerrorystyczna (
	GrupaTerrorystycznaId int IDENTITY(1,1) NOT NULL,
	[Name] nvarchar(128) NOT NULL,
	GroupNameCertain bit NOT NULL, -- 1%< NULL

	CONSTRAINT PK_TmpDimGrupaTerrorystyczna PRIMARY KEY (GrupaTerrorystycznaId)
);


CREATE TABLE TmpDimLokalizacja (
	LokalizacjaId int IDENTITY(1,1) NOT NULL,
	Country nvarchar(64) NOT NULL,
	City nvarchar(128) NOT NULL, -- 1% < NULL
	Provstate nvarchar(64) NOT NULL, -- 1% < NULL
	Region nvarchar(32) NOT NULL,
	DlugoscGeo float NOT NULL, -- 2.5% NULL
	SzerokoscGeo float NOT NULL, -- 2.5% NULL

	CONSTRAINT PK_TmpDimLokalizacja PRIMARY KEY (LokalizacjaId)
);


CREATE TABLE TmpDimRodzajAtaku(
	RodzajAtakuId int IDENTITY(1,1) NOT NULL,
	Samobojstwo bit NOT NULL,
	OrganizowanyPrzezJednaOsobe bit NOT NULL,
	ZadanyOkup bit NULL,
	Zakladnicy bit NOT NULL,
	TypAtaku nvarchar(128) NOT NULL

	CONSTRAINT PK_TmpDimRodzajAtaku PRIMARY KEY (RodzajAtakuId)
);


CREATE TABLE TmpFactAtakTerrorystyczny(
	FactAtakTerrorystycznyId int IDENTITY(1,1)  NOT NULL,
	EventId bigint NOT NULL,
	Rannych int NOT NULL, -- 9% NULL
	Zabitych int NOT NULL, -- 5% NULL
	RannychTerrorystow int NULL, -- 38% NULL
	ZabitychTerrorystow int NULL, -- 36% NULL
	SukcessAtaku bit NULL, -- 57% NULL 
	WartoscUszkodzonegoMienia float NULL, -- 78 % NULL

	DataId int NOT NULL,
	BronId int NOT NULL,
	CelAtakuId int NOT NULL,
	GrupaTerrorystycznaId int NOT NULL,
	LokalizacjaId int NOT NULL,
	RodzajAtakuId int NOT NULL,

	CONSTRAINT PK_TmpFactAtakTerrorystyczny PRIMARY KEY (FactAtakTerrorystycznyId),
);
