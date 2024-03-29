SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Inserts a new record into the 'CONFIGURATIONS' table.
CREATE PROCEDURE [dbo].[_CONFIGURATIONS_Insert]
	@DESCRIPTION nvarchar(max),
	@ONOFF int,
	@VALUE1 numeric(18,2),
	@VALUE2 numeric(18,2),
	@CONTROLID nvarchar(50),
	@NUMBERFORMAT nvarchar(50),
	@DATEFORMAT1 nvarchar(50),
	@CURRENCYSYMBOL nchar(3),
	@SUBSCRIPTIONID int
AS
	INSERT INTO [dbo].[CONFIGURATIONS]
	(
		[DESCRIPTION],
		[ONOFF],
		[VALUE1],
		[VALUE2],
		[CONTROLID],
		[NUMBERFORMAT],
		[DATEFORMAT1],
		[CURRENCYSYMBOL],
		[SUBSCRIPTIONID]
	)
	VALUES
	(
		@DESCRIPTION,
		@ONOFF,
		@VALUE1,
		@VALUE2,
		@CONTROLID,
		@NUMBERFORMAT,
		@DATEFORMAT1,
		@CURRENCYSYMBOL,
		@SUBSCRIPTIONID
	)
	SELECT @@IDENTITY
GO
