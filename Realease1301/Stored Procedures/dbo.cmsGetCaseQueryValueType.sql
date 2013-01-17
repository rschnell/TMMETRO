SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.cmsGetCaseQueryValueType @SubscriptionID INTEGER=0
AS
SET NOCOUNT ON

	SELECT 'L' AS ValueType ,'Loss' AS ValueDescription
	UNION
	SELECT 'D','Damage'
	UNION
	SELECT 'R','Recovery'
	ORDER BY ValueDescription

GO
