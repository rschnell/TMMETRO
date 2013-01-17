SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'rptSUMMARY' table.
CREATE PROCEDURE [dbo].[_rptSUMMARY_GetAll]
AS
	SELECT * FROM [dbo].[rptSUMMARY]
GO
