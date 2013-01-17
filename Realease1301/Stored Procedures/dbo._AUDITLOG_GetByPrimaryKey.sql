SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'AUDITLOG' table using the primary key value.
CREATE PROCEDURE [dbo].[_AUDITLOG_GetByPrimaryKey]
	@Id uniqueidentifier
AS
	SELECT * FROM [dbo].[AUDITLOG] WHERE
		[id] = @Id
GO
