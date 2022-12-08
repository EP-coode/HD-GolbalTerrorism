DELETE [dbo].[TmpFactAtakTerrorystyczny]
FROM [dbo].[TmpFactAtakTerrorystyczny] a1
	INNER JOIN [dbo].[FactAtakTerrorystyczny] a2
	ON a1.EventId = a2.EventId ;