SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'CABINET' table using the primary key value.
CREATE PROCEDURE [dbo].[_CABINET_DeleteByPrimaryKey]
	@CABINETID int
AS
	DELETE FROM [dbo].[CABINET] WHERE
		[CABINETID] = @CABINETID
GO
