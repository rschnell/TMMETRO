SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'SUBSCRIPTIONS' table.
CREATE PROCEDURE [dbo].[_SUBSCRIPTIONS_Update]
	-- The rest of writeable parameters
	@SUBSCRIPTIONID int,
	@TMROLE nvarchar(50),
	@TMSUBNAME nvarchar(250),
	@ACTIVE bit,
	@DESCRIPTION ntext,
	@THEMEID int,
	@HOMEURL nchar(250),
	@SITECODE nchar(20),
	@CREATED datetime,
	@SITEID int,
	@SUBTYPE int,
	@ALIASES nvarchar(max),
	@FLAG1 bit,
	@FLAG2 bit,
	@FLAG3 bit,
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[SUBSCRIPTIONS] SET
		[SUBSCRIPTIONID] = @SUBSCRIPTIONID,
		[TMROLE] = @TMROLE,
		[TMSUBNAME] = @TMSUBNAME,
		[ACTIVE] = @ACTIVE,
		[DESCRIPTION] = @DESCRIPTION,
		[THEMEID] = @THEMEID,
		[HOMEURL] = @HOMEURL,
		[SITECODE] = @SITECODE,
		[CREATED] = @CREATED,
		[SITEID] = @SITEID,
		[SUBTYPE] = @SUBTYPE,
		[ALIASES] = @ALIASES,
		[FLAG1] = @FLAG1,
		[FLAG2] = @FLAG2,
		[FLAG3] = @FLAG3
	WHERE
		[ID] = @ID
GO
