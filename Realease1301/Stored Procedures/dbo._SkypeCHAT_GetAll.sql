SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Gets all records from the 'SkypeCHAT' table.
CREATE PROCEDURE [dbo].[_SkypeCHAT_GetAll]
AS
	SELECT * FROM [dbo].[SkypeCHAT]
GO
