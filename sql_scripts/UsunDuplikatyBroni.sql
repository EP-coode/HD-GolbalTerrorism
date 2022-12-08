DELETE TmpDimBron
FROM TmpDimBron tb
	INNER JOIN DimBron b ON
	(tb.PodTypBroni = b.PodTypBroni 
	or tb.PodTypBroni is NULL AND b.PodTypBroni is NULL)
	AND tb.TypBroni = tb.TypBroni;