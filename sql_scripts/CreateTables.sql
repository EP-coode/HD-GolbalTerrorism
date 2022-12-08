USE GlobalTerrorism;

CREATE TABLE DimData(
	DataId int IDENTITY(1,1) NOT NULL, 
	Dzien tinyint NOT NULL, 
	Miesiac tinyint NOT NULL,
	Rok smallint NOT NULL,

	CONSTRAINT PK_DimData PRIMARY KEY (DataId)
);

CREATE TABLE DimBron(
	BronId int IDENTITY(1,1) NOT NULL,
	TypBroni nvarchar(128) NOT NULL,
	PodTypBroni nvarchar(64) NULL, -- 11% NULL

	CONSTRAINT PK_DimBron PRIMARY KEY (BronId)
);

CREATE TABLE DimCelAtaku (
	CelAtakuId int IDENTITY(1,1) NOT NULL,
	Natality nvarchar(64) NOT NULL,
	TargetType nvarchar(64) NOT NULL, -- 
	TargetSubType nvarchar(128) NULL, -- 5% NULL

	CONSTRAINT PK_DimCelAtaku PRIMARY KEY (CelAtakuId)
);

CREATE TABLE DimGrupaTerrorystyczna (
	GrupaTerrorystycznaId int IDENTITY(1,1) NOT NULL,
	[Name] nvarchar(128) NOT NULL,
	GroupNameCertain bit NOT NULL, -- 1%< NULL

	CONSTRAINT PK_DimGrupaTerrorystyczna PRIMARY KEY (GrupaTerrorystycznaId)
);

CREATE TABLE DimLokalizacja (
	LokalizacjaId int IDENTITY(1,1) NOT NULL,
	Country nvarchar(64) NOT NULL,
	City nvarchar(128) NOT NULL, -- 1% < NULL
	Provstate nvarchar(64) NOT NULL, -- 1% < NULL
	Region nvarchar(32) NOT NULL,
	DlugoscGeo float NOT NULL, -- 2.5% NULL
	SzerokoscGeo float NOT NULL, -- 2.5% NULL

	CONSTRAINT PK_DimLokalizacja PRIMARY KEY (LokalizacjaId)
);

CREATE TABLE DimRodzajAtaku(
	RodzajAtakuId int IDENTITY(1,1) NOT NULL,
	Samobojstwo bit NOT NULL,
	OrganizowanyPrzezJednaOsobe bit NOT NULL,
	ZadanyOkup bit NULL,
	Zakladnicy bit NOT NULL,
	TypAtaku nvarchar(128) NOT NULL

	CONSTRAINT PK_DimRodzajAtaku PRIMARY KEY (RodzajAtakuId)
);

CREATE TABLE FactAtakTerrorystyczny(
	FactAtakTerrorystycznyId int IDENTITY(1,1) NOT NULL,
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

	CONSTRAINT PK_FactAtakTerrorystyczny PRIMARY KEY (FactAtakTerrorystycznyId),
	CONSTRAINT FK_FactAtakTerrorystyczny_DimData FOREIGN KEY (DataId)
		REFERENCES DimData (DataId),
	CONSTRAINT FK_FactAtakTerrorystyczny_DimBron FOREIGN KEY (BronId)
		REFERENCES DimBron (BronId),
	CONSTRAINT FK_FactAtakTerrorystyczny_DimCelAtaku FOREIGN KEY (CelAtakuId)
		REFERENCES DimCelAtaku (CelAtakuId),
	CONSTRAINT FK_FactAtakTerrorystyczny_DimGrupaTerrorystyczna FOREIGN KEY (GrupaTerrorystycznaId)
		REFERENCES DimGrupaTerrorystyczna (GrupaTerrorystycznaId),
	CONSTRAINT FK_FactAtakTerrorystyczny_DimLokalizacja FOREIGN KEY (LokalizacjaId)
		REFERENCES DimLokalizacja (LokalizacjaId),
	CONSTRAINT FK_FactAtakTerrorystyczny_DimRodzajAtaku FOREIGN KEY (RodzajAtakuId)
		REFERENCES DimRodzajAtaku (RodzajAtakuId),
);
