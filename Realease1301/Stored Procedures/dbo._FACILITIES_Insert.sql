SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'FACILITIES' table.
CREATE PROCEDURE [dbo].[_FACILITIES_Insert]
	@COUNTRY nvarchar(2),
	@COMPANY nvarchar(30),
	@COMPANYCODE nvarchar(50),
	@STREET nvarchar(120),
	@LONGNAME nvarchar(120),
	@CODE nvarchar(10),
	@STORENAME nvarchar(80),
	@CITY nvarchar(50),
	@POSTCODE nvarchar(10),
	@TYPE nvarchar(1),
	@X numeric(15,12),
	@Y numeric(15,12),
	@DATECREATED datetime,
	@DATEUPDATED datetime,
	@NOTE nvarchar(50),
	@SHORTCODE nvarchar(4)
AS
	INSERT INTO [dbo].[FACILITIES]
	(
		[COUNTRY],
		[COMPANY],
		[COMPANYCODE],
		[STREET],
		[LONGNAME],
		[CODE],
		[STORENAME],
		[CITY],
		[POSTCODE],
		[TYPE],
		[X],
		[Y],
		[DATECREATED],
		[DATEUPDATED],
		[NOTE],
		[SHORTCODE]
	)
	VALUES
	(
		@COUNTRY,
		@COMPANY,
		@COMPANYCODE,
		@STREET,
		@LONGNAME,
		@CODE,
		@STORENAME,
		@CITY,
		@POSTCODE,
		@TYPE,
		@X,
		@Y,
		@DATECREATED,
		@DATEUPDATED,
		@NOTE,
		@SHORTCODE
	)
	SELECT @@IDENTITY
GO
