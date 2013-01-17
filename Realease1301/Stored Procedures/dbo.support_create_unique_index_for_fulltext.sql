SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[support_create_unique_index_for_fulltext]
	@table nvarchar(255),
	@indexName nvarchar(255),
	@indexColumn nvarchar(255)
AS
BEGIN    
	DECLARE @sql nvarchar(4000)
	SET @sql = '
		IF EXISTS(SELECT * FROM sys.key_constraints WHERE [name]='''+@indexName+''') BEGIN
			ALTER TABLE ['+@table+'] DROP CONSTRAINT ['+@indexName+']
		END
        ALTER TABLE ['+@table+'] ADD CONSTRAINT ['+@indexName+'] UNIQUE NONCLUSTERED (['+@indexColumn+'])
	'
	EXEC(@sql)
END
GO
