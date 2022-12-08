DELETE [dbo].[TmpDimPodlozeAtaku]
FROM [dbo].[TmpDimPodlozeAtaku] pat
	INNER JOIN [dbo].[DimPodlozeAtaku] pa
	ON pat.Kryterium1 = pa.Kryterium1 
		AND pat.Kryterium2 = pa.Kryterium2
		AND pat.Kryterium3 = pa.Kryterium3;