SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[support_create_fulltext_index]
	@table nvarchar(64),
	@columns nvarchar(2000),
	@key_column nvarchar(255),
	@key_index nvarchar(255) = '',
	@catalog nvarchar(255) = 'Fulltext_Catalog',
	@lang nvarchar(255) = 'Arabic'
AS
BEGIN
	IF (@key_index='') OR (@key_index IS NULL) BEGIN
		SET @key_index = 'fulltext_key_for_'+@table
	END

	IF EXISTS(SELECT * FROM sys.fulltext_indexes AS idx WHERE object_name(idx.[object_id])=@table) BEGIN
		EXEC('DROP FULLTEXT INDEX ON ['+@table+']')
	END

	EXEC [support_create_unique_index_for_fulltext] @table, @key_index, @key_column

	DECLARE @sql nvarchar(4000)
	DECLARE @columns_sql nvarchar(4000)
	SET @columns = LTRIM(@columns)
	SET @columns = RTRIM(@columns)
	WHILE (PATINDEX('%  %',@columns)<>0)
	BEGIN
		SET @columns = REPLACE(@columns,'  ',' ');
	END
	WHILE (PATINDEX('%, %',@columns)<>0)
	BEGIN
		SET @columns = REPLACE(@columns,', ',',');
	END
	WHILE (PATINDEX('% ,%',@columns)<>0)
	BEGIN
		SET @columns = REPLACE(@columns,' ,',',');
	END
	IF @columns='' RETURN
          
	SET @columns_sql = '[' + REPLACE(@columns,',','] LANGUAGE '''+@lang+''', [') +  '] LANGUAGE '''+@lang+''''

	SET @sql = '
		CREATE FULLTEXT INDEX ON  ['+@table+'] ('+@columns_sql+')
			KEY INDEX ['+@key_index+'] 
			ON ['+@catalog+'] 
			WITH CHANGE_TRACKING AUTO
	'
	EXEC(@sql)
END
GO
