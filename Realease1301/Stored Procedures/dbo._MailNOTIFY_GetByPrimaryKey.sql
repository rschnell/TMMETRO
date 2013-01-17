SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Gets a record from the 'MailNOTIFY' table using the primary key value.
CREATE PROCEDURE [dbo].[_MailNOTIFY_GetByPrimaryKey]
	@MailNOTIFYID int
AS
	SELECT * FROM [dbo].[MailNOTIFY] WHERE
		[MailNOTIFYID] = @MailNOTIFYID
GO
