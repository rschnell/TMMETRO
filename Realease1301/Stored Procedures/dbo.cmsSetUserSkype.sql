SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Daniel Cooper
-- Create date: 26/6/2007
-- Description:	Sets a users Skype Handle, given their username
-- =============================================
CREATE PROCEDURE [dbo].[cmsSetUserSkype] 
	-- Add the parameters for the stored procedure here
	@userName varchar(50), 
	@skypeHandle varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE USERS SET SkypeHandle = @skypeHandle WHERE DNNName = @userName
END

GO
