SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[support_create_fulltext_catalog]
	@name nvarchar(64) = 'Fulltext_Catalog',
	@isDefault int = 0
AS
BEGIN
	IF EXISTS(SELECT * FROM sys.fulltext_catalogs WHERE [name]=@name) RETURN
    DECLARE @sql nvarchar(4000)	
    SET @sql = 'CREATE FULLTEXT CATALOG ['+@name+'] WITH ACCENT_SENSITIVITY = OFF'
    IF (@isDefault>0) SET @sql = @sql+' AS DEFAULT';
    EXEC(@sql)
END
GO
