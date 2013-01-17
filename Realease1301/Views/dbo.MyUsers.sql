SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.MyUsers
AS
SELECT dbo.SUBSCRIPTIONS.TMSUBNAME AS [Group], dbo.USERS.USERNAME, dbo.USERS.USERID AS ID, 
               dbo.SUBSCRIPTIONS.SUBSCRIPTIONID AS _SUBSCRIPTIONID, dbo.USERS.FIRSTNAME, dbo.USERS.LASTNAME, dbo.USERS.EMAIL, dbo.USERS.[External], 
               dbo.USERS.LASTLOGIN, dbo.USERS.SKYPEHANDLE, dbo.USERS.ACTIVE, dbo.USERS.GROUPID AS _GroupID, 
               dbo.SUBSXUSERS.ISSUBMANAGER AS [Manager?], dbo.USERS.IMProviderID, dbo.USERS.IMUserName, dbo.USERS.IMPassword
FROM  dbo.USERS INNER JOIN
               dbo.SUBSXUSERS ON dbo.USERS.USERID = dbo.SUBSXUSERS.USERID INNER JOIN
               dbo.SUBSCRIPTIONS ON dbo.SUBSXUSERS.SUBSCRIPTIONID = dbo.SUBSCRIPTIONS.SUBSCRIPTIONID
WHERE (dbo.USERS.ACTIVE = 1)
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
         Begin Table = "USERS"
            Begin Extent = 
               Top = 0
               Left = 38
               Bottom = 186
               Right = 255
            End
            DisplayFlags = 280
            TopColumn = 35
         End
         Begin Table = "SUBSXUSERS"
            Begin Extent = 
               Top = 68
               Left = 301
               Bottom = 176
               Right = 452
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SUBSCRIPTIONS"
            Begin Extent = 
               Top = 5
               Left = 522
               Bottom = 163
               Right = 673
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
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'MyUsers', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'MyUsers', NULL, NULL
GO
