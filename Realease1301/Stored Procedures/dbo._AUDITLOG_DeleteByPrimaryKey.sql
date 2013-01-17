SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'AUDITLOG' table using the primary key value.
CREATE PROCEDURE [dbo].[_AUDITLOG_DeleteByPrimaryKey]
	@Id uniqueidentifier
AS
	DELETE FROM [dbo].[AUDITLOG] WHERE
		[id] = @Id
GO
