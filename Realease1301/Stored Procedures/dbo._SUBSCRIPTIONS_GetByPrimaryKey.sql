SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Gets a record from the 'SUBSCRIPTIONS' table using the primary key value.
CREATE PROCEDURE [dbo].[_SUBSCRIPTIONS_GetByPrimaryKey]
	@ID int
AS
	SELECT * FROM [dbo].[SUBSCRIPTIONS] WHERE
		[ID] = @ID
GO
