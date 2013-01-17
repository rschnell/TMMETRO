SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'CASESXTAGS' table.
CREATE PROCEDURE [dbo].[_CASESXTAGS_Update]
	-- The rest of writeable parameters
	@TAG nvarchar(max),
	-- Primary key parameters
	@CASEID int
AS
	UPDATE [dbo].[CASESXTAGS] SET
		[TAG] = @TAG
	WHERE
		[CASEID] = @CASEID
GO
