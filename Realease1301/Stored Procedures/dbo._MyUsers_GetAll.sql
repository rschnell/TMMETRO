SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'MyUsers' table.
CREATE PROCEDURE [dbo].[_MyUsers_GetAll]
AS
	SELECT * FROM [dbo].[MyUsers]
GO
