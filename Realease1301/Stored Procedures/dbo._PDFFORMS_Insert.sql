SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'PDFFORMS' table.
CREATE PROCEDURE [dbo].[_PDFFORMS_Insert]
	@CASEID int,
	@ACTIONID int,
	@ATTACHMENTID int,
	@CABINETID int,
	@FDF nvarchar(max),
	@PDFFIELDS nvarchar(max),
	@LASTUPDATED datetime,
	@UPDATEDBYUSERID int,
	@UPDATEDBY nvarchar(50),
	@DATECREATED datetime,
	@CREATEDBYUSERID int,
	@CREATEDBY nvarchar(50),
	@ACTIVE bit,
	@TYPENO int,
	@SEQNO int,
	@REVNO int
AS
	INSERT INTO [dbo].[PDFFORMS]
	(
		[CASEID],
		[ACTIONID],
		[ATTACHMENTID],
		[CABINETID],
		[FDF],
		[PDFFIELDS],
		[LASTUPDATED],
		[UPDATEDBYUSERID],
		[UPDATEDBY],
		[DATECREATED],
		[CREATEDBYUSERID],
		[CREATEDBY],
		[ACTIVE],
		[TYPENO],
		[SEQNO],
		[REVNO]
	)
	VALUES
	(
		@CASEID,
		@ACTIONID,
		@ATTACHMENTID,
		@CABINETID,
		@FDF,
		@PDFFIELDS,
		@LASTUPDATED,
		@UPDATEDBYUSERID,
		@UPDATEDBY,
		@DATECREATED,
		@CREATEDBYUSERID,
		@CREATEDBY,
		@ACTIVE,
		@TYPENO,
		@SEQNO,
		@REVNO
	)
	SELECT @@IDENTITY
GO
