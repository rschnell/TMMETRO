SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[SUBSCRIPTIONCURRENCIES]
AS
SELECT     dbo.SUBSCRIPTIONCODES.ID, dbo.SUBSCRIPTIONCODES.SUBSCRIPTIONID, dbo.SUBSCRIPTIONCODES.TMROLE, dbo.SUBSCRIPTIONCODES.TMSUBNAME, 
                      dbo.SUBSCRIPTIONCODES.ACTIVE, dbo.SUBSCRIPTIONCODES.DESCRIPTION, dbo.SUBSCRIPTIONCODES.THEMEID, dbo.SUBSCRIPTIONCODES.HOMEURL, 
                      dbo.SUBSCRIPTIONCODES.SITECODE, dbo.SUBSCRIPTIONCODES.CREATED, dbo.SUBSCRIPTIONCODES.SITEID, dbo.SUBSCRIPTIONCODES.SUBTYPE, 
                      dbo.SUBSCRIPTIONCODES.ALIASES, dbo.SUBSCRIPTIONCODES.FLAG1, dbo.SUBSCRIPTIONCODES.FLAG2, dbo.SUBSCRIPTIONCODES.FLAG3, 
                      dbo.SUBSCRIPTIONCODES.COUNTRY_CODE, dbo.SUBSCRIPTIONCODES.COMPANY, dbo.COUNTRIES.CURRENCY_CODE, dbo.COUNTRIES.RATE, 
                      dbo.COUNTRIES.RATEDATE, dbo.COUNTRIES.PER, dbo.COUNTRIES.COUNTRY_NAME AS [Country Name]
FROM         dbo.SUBSCRIPTIONCODES INNER JOIN
                      dbo.COUNTRIES ON dbo.SUBSCRIPTIONCODES.COUNTRY_CODE = dbo.COUNTRIES.COUNTRYCODE

GO
