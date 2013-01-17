SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'SUBSCRIPTIONSEXT' table.
CREATE PROCEDURE [dbo].[_SUBSCRIPTIONSEXT_Update]
	-- The rest of writeable parameters
	@FLAG4 bit,
	@FLAG5 bit,
	@FLAG6 bit,
	@DAYS int,
	-- Primary key parameters
	@SUBSCRIPTIONID int
AS
	UPDATE [dbo].[SUBSCRIPTIONSEXT] SET
		[FLAG4] = @FLAG4,
		[FLAG5] = @FLAG5,
		[FLAG6] = @FLAG6,
		[DAYS] = @DAYS
	WHERE
		[SUBSCRIPTIONID] = @SUBSCRIPTIONID
GO
