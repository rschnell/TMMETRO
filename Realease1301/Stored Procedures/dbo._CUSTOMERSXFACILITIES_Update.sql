SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'CUSTOMERSXFACILITIES' table.
CREATE PROCEDURE [dbo].[_CUSTOMERSXFACILITIES_Update]
	-- The rest of writeable parameters
	@CUSTOMERID int,
	@TREEID int,
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[CUSTOMERSXFACILITIES] SET
		[CUSTOMERID] = @CUSTOMERID,
		[TREEID] = @TREEID
	WHERE
		[ID] = @ID
GO
