SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'REFERENCES' table.
CREATE PROCEDURE [dbo].[_REFERENCES_Update]
	-- The rest of writeable parameters
	@REFERENCE nvarchar(50),
	@REFTYPE int,
	@PERSON int,
	@CASEID int,
	-- Primary key parameters
	@REFID int
AS
	UPDATE [dbo].[REFERENCES] SET
		[REFERENCE] = @REFERENCE,
		[REFTYPE] = @REFTYPE,
		[PERSON] = @PERSON,
		[CASEID] = @CASEID
	WHERE
		[REFID] = @REFID
GO
