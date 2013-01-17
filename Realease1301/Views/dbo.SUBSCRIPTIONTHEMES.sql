SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[SUBSCRIPTIONTHEMES]
AS
SELECT     dbo.SUBSCRIPTIONS.SUBSCRIPTIONID, dbo.THEMES.Name, dbo.THEMES.color1, dbo.THEMES.color2, dbo.THEMES.color3, dbo.THEMES.color4, 
                      dbo.THEMES.color5, dbo.THEMES.color6, dbo.THEMES.color7, dbo.THEMES.color8, dbo.THEMES.color9, dbo.THEMES.color10, dbo.THEMES.HeadeBackColor, 
                      dbo.THEMES.text1, dbo.THEMES.text2, dbo.THEMES.text3, dbo.THEMES.text4, dbo.THEMES.text5, dbo.THEMES.LogoTitle1, dbo.THEMES.LogoTitle2, 
                      dbo.THEMES.IconFile, dbo.THEMES.LogoFile, dbo.THEMES.LogoFileOther, dbo.THEMES.color11, dbo.THEMES.color12, dbo.THEMES.color13, dbo.THEMES.color14, 
                      dbo.THEMES.color15, dbo.THEMES.text6, dbo.THEMES.text7, dbo.THEMES.text8, dbo.THEMES.text9, dbo.THEMES.text10, dbo.THEMES.Color16, 
                      dbo.THEMES.color17, dbo.THEMES.color18, dbo.THEMES.color19, dbo.THEMES.color20, dbo.THEMES.color21, dbo.THEMES.color22, dbo.THEMES.color23, 
                      dbo.THEMES.color24, dbo.THEMES.color25
FROM         dbo.SUBSCRIPTIONS INNER JOIN
                      dbo.THEMES ON dbo.SUBSCRIPTIONS.SITECODE = dbo.THEMES.Name
WHERE     (dbo.SUBSCRIPTIONS.SUBSCRIPTIONID <> 0 AND dbo.SUBSCRIPTIONS.SUBSCRIPTIONID <> 31) AND (dbo.THEMES.SUBSCRIPTIONID = 0)

GO
