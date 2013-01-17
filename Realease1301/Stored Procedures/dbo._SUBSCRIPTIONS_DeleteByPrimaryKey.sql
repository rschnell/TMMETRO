SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Deletes a record from the 'SUBSCRIPTIONS' table using the primary key value.
CREATE PROCEDURE [dbo].[_SUBSCRIPTIONS_DeleteByPrimaryKey]
	@ID int
AS
	DELETE FROM [dbo].[SUBSCRIPTIONS] WHERE
		[ID] = @ID
GO
