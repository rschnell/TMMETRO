SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.OLAPCases
AS
SELECT DISTINCT 
                      dbo.CASEX.CASEID AS Cases, dbo.CASEX.PROJECT AS Projects, dbo.CASEX.STATUS, dbo.CASEX.PRIORITY, dbo.CASEX.IMPACT, dbo.CASEX.RISK, 
                      dbo.CASEX.DEADLINEDAYS AS Days, dbo.CASEX.UPDATED, dbo.CASEX.RAISED, dbo.CASEX.RAISEDBY AS [Raised By], dbo.CASEX.UPDATEDBY AS [Updated By], 
                      dbo.CASEX.MANAGEDBY AS [Managed By], dbo.CASEX.ASSIGNEDBY AS [Assigned By], dbo.CASEX.ASSIGNEDTO AS [Assigned To], 
                      dbo.SUBSCRIPTIONS.TMSUBNAME AS Team, dbo.CASEX.DEADLINE, dbo.CASEX.CAT1, dbo.CASEX.CAT2, dbo.CASEX.CAT3, dbo.CASEX.CAT4, 
                      dbo.CASEX.OCURRED AS Occured, dbo.CASEX.CAT5, dbo.CASEX.PRODUCT AS Products, dbo.CASEX.ORGANIZATION, dbo.CASEX.LOCATION, dbo.CASEX.LOCATE, 
                      dbo.LEDGERMinus.LedgerMinus, dbo.LEDGERPlus.LedgerPlus
FROM         dbo.CASEX INNER JOIN
                      dbo.SUBSCRIPTIONS ON dbo.CASEX._SUBSCRIPTIONID = dbo.SUBSCRIPTIONS.SUBSCRIPTIONID LEFT OUTER JOIN
                      dbo.LEDGERPlus ON dbo.CASEX.CASEID = dbo.LEDGERPlus.CASEID LEFT OUTER JOIN
                      dbo.LEDGERMinus ON dbo.CASEX.CASEID = dbo.LEDGERMinus.CASEID
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[28] 4[2] 2[54] 3) )"
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
         Configuration = "(H (4[30] 2[40] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[66] 3) )"
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
         Begin Table = "SUBSCRIPTIONS"
            Begin Extent = 
               Top = 6
               Left = 256
               Bottom = 206
               Right = 446
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LEDGERPlus"
            Begin Extent = 
               Top = 6
               Left = 682
               Bottom = 108
               Right = 842
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LEDGERMinus"
            Begin Extent = 
               Top = 99
               Left = 924
               Bottom = 201
               Right = 1084
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASEX"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 218
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
      ', 'SCHEMA', N'dbo', 'VIEW', N'OLAPCases', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'OLAPCases', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'OLAPCases', NULL, NULL
GO
