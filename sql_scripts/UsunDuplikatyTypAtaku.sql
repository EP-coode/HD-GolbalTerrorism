DELETE [TmpDimRodzajAtaku]
FROM [TmpDimRodzajAtaku] rat
	INNER JOIN [DimRodzajAtaku] ar 
	ON rat.Samobojstwo = ar.Samobojstwo
	AND rat.OrganizowanyPrzezJednaOsobe = ar.OrganizowanyPrzezJednaOsobe
	AND (
		rat.ZadanyOkup = ar.ZadanyOkup OR
		(rat.ZadanyOkup is NULL and ar.ZadanyOkup is NULL)
		)
	AND rat.Zakladnicy = ar.Zakladnicy
	AND rat.TypAtaku = ar.TypAtaku;