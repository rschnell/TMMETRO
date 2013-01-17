SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.rptSUMMARYFINANCIAL
AS
SELECT dbo.CASEY.[COMPANY CODE] AS COMPANYCODE, dbo.CASEY.FACILITY, dbo.LEDGERVALUES.TotalValue, dbo.LEDGERVALUES.Description, dbo.LEDGERVALUES.ValueDate, 
               dbo.LEDGERVALUES.IsRECOVERED, dbo.LEDGERVALUES.Quantity, dbo.LEDGERVALUES.UnitValue, dbo.LEDGERVALUES.AssetDescription, dbo.CASESTREE.NODENAME AS ARTICLE, 
               dbo.CASEY.[Incident Location] AS AREA, dbo.CASEY.[Currency Code], dbo.COUNTRIES.RATE AS RATETOEUR, dbo.COUNTRIES.PER AS PERUNIT
FROM  dbo.COUNTRIES INNER JOIN
               dbo.DIARY INNER JOIN
               dbo.LEDGERVALUES ON dbo.DIARY.DIARYID = dbo.LEDGERVALUES.DiaryID INNER JOIN
               dbo.CASEY ON dbo.DIARY.CASEID = dbo.CASEY.CASEID ON dbo.COUNTRIES.COUNTRYCODE = dbo.CASEY.[Country Code] LEFT OUTER JOIN
               dbo.CASESTREE ON dbo.LEDGERVALUES.AssetTypeId = dbo.CASESTREE.NODEVALUE
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[53] 4[25] 2[5] 3) )"
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
         Begin Table = "COUNTRIES"
            Begin Extent = 
               Top = 7
               Left = 876
               Bottom = 345
               Right = 1073
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DIARY"
            Begin Extent = 
               Top = 154
               Left = 48
               Bottom = 297
               Right = 261
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LEDGERVALUES"
            Begin Extent = 
               Top = 7
               Left = 280
               Bottom = 152
               Right = 469
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASEY"
            Begin Extent = 
               Top = 141
               Left = 612
               Bottom = 284
               Right = 828
            End
            DisplayFlags = 280
            TopColumn = 64
         End
         Begin Table = "CASESTREE"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 150
               Right = 232
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
         Or =', 'SCHEMA', N'dbo', 'VIEW', N'rptSUMMARYFINANCIAL', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N' 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'rptSUMMARYFINANCIAL', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'rptSUMMARYFINANCIAL', NULL, NULL
GO
