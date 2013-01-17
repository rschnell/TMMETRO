SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'SCH_Resource' table.
CREATE PROCEDURE [dbo].[_SCH_Resource_Insert]
	@ResourceName nvarchar(50),
	@ResourceDescription ntext,
	@EmailAddress nvarchar(64),
	@SUBID int,
	@IMAddress nvarchar(64),
	@Color int,
	@Status int,
	@Image image
AS
	INSERT INTO [dbo].[SCH_Resource]
	(
		[ResourceName],
		[ResourceDescription],
		[EmailAddress],
		[SUBID],
		[IMAddress],
		[Color],
		[Status],
		[Image]
	)
	VALUES
	(
		@ResourceName,
		@ResourceDescription,
		@EmailAddress,
		@SUBID,
		@IMAddress,
		@Color,
		@Status,
		@Image
	)
	SELECT @@IDENTITY
GO
