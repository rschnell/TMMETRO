SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'SCH_Resource' table.
CREATE PROCEDURE [dbo].[_SCH_Resource_Update]
	-- The rest of writeable parameters
	@ResourceName nvarchar(50),
	@ResourceDescription ntext,
	@EmailAddress nvarchar(64),
	@SUBID int,
	@IMAddress nvarchar(64),
	@Color int,
	@Status int,
	@Image image,
	-- Primary key parameters
	@ResourceID int
AS
	UPDATE [dbo].[SCH_Resource] SET
		[ResourceName] = @ResourceName,
		[ResourceDescription] = @ResourceDescription,
		[EmailAddress] = @EmailAddress,
		[SUBID] = @SUBID,
		[IMAddress] = @IMAddress,
		[Color] = @Color,
		[Status] = @Status,
		[Image] = @Image
	WHERE
		[ResourceID] = @ResourceID
GO
