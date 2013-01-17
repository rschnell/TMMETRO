SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'THEMES' table.
CREATE PROCEDURE [dbo].[_THEMES_Update]
	-- The rest of writeable parameters
	@THEMETYPE int,
	@SUBSCRIPTIONID int,
	@Name nvarchar(50),
	@Color1 nchar(10),
	@Color2 nchar(10),
	@Color3 nchar(10),
	@Color4 nchar(10),
	@Color5 nchar(10),
	@Color6 nchar(10),
	@Color7 nchar(10),
	@Color8 nchar(10),
	@Color9 nchar(10),
	@Color10 nchar(10),
	@HeadeBackColor nvarchar(10),
	@Text1 nvarchar(50),
	@Text2 nvarchar(50),
	@Text3 nvarchar(50),
	@Text4 nvarchar(50),
	@Text5 nvarchar(50),
	@LogoTitle1 nvarchar(50),
	@LogoTitle2 nvarchar(50),
	@IconFile nvarchar(50),
	@LogoFile nvarchar(50),
	@LogoFileOther nvarchar(50),
	@Color11 nchar(10),
	@Color12 nchar(10),
	@Color13 nchar(10),
	@Color14 nchar(10),
	@Color15 nchar(10),
	@Text6 nvarchar(50),
	@Text7 nvarchar(50),
	@Text8 nvarchar(50),
	@Text9 nvarchar(50),
	@Text10 nvarchar(50),
	@Color16 nchar(10),
	@Color17 nchar(10),
	@Color18 nchar(10),
	@Color19 nchar(10),
	@Color20 nchar(10),
	@Color21 nchar(10),
	@Color22 nchar(10),
	@Color23 nchar(10),
	@Color24 nchar(10),
	@Color25 nchar(10),
	@GColor1 nchar(10),
	@GColor2 nchar(10),
	@GColor3 nchar(10),
	@GColor4 nchar(10),
	@GColor5 nchar(10),
	@GColor6 nchar(10),
	@GColor7 nchar(10),
	@GColor8 nchar(10),
	@GColor9 nchar(10),
	@GColor10 nchar(10),
	@GColor11 nchar(10),
	@GColor12 nchar(10),
	@GColor13 nchar(10),
	@GColor14 nchar(10),
	@GColor15 nchar(10),
	-- Primary key parameters
	@THEMEID int
AS
	UPDATE [dbo].[THEMES] SET
		[THEMETYPE] = @THEMETYPE,
		[SUBSCRIPTIONID] = @SUBSCRIPTIONID,
		[Name] = @Name,
		[color1] = @Color1,
		[color2] = @Color2,
		[color3] = @Color3,
		[color4] = @Color4,
		[color5] = @Color5,
		[color6] = @Color6,
		[color7] = @Color7,
		[color8] = @Color8,
		[color9] = @Color9,
		[color10] = @Color10,
		[HeadeBackColor] = @HeadeBackColor,
		[text1] = @Text1,
		[text2] = @Text2,
		[text3] = @Text3,
		[text4] = @Text4,
		[text5] = @Text5,
		[LogoTitle1] = @LogoTitle1,
		[LogoTitle2] = @LogoTitle2,
		[IconFile] = @IconFile,
		[LogoFile] = @LogoFile,
		[LogoFileOther] = @LogoFileOther,
		[color11] = @Color11,
		[color12] = @Color12,
		[color13] = @Color13,
		[color14] = @Color14,
		[color15] = @Color15,
		[text6] = @Text6,
		[text7] = @Text7,
		[text8] = @Text8,
		[text9] = @Text9,
		[text10] = @Text10,
		[Color16] = @Color16,
		[color17] = @Color17,
		[color18] = @Color18,
		[color19] = @Color19,
		[color20] = @Color20,
		[color21] = @Color21,
		[color22] = @Color22,
		[color23] = @Color23,
		[color24] = @Color24,
		[color25] = @Color25,
		[gColor1] = @GColor1,
		[gColor2] = @GColor2,
		[gColor3] = @GColor3,
		[gColor4] = @GColor4,
		[gColor5] = @GColor5,
		[gColor6] = @GColor6,
		[gColor7] = @GColor7,
		[gColor8] = @GColor8,
		[gColor9] = @GColor9,
		[gColor10] = @GColor10,
		[gColor11] = @GColor11,
		[gColor12] = @GColor12,
		[gColor13] = @GColor13,
		[gColor14] = @GColor14,
		[gColor15] = @GColor15
	WHERE
		[THEMEID] = @THEMEID
GO