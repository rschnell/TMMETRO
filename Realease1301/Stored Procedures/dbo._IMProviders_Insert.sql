SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'IMProviders' table.
CREATE PROCEDURE [dbo].[_IMProviders_Insert]
	@IMCode char(10),
	@IMUserName nvarchar(50),
	@IMPassword nvarchar(50),
	@IMDescription nvarchar(50),
	@IMemail nvarchar(100)
AS
	INSERT INTO [dbo].[IMProviders]
	(
		[IMCode],
		[IMUserName],
		[IMPassword],
		[IMDescription],
		[IMemail]
	)
	VALUES
	(
		@IMCode,
		@IMUserName,
		@IMPassword,
		@IMDescription,
		@IMemail
	)
	SELECT @@IDENTITY
GO
