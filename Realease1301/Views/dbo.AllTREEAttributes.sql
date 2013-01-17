SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.AllTREEAttributes
AS
SELECT DISTINCT 
                      dbo.AllCASESTree.CATNAME, dbo.AllCASESTree.NODENAME, dbo.AllCASESTree.TREEID, dbo.AllCASESTree.CATEGORYID, dbo.AllCASESTree.[DEFAULT], 
                      dbo.AllCASESTree.SUBSCRIPTIONID, dbo.AllCASESTree.TREELN, dbo.AllCASESTree.TREERN, dbo.AllCASESTree.CATOFFIELDNAME, dbo.AllCASESTree.NODEVALUE, 
                      dbo.AllCASESTree.ACTIVE, dbo.AllCASESTree.NODETEXT, dbo.TREEATTRIBUTES.Code, dbo.TREEATTRIBUTES.Description, dbo.TREEATTRIBUTES.Attribute1, 
                      dbo.TREEATTRIBUTES.Attribute2, dbo.TREEATTRIBUTES.Attribute3, dbo.TREEATTRIBUTES.Attribute4, dbo.TREEATTRIBUTES.Attribute5, 
                      dbo.AllCASESTree.TREELEVEL, dbo.AllCASESTree.RENDERTOLEVEL
FROM         dbo.AllCASESTree LEFT OUTER JOIN
                      dbo.TREEATTRIBUTES ON dbo.AllCASESTree.TREEID = dbo.TREEATTRIBUTES.TREEID
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[36] 4[20] 2[14] 3) )"
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
         Begin Table = "AllCASESTree"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 169
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "TREEATTRIBUTES"
            Begin Extent = 
               Top = 0
               Left = 439
               Bottom = 206
               Right = 613
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
      Begin ColumnWidths = 23
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3285
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
', 'SCHEMA', N'dbo', 'VIEW', N'AllTREEAttributes', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'AllTREEAttributes', NULL, NULL
GO
