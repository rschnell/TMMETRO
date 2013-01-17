SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Gets all records from the 'AllUSERSTree' table.
CREATE PROCEDURE [dbo].[_AllUSERSTree_GetAll]
AS
	SELECT * FROM [dbo].[AllUSERSTree]
GO
