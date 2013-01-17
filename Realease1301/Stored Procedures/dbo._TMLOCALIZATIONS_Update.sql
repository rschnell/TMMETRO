SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'TMLOCALIZATIONS' table.
CREATE PROCEDURE [dbo].[_TMLOCALIZATIONS_Update]
	-- The rest of writeable parameters
	@CODE nchar(5),
	@BASEKEY nvarchar(max),
	@LOCAL nvarchar(max),
	@UPDATED datetime,
	@CREATED datetime,
	@UPDATEDBY int,
	@RESOURCESET nvarchar(50),
	@ACTIVE bit,
	@UPDATEDBYUSER nvarchar(100),
	@LOCKED bit,
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[TMLOCALIZATIONS] SET
		[CODE] = @CODE,
		[BASEKEY] = @BASEKEY,
		[LOCAL] = @LOCAL,
		[UPDATED] = @UPDATED,
		[CREATED] = @CREATED,
		[UPDATEDBY] = @UPDATEDBY,
		[RESOURCESET] = @RESOURCESET,
		[ACTIVE] = @ACTIVE,
		[UPDATEDBYUSER] = @UPDATEDBYUSER,
		[LOCKED] = @LOCKED
	WHERE
		[ID] = @ID
GO
