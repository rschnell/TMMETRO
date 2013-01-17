SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.MYCHATINVITESNEW
AS
SELECT     TOP (100) PERCENT dbo.DIARYSUBS.DATEUPDATED, dbo.DIARYSUBS.RAISEDBY, dbo.DIARYSUBS.Note, dbo.DIARYSUBS.SUBSCRIPTIONID, 
                      dbo.CASESXUSERS.USERID AS INVITEE, dbo.DIARYSUBS.DIARYID, dbo.DIARYSUBS.ACTIONID, dbo.DIARYSUBS.CASEID, 
                      dbo.DIARYSUBS._CMSTYPEOF AS CMSTYPEOF, dbo.CASES._CMSSTATUSOF
FROM         dbo.CASESXUSERS INNER JOIN
                      dbo.DIARYSUBS ON dbo.CASESXUSERS.CASEID = dbo.DIARYSUBS.CASEID INNER JOIN
                      dbo.CASES ON dbo.DIARYSUBS.CASEID = dbo.CASES.CASEID
WHERE     (dbo.CASESXUSERS.ACTIONID = dbo.DIARYSUBS.ACTIONID) AND (dbo.DIARYSUBS.ACTIONID <> 0) AND (dbo.CASES._CMSSTATUSOF <> 26) OR
                      (dbo.DIARYSUBS.ACTIONID = 0) AND (dbo.CASESXUSERS.CASEID = dbo.DIARYSUBS.CASEID)
ORDER BY dbo.DIARYSUBS.DATEUPDATED DESC
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[32] 2[6] 3) )"
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
         Top = -11
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CASESXUSERS"
            Begin Extent = 
               Top = 21
               Left = 708
               Bottom = 247
               Right = 868
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DIARYSUBS"
            Begin Extent = 
               Top = 13
               Left = 410
               Bottom = 287
               Right = 584
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASES"
            Begin Extent = 
               Top = 17
               Left = 38
               Bottom = 184
               Right = 267
            End
            DisplayFlags = 280
            TopColumn = 11
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1200
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
', 'SCHEMA', N'dbo', 'VIEW', N'MYCHATINVITESNEW', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'MYCHATINVITESNEW', NULL, NULL
GO
