SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.MyGroup
AS
SELECT     dbo.SUBSCRIPTIONS.SUBSCRIPTIONID, dbo.USERS.UserName, dbo.USERS.Mood, dbo.USERS.WebStatus, dbo.USERS.SkypeStatus, dbo.USERS.[External], 
                      dbo.SUBSCRIPTIONS.TMSUBNAME, dbo.SUBSXUSERS.ISSUBMANAGER AS _IsSubManager, dbo.USERS.Email, dbo.USERS.Active, dbo.USERS.LastLogin, 
                      dbo.SUBSCRIPTIONS.ACTIVE AS SUBACTIVE, dbo.SUBSXUSERS.USERID
FROM         dbo.USERS INNER JOIN
                      dbo.SUBSXUSERS ON dbo.USERS.UserId = dbo.SUBSXUSERS.USERID INNER JOIN
                      dbo.SUBSCRIPTIONS ON dbo.SUBSXUSERS.SUBSCRIPTIONID = dbo.SUBSCRIPTIONS.SUBSCRIPTIONID
WHERE     (dbo.USERS.Active = 1)
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[39] 4[22] 2[3] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[51] 4[38] 3) )"
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
      ActivePaneConfig = 1
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "USERS"
            Begin Extent = 
               Top = 5
               Left = 590
               Bottom = 122
               Right = 818
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SUBSXUSERS"
            Begin Extent = 
               Top = 92
               Left = 249
               Bottom = 254
               Right = 400
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SUBSCRIPTIONS"
            Begin Extent = 
               Top = 4
               Left = 10
               Bottom = 134
               Right = 161
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 22
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
         Column = 3345
         Alias = 900
         Table = 2250
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         O', 'SCHEMA', N'dbo', 'VIEW', N'MyGroup', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'r = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'MyGroup', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'MyGroup', NULL, NULL
GO
