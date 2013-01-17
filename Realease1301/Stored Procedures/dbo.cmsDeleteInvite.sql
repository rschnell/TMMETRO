SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Daniel Cooper
-- Create date: 17/7/2007
-- Description:	Deletes a row from the pendingInvite table, indexed by the security code
-- =============================================
CREATE PROCEDURE [dbo].[cmsDeleteInvite] 
	-- Add the parameters for the stored procedure here
	@Email varchar(50),
	@Password varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM ALIENINVITES WHERE Email = @Email and Password=@Password
END

GO
