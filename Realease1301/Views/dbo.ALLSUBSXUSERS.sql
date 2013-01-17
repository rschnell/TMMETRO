SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.ALLSUBSXUSERS
AS
SELECT     dbo.SUBSXUSERS.SUBID, dbo.SUBSXUSERS.ISSUBMANAGER, dbo.SUBSXUSERS.ACTIVE AS Expr1, dbo.USERS.ID, dbo.USERS.UserId, 
                      dbo.USERS.GROUPID, dbo.USERS.OFFSET, dbo.USERS._CMSOrganizationBelongsTO, dbo.USERS.FirstName, dbo.USERS.LastName, 
                      dbo.USERS.UserName, dbo.USERS.DNNNAME, dbo.USERS.DNN_USERID, dbo.USERS.PassWord, dbo.USERS.Email, dbo.USERS.Admin, 
                      dbo.USERS.Active, dbo.USERS.LastUpdate, dbo.USERS.[External], dbo.USERS.Guest, dbo.USERS.Created, dbo.USERS.Country, 
                      dbo.USERS.LastLogin, dbo.USERS.LASTONLINE, dbo.USERS.LASTTIMEOUT, dbo.USERS.LASTLOGOUT, dbo.USERS.SkypeHandle, 
                      dbo.USERS.ManagerName, dbo.USERS.ManagerEmail, dbo.USERS.Telephone, dbo.USERS.Fax, dbo.USERS.MobilePhone, dbo.USERS.Address1, 
                      dbo.USERS.Address2, dbo.USERS.City, dbo.USERS.ZipCode, dbo.USERS.CountryID, dbo.USERS.DepartmentID, dbo.USERS.Confirmation, 
                      dbo.USERS.SkypeStatus, dbo.USERS.WebStatus, dbo.USERS.Mood, dbo.USERS.IMProviderID, dbo.USERS.IMUserName, dbo.USERS.IMPassword, 
                      dbo.USERS.CodeCountry, dbo.USERS.CodeLocale, dbo.USERS.CodeCompany, dbo.USERS.CodeLocation, dbo.USERS.CodeTheme, 
                      dbo.USERS.CodeOrganization, dbo.USERS.PARENTID, dbo.SUBSXUSERS.SUBSCRIPTIONID
FROM         dbo.SUBSXUSERS INNER JOIN
                      dbo.USERS ON dbo.SUBSXUSERS.USERID = dbo.USERS.UserId
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SUBSXUSERS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS"
            Begin Extent = 
               Top = 6
               Left = 241
               Bottom = 114
               Right = 460
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'ALLSUBSXUSERS', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'ALLSUBSXUSERS', NULL, NULL
GO
