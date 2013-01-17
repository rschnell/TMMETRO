SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Inserts a new record into the 'Configuration' table.
CREATE PROCEDURE [dbo].[_Configuration_Insert]
	@Upload_component nvarchar(20),
	@Upload_img_types nvarchar(50),
	@Upload_files_types nvarchar(100),
	@Active_Directory_login bit,
	@LAN_Internet bit,
	@DNS_Domain nvarchar(100),
	@SMTP_Mail_Server nvarchar(50),
	@Attach_Entire_File bit,
	@SharedDocuments bit
AS
	INSERT INTO [dbo].[Configuration]
	(
		[Upload_component],
		[Upload_img_types],
		[Upload_files_types],
		[Active_Directory_login],
		[LAN_Internet],
		[DNS_Domain],
		[SMTP_Mail_Server],
		[Attach_Entire_File],
		[SharedDocuments]
	)
	VALUES
	(
		@Upload_component,
		@Upload_img_types,
		@Upload_files_types,
		@Active_Directory_login,
		@LAN_Internet,
		@DNS_Domain,
		@SMTP_Mail_Server,
		@Attach_Entire_File,
		@SharedDocuments
	)
	SELECT @@IDENTITY
GO
