SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'TREEATTRIBUTES' table.
CREATE PROCEDURE [dbo].[_TREEATTRIBUTES_Update]
	-- The rest of writeable parameters
	@TREEID int,
	@Code nvarchar(12),
	@Description nvarchar(255),
	@Attribute1 nvarchar(255),
	@Attribute2 nvarchar(255),
	@Attribute3 nvarchar(255),
	@Attribute4 nvarchar(255),
	@Attribute5 nvarchar(255),
	@Category nvarchar(255),
	@CategoryID int,
	@ACTIVE bit,
	@SUBSCRIPTIONID int,
	-- Primary key parameters
	@ATTID int
AS
	UPDATE [dbo].[TREEATTRIBUTES] SET
		[TREEID] = @TREEID,
		[Code] = @Code,
		[Description] = @Description,
		[Attribute1] = @Attribute1,
		[Attribute2] = @Attribute2,
		[Attribute3] = @Attribute3,
		[Attribute4] = @Attribute4,
		[Attribute5] = @Attribute5,
		[Category] = @Category,
		[CategoryID] = @CategoryID,
		[ACTIVE] = @ACTIVE,
		[SUBSCRIPTIONID] = @SUBSCRIPTIONID
	WHERE
		[ATTID] = @ATTID
GO
