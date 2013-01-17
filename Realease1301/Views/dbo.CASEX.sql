SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.CASEX
AS
SELECT DISTINCT 
               TITLE, REFERENCE, PROJECT, STATUS, PRIORITY, IMPACT, RISK, ASSIGNEDTO, UPDATED, UPDATEDBY, DEADLINEDAYS, ASSIGNEDBY, RAISED, 
               MANAGEDBY, RAISEDBY, DEADLINE, CASEID, ACTIONID, OCURRED, PRODUCT, LOCATION, LOCATE, ORGANIZATION, CAT1, CAT2, CAT3, CAT4, CAT5, 
               DESCRIPTION, ISSTICKY, _SUBSCRIPTIONID, _ISUNMANAGED, ID, REPORTEDBY, EVENTDESCRIPTION, FILENO, RECOVEREDVALUE, TOTALVALUE, 
               EVENTTIME, EVENTDATE, ISFLAG1, ISFLAG2, REFERENCE1, REFERENCE2, REFERENCE3, REFERENCE4, ACTIVE, PREVENTEDVALUE, REFERENCE5, 
               REFERENCE6, INVITEE, EXTLOCATION, EXTLOCATIONLINE1, EXTLOCATIONLINE2, EXTLOCATIONLINE4, EXTLOCATIONLINE3, CAT6, CAT7, CAT8, CAT10, 
               CAT9
FROM  dbo.CASEINVITES
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
         Configuration = "(V (2) )"
      End
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CASEINVITES"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 352
               Right = 249
            End
            DisplayFlags = 280
            TopColumn = 50
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
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
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'CASEX', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'CASEX', NULL, NULL
GO
