SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'doss' table.
CREATE PROCEDURE [dbo].[_doss_Update]
	-- The rest of writeable parameters
	@DosIp varchar(39),
	@DosDate datetime,
	-- Primary key parameters
	@DosId int
AS
	UPDATE [dbo].[doss] SET
		[dosIp] = @DosIp,
		[dosDate] = @DosDate
	WHERE
		[dosId] = @DosId
GO
