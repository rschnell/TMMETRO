SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[cmsMoveBranchCasesTreeByNodeValue] 
(
	@CategoryID integer,
	@SourceNodeValue integer,
	@TargetNodeValue integer

)
AS

SET NOCOUNT ON

DECLARE @Error Integer
DECLARE @RNS integer
DECLARE @LNS  Integer
DECLARE @RNT integer
DECLARE @LNT  Integer
SET @Error = 0


IF LEN(@SourceNodeValue) = 0
BEGIN
	SET @Error = 113 -- ERROR: NodeNamee required
END

IF LEN(@TargetNodeValue) = 0
BEGIN
	SET @Error = 114 -- ERROR: NodeNamee required
END

IF LEN(@CategoryID) = 0
BEGIN
	SET @Error = 115 -- ERROR: NodeNamee required
END

IF @Error = 0
BEGIN

SET @LNS=(SELECT TREELN AS LNS
            FROM  CASESTREE
            WHERE NODEVALUE = @SOURCENODEVALUE AND CATEGORYID=@CATEGORYID)
SET @RNS=(SELECT TREERN AS RNS
            FROM  CASESTREE
            WHERE NODEVALUE = @SOURCENODEVALUE  AND CATEGORYID=@CATEGORYID)
-- Mark the source branch as negative
--
UPDATE CASESTREE
SET       TREERN= -TREERN
WHERE TREERN <= @RNS AND TREELN>=@LNS  AND CATEGORYID=@CATEGORYID
UPDATE CASESTREE
SET       TREELN= -TREELN
WHERE TREERN <= @RNS AND TREELN>=@LNS  AND CATEGORYID=@CATEGORYID 
-- Remove the source branch by "counting it out based on its size
--
UPDATE CASESTREE
SET       TREELN = TREELN - (@RNS-@LNS+1)
WHERE (TREELN > @LNS)  AND CATEGORYID=@CATEGORYID
UPDATE CASESTREE
SET       TREERN = TREERN - (@RNS-@LNS+1)
WHERE (TREERN > @RNS)  AND CATEGORYID=@CATEGORYID
-- Get the target branch node
--
SET @LNT=(SELECT TREELN AS LNT
            FROM  CASESTREE
            WHERE NODEVALUE = @TARGETNODEVALUE  AND CATEGORYID=@CATEGORYID)
SET @RNT=(SELECT TREERN AS RNT
            FROM  CASESTREE
            WHERE NODEVALUE = @TARGETNODEVALUE  AND CATEGORYID=@CATEGORYID)
-- open space in the target branch by increasing the numbers by the same amount
-- if its greater thasn or equal the target right number
UPDATE CASESTREE
SET       TREELN = TREELN + (@RNS-@LNS+1)
WHERE (TREELN >= @RNT)  AND CATEGORYID=@CATEGORYID
UPDATE CASESTREE
SET       TREERN = TREERN + (@RNS-@LNS+1)
WHERE (TREERN >= @RNT)  AND CATEGORYID=@CATEGORYID


-- Put the negative numbers into the open space
-- using the size of the gap between them and mote to change back to positive
UPDATE CASESTREE
SET       TREELN = (-TREELN) + (@RNT-@RNS)+1
WHERE (TREELN <0) AND CATEGORYID=@CATEGORYID
UPDATE CASESTREE
SET       TREERN = (-TREERN) + (@RNT-@RNS)+1
WHERE (TREERN <0) AND CATEGORYID=@CATEGORYID
END
SELECT ErrorDescription FROM ERRORS WHERE ErrorID = @Error 



GO
