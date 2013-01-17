SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.XLEDGERVALUES
AS
SELECT     dbo.LEDGERVALUES.VALUEID, dbo.LEDGERVALUES.DiaryID, dbo.LEDGERVALUES.ValueDate, dbo.LEDGERVALUES.ValueFromDate, 
                      dbo.LEDGERVALUES.ValueToDate, dbo.LEDGERVALUES.UnitValue, dbo.LEDGERVALUES.CurrencyCode, dbo.LEDGERVALUES.Quantity, 
                      dbo.LEDGERVALUES.TotalValue, dbo.LEDGERVALUES.AssetDescription, CASESTREE_5.NODENAME AS CURRENCY, dbo.LEDGERVALUES.City, 
                      dbo.LEDGERVALUES.Country, dbo.CASESTREE.NODENAME AS LOCATION1, CASESTREE_2.NODENAME AS LOCATION2, 
                      CASESTREE_1.NODENAME AS LEDGERNAME, CASESTREE_3.NODENAME AS RATETYPE, CASESTREE_4.NODENAME AS ASSET, dbo.LEDGERVALUES.Active, 
                      dbo.LEDGERVALUES.ValueTypeID AS LEDGERTYPE
FROM         dbo.CASESTREE AS CASESTREE_1 RIGHT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_4 RIGHT OUTER JOIN
                      dbo.LEDGERVALUES LEFT OUTER JOIN
                      dbo.CASESTREE ON dbo.LEDGERVALUES.GroupID = dbo.CASESTREE.NODEVALUE ON 
                      CASESTREE_4.NODEVALUE = dbo.LEDGERVALUES.AssetTypeId LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_5 ON dbo.LEDGERVALUES.CurrencyTypeID = CASESTREE_5.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_3 ON dbo.LEDGERVALUES.RateTypeId = CASESTREE_3.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_2 ON dbo.LEDGERVALUES.Location2TypeId = CASESTREE_2.NODEVALUE ON 
                      CASESTREE_1.NODEVALUE = dbo.LEDGERVALUES.ValueTypeID
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[58] 4[11] 2[14] 3) )"
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
         Configuration = "(H (4[30] 2[40] 3) )"
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
         Configuration = "(H (1[75] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4[60] 2) )"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4) )"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 3
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = -96
      End
      Begin Tables = 
         Begin Table = "CASESTREE_1"
            Begin Extent = 
               Top = 66
               Left = 917
               Bottom = 183
               Right = 1077
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_4"
            Begin Extent = 
               Top = 198
               Left = 269
               Bottom = 315
               Right = 429
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "LEDGERVALUES"
            Begin Extent = 
               Top = 38
               Left = 561
               Bottom = 450
               Right = 730
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE"
            Begin Extent = 
               Top = 94
               Left = 170
               Bottom = 211
               Right = 330
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "CASESTREE_5"
            Begin Extent = 
               Top = 276
               Left = 306
               Bottom = 393
               Right = 451
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "CASESTREE_3"
            Begin Extent = 
               Top = 295
               Left = 929
               Bottom = 412
               Right = 1089
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "CASESTREE_2"
            Begin Extent = 
               Top = 200
               Left = 933
               Bottom = 317
               Right ', 'SCHEMA', N'dbo', 'VIEW', N'XLEDGERVALUES', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'= 1093
            End
            DisplayFlags = 344
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 20
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2205
         Table = 2535
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
', 'SCHEMA', N'dbo', 'VIEW', N'XLEDGERVALUES', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'XLEDGERVALUES', NULL, NULL
GO
