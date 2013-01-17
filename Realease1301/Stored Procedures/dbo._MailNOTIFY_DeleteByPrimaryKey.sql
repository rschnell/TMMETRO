SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes a record from the 'MailNOTIFY' table using the primary key value.
CREATE PROCEDURE [dbo].[_MailNOTIFY_DeleteByPrimaryKey]
	@MailNOTIFYID int
AS
	DELETE FROM [dbo].[MailNOTIFY] WHERE
		[MailNOTIFYID] = @MailNOTIFYID
GO
