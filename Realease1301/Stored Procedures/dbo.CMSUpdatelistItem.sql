SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[cmsUpdateListItem] 
(
	@Checked 	bit = false,
	@Category	nvarchar(100) = '',
	@Reference	nvarchar(100) = '',
	@Title		nvarchar(100) = '',
	@Comment	nvarchar(MAX) = '',
	@Order      integer = 0,
	@ListId     integer = 0,
	@LocalID	integer = 0
)
AS

SET NOCOUNT ON

DECLARE @Error Integer
SET @Error = 0

IF ISNULL((SELECT ListID FROM LISTS WHERE ListID = @ListID),0) = 0
BEGIN
	SET @Error = 101 -- ERROR: Unknown/invalid list item
END

IF LEN(@Title) = 0
BEGIN
	SET @Error = 113 -- ERROR: Title required
END

IF @Error = 0
BEGIN
	UPDATE LISTS SET		LISTS.CHECKED = @Checked,
							LISTS.CATEGORY = @Category,
							LISTS.REFERENCE = @Reference,
							LISTS.TITLE = @Title,
							LISTS.COMMENT = @Comment,
							LISTS.[ORDER] = @Order
					WHERE	LISTS.LISTID = @LISTID

END

SELECT ErrorDescription FROM ERRORS WHERE ErrorID = @Error AND LocalID = @LocalID
GO
