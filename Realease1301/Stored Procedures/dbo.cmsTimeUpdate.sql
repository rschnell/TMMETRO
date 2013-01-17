SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[cmsTimeUpdate] 
(
	@ValueID		integer,
	@Time			decimal(9,3),
	@Description	nvarchar(MAX),
	@ValueDate		datetime
)
AS

SET NOCOUNT ON

UPDATE [VALUES] SET [Value] = @Time,
					[Description] = @Description,
					[ValueDate] = @ValueDate
WHERE ValueID = @ValueID

GO
