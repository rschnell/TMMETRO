SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Updates a record in the 'Configuration' table.
CREATE PROCEDURE [dbo].[_Configuration_Update]
	-- The rest of writeable parameters
	@Upload_component nvarchar(20),
	@Upload_img_types nvarchar(50),
	@Upload_files_types nvarchar(100),
	@Active_Directory_login bit,
	@LAN_Internet bit,
	@DNS_Domain nvarchar(100),
	@SMTP_Mail_Server nvarchar(50),
	@Attach_Entire_File bit,
	@SharedDocuments bit,
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[Configuration] SET
		[Upload_component] = @Upload_component,
		[Upload_img_types] = @Upload_img_types,
		[Upload_files_types] = @Upload_files_types,
		[Active_Directory_login] = @Active_Directory_login,
		[LAN_Internet] = @LAN_Internet,
		[DNS_Domain] = @DNS_Domain,
		[SMTP_Mail_Server] = @SMTP_Mail_Server,
		[Attach_Entire_File] = @Attach_Entire_File,
		[SharedDocuments] = @SharedDocuments
	WHERE
		[ID] = @ID
GO
