SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Gets all records from the 'AllUSERSList' table.
CREATE PROCEDURE [dbo].[_AllUSERSList_GetAll]
AS
	SELECT * FROM [dbo].[AllUSERSList]
GO
