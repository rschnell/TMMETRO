SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'CABINET' table using the primary key value.
CREATE PROCEDURE [dbo].[_CABINET_GetByPrimaryKey]
	@CABINETID int
AS
	SELECT * FROM [dbo].[CABINET] WHERE
		[CABINETID] = @CABINETID
GO
