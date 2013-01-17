SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[cmsNodeDeleteCasesTree] 
(
	@CATEGORYID AS INTEGER,
	@TREEID as integer,
	@LocalID	integer = 0
)
AS

SET NOCOUNT ON

DECLARE @Error Integer
DECLARE @TREERN integer
DECLARE @TREELN as Integer
SET @Error = 0

IF LEN(@TREEID) = 0
BEGIN
	SET @Error = 113 -- ERROR: NodeNamee required
END

IF @Error = 0
BEGIN
-- http://www.wallpaperama.com/forums/mptt-modified-pre-order-tree-transversal-php-tree-menu-script-t5713.html
-- Remove room in tree and delete the whole branch
SET @TREELN=(SELECT TREELN
            FROM  CASESTREE
            WHERE (TREEID = @TREEID))
            -- Cannot delete top node, must be created manually
IF @TreeLN >1
            BEGIN
SET @TREERN=(SELECT TREERN
            FROM  CASESTREE
            WHERE (TREEID = @TREEID))
UPDATE CASESTREE
SET       TREERN = TREERN -((@TREERN-@TREELN)+1)
WHERE (TREERN > @TREERN ) AND CATEGORYID=@CATEGORYID and ACTIVE=1
UPDATE CASESTREE
SET       TREELN = TREELN -((@TREERN-@TREELN)+1)
WHERE (TREELN > @TREELN) AND CATEGORYID = @CATEGORYID and ACTIVE=1
-- Soft Delete
UPDATE CASESTREE
SET       ACTIVE = 0
WHERE (TREEID = @TREEID)
END
               
END

SELECT ErrorDescription FROM ERRORS WHERE ErrorID = @Error AND LocalID = @LocalID


GO
