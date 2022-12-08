USE GlobalTerrorism;

SELECT DISTINCT LOWER(country_txt), 
	LOWER(city),
	LOWER(provstate),
	LOWER(region_txt),
	longitude, latitude
FROM [dbo].[RawData]
WHERE city is not NULL 
	AND provstate is not NULL
	AND country_txt is not NULL
	AND region_txt is not NULL
	AND longitude is not NULL
	AND latitude is not NULL;

SELECT DISTINCT iday, imonth, iyear
FROM [dbo].[RawData]
WHERE iday is not NULL 
	AND imonth is not NULL
	AND iyear is not NULL;

SELECT DISTINCT gname, guncertain1
FROM [dbo].[RawData]
WHERE gname is not NULL;

SELECT DISTINCT LOWER(weaptype1_txt),
	LOWER(weapsubtype1_txt)
FROM RawData
WHERE weaptype1_txt IS NOT NULL;

SELECT DISTINCT 
	LOWER(targsubtype1_txt), 
	LOWER(targtype1_txt),
	LOWER([natlty1_txt])
FROM [dbo].RawData
WHERE targtype1_txt is NOT NULL 
	AND [natlty1_txt] is NOT NULL;

SELECT DISTINCT crit1, crit2, crit3
FROM [dbo].RawData;

SELECT DISTINCT suicide
FROM RawData;

SELECT CAST(FLOOR([DlugoscGeo]*100) as INT) as [DlugoscGeoId],
	CAST(FLOOR([SzerokoscGeo]*100) as INT) as [SzerokoscscGeoId],
	[Country] ,
	[City],
	[Provstate],
	[Region],
	[LokalizacjaId]
FROM [dbo].[DimLokalizacja];

SELECT COUNT(*)
FROM [dbo].[RawData]
WHERE [latitude] is null OR [longitude] is null;

SELECT * 
FROM [dbo].[DimRodzajAtaku];

SELECT *
FROM [dbo].[DimRodzajAtaku];

SELECT *
FROM [FactAtakTerrorystyczny]
WHERE CelAtakuId = 87216;

SELECT *
FROM DimCelAtaku
WHERE CelAtakuId = 87216;