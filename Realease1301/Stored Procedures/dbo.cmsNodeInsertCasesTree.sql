SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[cmsNodeInsertCasesTree] 
(
	@TREEID Integer,
	@CategoryID integer,
	@Active 	bit = true,
	@Nodename	nvarchar(50) ,
	@NodeValue	integer ,
	@Default    bit =false,
	@INSERTEDID	integer  OUTPUT,
	@LocalID	integer = 0
)
AS

SET NOCOUNT ON

DECLARE @Error Integer
DECLARE @TREERN integer
DECLARE @TREELN as Integer
SET @Error = 0

IF LEN(@NodeName) = 0
BEGIN
	SET @Error = 113 -- ERROR: NodeNamee required
END

IF LEN(@TreeID) = 0
BEGIN
	SET @Error = 113 -- ERROR: NodeNamee required
END

IF LEN(@CategoryID) = 0
BEGIN
	SET @Error = 113 -- ERROR: NodeNamee required
END

IF @Error = 0
BEGIN
-- http://www.wallpaperama.com/forums/mptt-modified-pre-order-tree-transversal-php-tree-menu-script-t5713.html
-- Find the left and right of this node to insert underneatvh
SET @TREELN=(SELECT TREELN
            FROM  CASESTREE
            WHERE (TREEID = @TREEID) AND  CATEGORYID=@CATEGORYID )
SET @TREERN=(SELECT TREERN
            FROM  CASESTREE
            WHERE (TREEID = @TREEID) AND CATEGORYID=@CATEGORYID)
-- Make room in tree
UPDATE CASESTREE
SET       TREERN = TREERN + 2
WHERE (TREERN > @TREERN - 1) AND  CATEGORYID=@CATEGORYID and ACTIVE=1
UPDATE CASESTREE
SET       TREELN = TREELN + 2
WHERE (TREELN > @TREERN - 1) AND  CATEGORYID=@CATEGORYID and ACTIVE=1
-- Insert

INSERT INTO CASESTREE
               (TREELN, TREERN, ACTIVE, [DEFAULT], CATEGORYID,NODENAME,NODEVALUE)
VALUES (@TREERN,@TREERN + 1,@Active,@Default,@CategoryID,@NODENAME,@NODEVALUE)
SET @INSERTEDID = SCOPE_IDENTITY()
END

SELECT ErrorDescription FROM ERRORS WHERE ErrorID = @Error AND LocalID = @LocalID

GO
