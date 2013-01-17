SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'SUBRIGHTS' table.
CREATE PROCEDURE [dbo].[_SUBRIGHTS_Insert]
	@SUBRIGHTSID int,
	@SUBID int,
	@RIGHTCODE nchar(20),
	@RIGHTTITLE nchar(30),
	@RIGHTDESCRIPTION nchar(80),
	@RIGHTVALUE1 numeric(18,0),
	@RIGHTVALUE2 numeric(18,0),
	@ACTIVE bit
AS
	INSERT INTO [dbo].[SUBRIGHTS]
	(
		[SUBRIGHTSID],
		[SUBID],
		[RIGHTCODE],
		[RIGHTTITLE],
		[RIGHTDESCRIPTION],
		[RIGHTVALUE1],
		[RIGHTVALUE2],
		[ACTIVE]
	)
	VALUES
	(
		@SUBRIGHTSID,
		@SUBID,
		@RIGHTCODE,
		@RIGHTTITLE,
		@RIGHTDESCRIPTION,
		@RIGHTVALUE1,
		@RIGHTVALUE2,
		@ACTIVE
	)
GO
