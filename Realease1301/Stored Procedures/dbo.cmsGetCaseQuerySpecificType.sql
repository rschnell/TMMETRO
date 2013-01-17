SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.cmsGetCaseQuerySpecificType @SubscriptionID INTEGER=0
AS
SET NOCOUNT ON

	SELECT 'K' AS SpecificType ,'Key Word' AS SpecificDescription
	UNION
	SELECT 'F','File Number'
	UNION
	SELECT 'C','Case Number'
	ORDER BY SpecificDescription

GO
