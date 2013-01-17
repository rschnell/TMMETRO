SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'FACILITIES' table.
CREATE PROCEDURE [dbo].[_FACILITIES_Update]
	-- The rest of writeable parameters
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
	@SHORTCODE nvarchar(4),
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[FACILITIES] SET
		[COUNTRY] = @COUNTRY,
		[COMPANY] = @COMPANY,
		[COMPANYCODE] = @COMPANYCODE,
		[STREET] = @STREET,
		[LONGNAME] = @LONGNAME,
		[CODE] = @CODE,
		[STORENAME] = @STORENAME,
		[CITY] = @CITY,
		[POSTCODE] = @POSTCODE,
		[TYPE] = @TYPE,
		[X] = @X,
		[Y] = @Y,
		[DATECREATED] = @DATECREATED,
		[DATEUPDATED] = @DATEUPDATED,
		[NOTE] = @NOTE,
		[SHORTCODE] = @SHORTCODE
	WHERE
		[ID] = @ID
GO
