DELETE TmpDimLokalizacja
FROM TmpDimLokalizacja tl
	INNER JOIN DimLokalizacja l ON
	tl.City = l.City
	AND tl.Country = l.Country
	AND tl.Provstate = l.Provstate
	AND tl.Region = l.Region
	AND tl.DlugoscGeo = l.DlugoscGeo
	AND tl.SzerokoscGeo = l.SzerokoscGeo;