SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'USERSPROFILES' table.
CREATE PROCEDURE [dbo].[_USERSPROFILES_GetAll]
AS
	SELECT * FROM [dbo].[USERSPROFILES]
GO
