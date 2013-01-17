SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'LEDGERVALUES' table using the primary key value.
CREATE PROCEDURE [dbo].[_LEDGERVALUES_DeleteByPrimaryKey]
	@VALUEID int
AS
	DELETE FROM [dbo].[LEDGERVALUES] WHERE
		[VALUEID] = @VALUEID
GO
