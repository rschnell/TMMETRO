SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.rptCasesTypeByRegion
AS
SELECT     dbo.CASES.CASEID, CASESTREE_1.NODENAME AS TYPE, YEAR(dbo.CASES._CMSDATEOCCURED) AS OCCUREDYEAR, MONTH(dbo.CASES._CMSDATEOCCURED) 
                      AS OCCUREDMONTH, CASESTREE_2.NODENAME AS LEVEL1, CASESTREE_5.NODENAME AS LEVEL2, CASESTREE_3.NODENAME AS LEVEL3, 
                      CASESTREE_4.NODENAME AS PRODUCT, dbo.CASESTREE.NODENAME AS DETECTION
FROM         dbo.CASESTREE AS CASESTREE_4 RIGHT OUTER JOIN
                      dbo.CASES LEFT OUTER JOIN
                      dbo.CASESTREE ON dbo.CASES._CMSCAT10Of = dbo.CASESTREE.NODEVALUE ON 
                      CASESTREE_4.NODEVALUE = dbo.CASES._CMSPRODUCTCONTAINS LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_3 ON dbo.CASES._CMSCAT8Of = CASESTREE_3.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_5 ON dbo.CASES._CMSCAT7Of = CASESTREE_5.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_2 ON dbo.CASES._CMSCAT6Of = CASESTREE_2.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_1 ON dbo.CASES._CMSCAT1OF = CASESTREE_1.NODEVALUE
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[55] 4[6] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
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
         Configuration = "(H (1[39] 4) )"
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
         Begin Table = "CASESTREE_5"
            Begin Extent = 
               Top = 99
               Left = 550
               Bottom = 216
               Right = 710
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASES"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 179
               Right = 267
            End
            DisplayFlags = 280
            TopColumn = 42
         End
         Begin Table = "CASESTREE_3"
            Begin Extent = 
               Top = 8
               Left = 599
               Bottom = 125
               Right = 759
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "CASESTREE_2"
            Begin Extent = 
               Top = 6
               Left = 635
               Bottom = 123
               Right = 795
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "CASESTREE_1"
            Begin Extent = 
               Top = 2
               Left = 626
               Bottom = 169
               Right = 904
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "CASESTREE_4"
            Begin Extent = 
               Top = 6
               Left = 305
               Bottom = 123
               Right = 465
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE"
            Begin Extent = 
               Top = 60
               Left = 760
               Bottom = 177
               Right = 920
            End
            Displa', 'SCHEMA', N'dbo', 'VIEW', N'rptCasesTypeByRegion', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'yFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
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
         Alias = 2025
         Table = 1695
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
', 'SCHEMA', N'dbo', 'VIEW', N'rptCasesTypeByRegion', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'rptCasesTypeByRegion', NULL, NULL
GO
