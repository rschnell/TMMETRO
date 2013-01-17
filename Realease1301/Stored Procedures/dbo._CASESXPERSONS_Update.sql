SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'CASESXPERSONS' table.
CREATE PROCEDURE [dbo].[_CASESXPERSONS_Update]
	-- The rest of writeable parameters
	@PERSONID int,
	@CASEID int,
	@ACTIVE int,
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[CASESXPERSONS] SET
		[PERSONID] = @PERSONID,
		[CASEID] = @CASEID,
		[ACTIVE] = @ACTIVE
	WHERE
		[ID] = @ID
GO
