SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'REPORT_CATALOG' table.
CREATE PROCEDURE [dbo].[_REPORT_CATALOG_Insert]
	@ItemID uniqueidentifier,
	@Path nvarchar(425),
	@Name nvarchar(425),
	@ParentID uniqueidentifier,
	@Type int,
	@Content image,
	@Intermediate uniqueidentifier,
	@SnapshotDataID uniqueidentifier,
	@LinkSourceID uniqueidentifier,
	@Property ntext,
	@Description nvarchar(512),
	@Hidden bit,
	@CreatedByID uniqueidentifier,
	@CreationDate datetime,
	@ModifiedByID uniqueidentifier,
	@ModifiedDate datetime,
	@MimeType nvarchar(260),
	@SnapshotLimit int,
	@Parameter ntext,
	@PolicyID uniqueidentifier,
	@PolicyRoot bit,
	@ExecutionFlag int,
	@ExecutionTime datetime
AS
	INSERT INTO [dbo].[REPORT_CATALOG]
	(
		[ItemID],
		[Path],
		[Name],
		[ParentID],
		[Type],
		[Content],
		[Intermediate],
		[SnapshotDataID],
		[LinkSourceID],
		[Property],
		[Description],
		[Hidden],
		[CreatedByID],
		[CreationDate],
		[ModifiedByID],
		[ModifiedDate],
		[MimeType],
		[SnapshotLimit],
		[Parameter],
		[PolicyID],
		[PolicyRoot],
		[ExecutionFlag],
		[ExecutionTime]
	)
	VALUES
	(
		@ItemID,
		@Path,
		@Name,
		@ParentID,
		@Type,
		@Content,
		@Intermediate,
		@SnapshotDataID,
		@LinkSourceID,
		@Property,
		@Description,
		@Hidden,
		@CreatedByID,
		@CreationDate,
		@ModifiedByID,
		@ModifiedDate,
		@MimeType,
		@SnapshotLimit,
		@Parameter,
		@PolicyID,
		@PolicyRoot,
		@ExecutionFlag,
		@ExecutionTime
	)
GO
