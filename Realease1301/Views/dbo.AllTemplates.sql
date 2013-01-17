SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.AllTemplates
AS
SELECT     dbo.TEMPLATES.TEMPLATENAME, dbo.CATEGORIES.CATNAME, dbo.RELATIONSHIPS.RELNAME, dbo.RELATIONSHIPS.RELID, dbo.CATEGORIES.CATEGORYID, 
                      dbo.RELATIONSHIPS.DISPLAYNAME, dbo.CATEGORIES.ACTIVE, dbo.SUBSXTEMPLATES.SUBSCRIPTIONID, dbo.CATEGORIES.TEMPLATEID AS Expr1, 
                      dbo.TEMPLATES.GLOBAL
FROM         dbo.RELATIONSHIPS RIGHT OUTER JOIN
                      dbo.CATEGORIES INNER JOIN
                      dbo.SUBSXTEMPLATES INNER JOIN
                      dbo.TEMPLATES ON dbo.SUBSXTEMPLATES.TEMPLATEID = dbo.TEMPLATES.TEMPLATEID ON 
                      dbo.CATEGORIES.TEMPLATEID = dbo.SUBSXTEMPLATES.TEMPLATEID ON dbo.RELATIONSHIPS.CATEGORYID = dbo.CATEGORIES.CATEGORYID
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[33] 4[18] 2[15] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
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
         Begin Table = "RELATIONSHIPS"
            Begin Extent = 
               Top = 35
               Left = 737
               Bottom = 143
               Right = 888
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CATEGORIES"
            Begin Extent = 
               Top = 0
               Left = 529
               Bottom = 151
               Right = 685
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SUBSXTEMPLATES"
            Begin Extent = 
               Top = 21
               Left = 262
               Bottom = 162
               Right = 436
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TEMPLATES"
            Begin Extent = 
               Top = 15
               Left = 29
               Bottom = 123
               Right = 180
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 24
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
         Width = 1500
         Width = 1500
      End
   End
   Begin Cr', 'SCHEMA', N'dbo', 'VIEW', N'AllTemplates', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'iteriaPane = 
      Begin ColumnWidths = 11
         Column = 3360
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
', 'SCHEMA', N'dbo', 'VIEW', N'AllTemplates', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'AllTemplates', NULL, NULL
GO
