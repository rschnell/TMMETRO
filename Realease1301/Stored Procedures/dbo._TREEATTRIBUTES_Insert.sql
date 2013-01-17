SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'TREEATTRIBUTES' table.
CREATE PROCEDURE [dbo].[_TREEATTRIBUTES_Insert]
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
	@SUBSCRIPTIONID int
AS
	INSERT INTO [dbo].[TREEATTRIBUTES]
	(
		[TREEID],
		[Code],
		[Description],
		[Attribute1],
		[Attribute2],
		[Attribute3],
		[Attribute4],
		[Attribute5],
		[Category],
		[CategoryID],
		[ACTIVE],
		[SUBSCRIPTIONID]
	)
	VALUES
	(
		@TREEID,
		@Code,
		@Description,
		@Attribute1,
		@Attribute2,
		@Attribute3,
		@Attribute4,
		@Attribute5,
		@Category,
		@CategoryID,
		@ACTIVE,
		@SUBSCRIPTIONID
	)
	SELECT @@IDENTITY
GO
