SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'CASESTREETERMS' table.
CREATE PROCEDURE [dbo].[_CASESTREETERMS_Insert]
	@TREEID int,
	@CATEGORYID int,
	@UPDATEBYID int,
	@UPDATEDBY nchar(30),
	@LASTUPDATED datetime,
	@BASETERM nvarchar(max),
	@TEXT1 nvarchar(max),
	@TEXT2 nvarchar(max),
	@TEXT3 nvarchar(max),
	@TEXT4 nvarchar(max),
	@TEXT5 nvarchar(max),
	@TEXT6 nvarchar(max),
	@TEXT7 nvarchar(max),
	@TEXT8 nvarchar(max),
	@ENUSTR nvarchar(max),
	@DEDETR nvarchar(max),
	@THTHTR nvarchar(max),
	@ENUSTP nvarchar(max),
	@DEDETP nvarchar(max),
	@DEDETPTIP nvarchar(50),
	@THTHTP nvarchar(max),
	@EnUSTPTIP nvarchar(max),
	@ENGBTP nvarchar(max),
	@ENGBTPTIP nvarchar(max),
	@THTHTPTIP nvarchar(max),
	@NLNLTP nvarchar(max),
	@NLNLTPTIP nvarchar(max),
	@TRTRTP nvarchar(50),
	@TRTRTPTIP nvarchar(50),
	@GBGBTP nvarchar(max),
	@GBGBTPTIP nvarchar(max),
	@HEILTP nvarchar(max),
	@HEILTPTIP nvarchar(max),
	@AREGTP nvarchar(max),
	@AREGTPTIP nvarchar(max),
	@ZHCNTP nvarchar(max),
	@ZHCNTPTIP nvarchar(max),
	@VIVNTP nvarchar(max),
	@VIVNTPTIP nvarchar(max),
	@JAJPTP nvarchar(max),
	@JAJPTPTIP nvarchar(max),
	@ENNLTP nvarchar(max),
	@ENNLTPTIP nvarchar(max),
	@JAJATP nvarchar(max),
	@JAJATPTIP nvarchar(max),
	@ENENTP nvarchar(max),
	@ENENTPTIP nvarchar(max),
	@FRFRTP nvarchar(max),
	@FRFRTPTIP nvarchar(max)
AS
	INSERT INTO [dbo].[CASESTREETERMS]
	(
		[TREEID],
		[CATEGORYID],
		[UPDATEBYID],
		[UPDATEDBY],
		[LASTUPDATED],
		[BASETERM],
		[TEXT1],
		[TEXT2],
		[TEXT3],
		[TEXT4],
		[TEXT5],
		[TEXT6],
		[TEXT7],
		[TEXT8],
		[ENUSTR],
		[DEDETR],
		[THTHTR],
		[ENUSTP],
		[DEDETP],
		[DEDETPTIP],
		[THTHTP],
		[enUSTPTIP],
		[ENGBTP],
		[ENGBTPTIP],
		[THTHTPTIP],
		[NLNLTP],
		[NLNLTPTIP],
		[TRTRTP],
		[TRTRTPTIP],
		[GBGBTP],
		[GBGBTPTIP],
		[HEILTP],
		[HEILTPTIP],
		[AREGTP],
		[AREGTPTIP],
		[ZHCNTP],
		[ZHCNTPTIP],
		[VIVNTP],
		[VIVNTPTIP],
		[JAJPTP],
		[JAJPTPTIP],
		[ENNLTP],
		[ENNLTPTIP],
		[JAJATP],
		[JAJATPTIP],
		[ENENTP],
		[ENENTPTIP],
		[FRFRTP],
		[FRFRTPTIP]
	)
	VALUES
	(
		@TREEID,
		@CATEGORYID,
		@UPDATEBYID,
		@UPDATEDBY,
		@LASTUPDATED,
		@BASETERM,
		@TEXT1,
		@TEXT2,
		@TEXT3,
		@TEXT4,
		@TEXT5,
		@TEXT6,
		@TEXT7,
		@TEXT8,
		@ENUSTR,
		@DEDETR,
		@THTHTR,
		@ENUSTP,
		@DEDETP,
		@DEDETPTIP,
		@THTHTP,
		@EnUSTPTIP,
		@ENGBTP,
		@ENGBTPTIP,
		@THTHTPTIP,
		@NLNLTP,
		@NLNLTPTIP,
		@TRTRTP,
		@TRTRTPTIP,
		@GBGBTP,
		@GBGBTPTIP,
		@HEILTP,
		@HEILTPTIP,
		@AREGTP,
		@AREGTPTIP,
		@ZHCNTP,
		@ZHCNTPTIP,
		@VIVNTP,
		@VIVNTPTIP,
		@JAJPTP,
		@JAJPTPTIP,
		@ENNLTP,
		@ENNLTPTIP,
		@JAJATP,
		@JAJATPTIP,
		@ENENTP,
		@ENENTPTIP,
		@FRFRTP,
		@FRFRTPTIP
	)
	SELECT @@IDENTITY
GO
