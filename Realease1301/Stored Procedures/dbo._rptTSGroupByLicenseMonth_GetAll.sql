SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'rptTSGroupByLicenseMonth' table.
CREATE PROCEDURE [dbo].[_rptTSGroupByLicenseMonth_GetAll]
AS
	SELECT * FROM [dbo].[rptTSGroupByLicenseMonth]
GO
