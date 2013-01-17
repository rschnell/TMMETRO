SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'ATTACHMENTS' table using the primary key value.
CREATE PROCEDURE [dbo].[_ATTACHMENTS_GetByPrimaryKey]
	@ATTACHMENTID int
AS
	SELECT * FROM [dbo].[ATTACHMENTS] WHERE
		[ATTACHMENTID] = @ATTACHMENTID
GO