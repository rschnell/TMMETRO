SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'PDFDATA' table.
CREATE PROCEDURE [dbo].[_PDFDATA_Update]
	-- The rest of writeable parameters
	@TM_CASEID text,
	@TM_ATTACHMENTID text,
	@TM_USER text,
	@TM_USERID text,
	@TM_SUBID text,
	@TMSEQ text,
	@TM_TYPENO text,
	@CheckBox1 text,
	@CheckBox2 text,
	@VALUE text,
	@CURRENCY text,
	@POLICEADDRESS text,
	@TMDATEOCCURED text,
	@TMLOCATE text,
	@TMCAT2 text,
	@TMORGANIZATION text,
	@TMREFERENCE text,
	@TMDESCRIPTION text,
	@ADDITIONAL text,
	@POILASTNAME text,
	@TM_LOCATE text,
	@TM_ORGANIZATION text,
	@TM_CAT2 text,
	@TM_REFERENCE text,
	@TM_DESCRIPTION text,
	@TM_DATEOCCURED text,
	@POI_LASTNAME text,
	@POI_FIRSTNAME text,
	@POI_TITLE text,
	@BIRTHNAME text,
	@POI_BIRTHDATE text,
	@POI_PERSONADDRESS1 text,
	@POI_PERSONADDRESS2 text,
	@POI_CONTACTNO1 text,
	@POI_NATIONALITY text,
	@PROFESSION text,
	@TM_PERSONREF4 text,
	@TM_PERSONREF3 text,
	@PASSPORTDATE text,
	@CASE_REFERENCE text,
	@CASE_LOCATE text,
	@CASE_ORGANIZATION text,
	@CASE_CAT2 text,
	@CASE_DESCRIPTION text,
	@POI_PERSONREF4 text,
	@POI_PERSONREF3 text,
	@CASE_DATEOCCURED text,
	@POI_BIRTHPLACE text,
	@CASE_EVENTDATE text,
	@TMOPENDATE text,
	@TMACTIONID text,
	@PASSPORTNUMBER text,
	@NATIONALITY text,
	@POI_PERSONREF1 text,
	@POI_PERSONREF2 text,
	@CASE_EVENTDESCRIPTION text,
	@COMPANYTITLE text,
	@POI_CITY text,
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[PDFDATA] SET
		[TM_CASEID] = @TM_CASEID,
		[TM_ATTACHMENTID] = @TM_ATTACHMENTID,
		[TM_USER] = @TM_USER,
		[TM_USERID] = @TM_USERID,
		[TM_SUBID] = @TM_SUBID,
		[TMSEQ] = @TMSEQ,
		[TM_TYPENO] = @TM_TYPENO,
		[CheckBox1] = @CheckBox1,
		[CheckBox2] = @CheckBox2,
		[VALUE] = @VALUE,
		[CURRENCY] = @CURRENCY,
		[POLICEADDRESS] = @POLICEADDRESS,
		[TMDATEOCCURED] = @TMDATEOCCURED,
		[TMLOCATE] = @TMLOCATE,
		[TMCAT2] = @TMCAT2,
		[TMORGANIZATION] = @TMORGANIZATION,
		[TMREFERENCE] = @TMREFERENCE,
		[TMDESCRIPTION] = @TMDESCRIPTION,
		[ADDITIONAL] = @ADDITIONAL,
		[POILASTNAME] = @POILASTNAME,
		[TM_LOCATE] = @TM_LOCATE,
		[TM_ORGANIZATION] = @TM_ORGANIZATION,
		[TM_CAT2] = @TM_CAT2,
		[TM_REFERENCE] = @TM_REFERENCE,
		[TM_DESCRIPTION] = @TM_DESCRIPTION,
		[TM_DATEOCCURED] = @TM_DATEOCCURED,
		[POI_LASTNAME] = @POI_LASTNAME,
		[POI_FIRSTNAME] = @POI_FIRSTNAME,
		[POI_TITLE] = @POI_TITLE,
		[BIRTHNAME] = @BIRTHNAME,
		[POI_BIRTHDATE] = @POI_BIRTHDATE,
		[POI_PERSONADDRESS1] = @POI_PERSONADDRESS1,
		[POI_PERSONADDRESS2] = @POI_PERSONADDRESS2,
		[POI_CONTACTNO1] = @POI_CONTACTNO1,
		[POI_NATIONALITY] = @POI_NATIONALITY,
		[PROFESSION] = @PROFESSION,
		[TM_PERSONREF4] = @TM_PERSONREF4,
		[TM_PERSONREF3] = @TM_PERSONREF3,
		[PASSPORTDATE] = @PASSPORTDATE,
		[CASE_REFERENCE] = @CASE_REFERENCE,
		[CASE_LOCATE] = @CASE_LOCATE,
		[CASE_ORGANIZATION] = @CASE_ORGANIZATION,
		[CASE_CAT2] = @CASE_CAT2,
		[CASE_DESCRIPTION] = @CASE_DESCRIPTION,
		[POI_PERSONREF4] = @POI_PERSONREF4,
		[POI_PERSONREF3] = @POI_PERSONREF3,
		[CASE_DATEOCCURED] = @CASE_DATEOCCURED,
		[POI_BIRTHPLACE] = @POI_BIRTHPLACE,
		[CASE_EVENTDATE] = @CASE_EVENTDATE,
		[TMOPENDATE] = @TMOPENDATE,
		[TMACTIONID] = @TMACTIONID,
		[PASSPORTNUMBER] = @PASSPORTNUMBER,
		[NATIONALITY] = @NATIONALITY,
		[POI_PERSONREF1] = @POI_PERSONREF1,
		[POI_PERSONREF2] = @POI_PERSONREF2,
		[CASE_EVENTDESCRIPTION] = @CASE_EVENTDESCRIPTION,
		[COMPANYTITLE] = @COMPANYTITLE,
		[POI_CITY] = @POI_CITY
	WHERE
		[ID] = @ID
GO
