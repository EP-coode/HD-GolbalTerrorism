USE GlobalTerrorism

SELECT COUNT(*) as [Bronie]
FROM DimBron;

SELECT COUNT(*) as [Cele Ataku]
FROM DimCelAtaku;

SELECT COUNT(*) as [Daty]
FROM DimData;

SELECT COUNT(*) as [Gr. Terrorystyczne]
FROM DimGrupaTerrorystyczna;

SELECT COUNT(*) as [Lokalizacje]
FROM DimLokalizacja;

SELECT COUNT(*) as [Rodzaje ataku]
FROM DimRodzajAtaku;

SELECT COUNT(*) as [Fakty]
FROM FactAtakTerrorystyczny;