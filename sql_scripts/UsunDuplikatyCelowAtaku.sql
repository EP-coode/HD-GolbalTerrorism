DELETE [dbo].[TmpDimCelAtaku]
FROM [dbo].[TmpDimCelAtaku] cat
	INNER JOIN [dbo].DimCelAtaku ca
	ON  cat.[TargetType] = ca.[TargetType]
		AND (cat.[TargetSubType] = ca.[TargetSubType]
			OR cat.TargetSubType is null and ca.TargetSubType is null)
		AND cat.[Natality] = ca.[Natality];