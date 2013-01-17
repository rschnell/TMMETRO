SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'CUSTOMERSXUSERS' table.
CREATE PROCEDURE [dbo].[_CUSTOMERSXUSERS_Update]
	-- The rest of writeable parameters
	@CUSTOMERID int,
	@USERID int,
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[CUSTOMERSXUSERS] SET
		[CUSTOMERID] = @CUSTOMERID,
		[USERID] = @USERID
	WHERE
		[ID] = @ID
GO
