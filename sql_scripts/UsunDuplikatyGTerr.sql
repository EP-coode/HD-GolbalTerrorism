DELETE TmpDimGrupaTerrorystyczna
FROM TmpDimGrupaTerrorystyczna tg
	INNER JOIN DimGrupaTerrorystyczna g ON
	tg.[Name] = g.[Name]
	AND tg.GroupNameCertain = g.GroupNameCertain;