SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Deletes all records from the 'MailNOTIFY' table.
CREATE PROCEDURE [dbo].[_MailNOTIFY_DeleteAll]
AS
	DELETE FROM [dbo].[MailNOTIFY]
GO
