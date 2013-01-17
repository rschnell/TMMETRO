SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'IMProviders' table.
CREATE PROCEDURE [dbo].[_IMProviders_Update]
	-- The rest of writeable parameters
	@IMCode char(10),
	@IMUserName nvarchar(50),
	@IMPassword nvarchar(50),
	@IMDescription nvarchar(50),
	@IMemail nvarchar(100),
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[IMProviders] SET
		[IMCode] = @IMCode,
		[IMUserName] = @IMUserName,
		[IMPassword] = @IMPassword,
		[IMDescription] = @IMDescription,
		[IMemail] = @IMemail
	WHERE
		[ID] = @ID
GO
