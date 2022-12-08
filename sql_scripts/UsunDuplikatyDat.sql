DELETE TmpDimData
FROM TmpDimData td
	INNER JOIN DimData d 
	ON td.Dzien = d.Dzien
	AND td.Miesiac = d.Miesiac
	AND td.Rok = d.Rok;