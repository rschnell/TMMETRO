SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets all records from the 'EVENTINVITES' table.
CREATE PROCEDURE [dbo].[_EVENTINVITES_GetAll]
AS
	SELECT * FROM [dbo].[EVENTINVITES]
GO
