SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.MYATTACHMENTS
AS
SELECT     dbo.ATTACHMENTS.FILEPATH AS _FilePath, dbo.ATTACHMENTS.FILENAME AS _FileName, dbo.ATTACHMENTS.TITLE, dbo.ATTACHMENTS.FILEVERSION AS Version, 
                      USERS_1.UserName AS [Raised By], dbo.DIARY._CMSDATEUPDATED AS Raised, dbo.ATTACHMENTS.FILESIZE, dbo.DIARY.ACTIONID, dbo.DIARY.CASEID, 
                      dbo.ATTACHMENTS._CMSUSERSRaisedBy, dbo.CASES.SUBSCRIPTIONID AS _SUBSCRIPTIONID, USERS_1.UserId AS _USERID, 
                      dbo.ATTACHMENTS.ATTACHMENTID AS ID, dbo.ATTACHMENTS.TYPE, dbo.ATTACHMENTS.ACTIVE, dbo.ATTACHMENTS.LISTID
FROM         dbo.USERS AS USERS_1 INNER JOIN
                      dbo.DIARY ON USERS_1.UserId = dbo.DIARY._CMSUSERSRAISED INNER JOIN
                      dbo.ATTACHMENTS ON dbo.DIARY.DIARYID = dbo.ATTACHMENTS.DIARYID INNER JOIN
                      dbo.CASES ON dbo.DIARY.CASEID = dbo.CASES.CASEID
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[33] 2[9] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
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
         Configuration = "(H (1[56] 3) )"
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
         Top = -32
         Left = 0
      End
      Begin Tables = 
         Begin Table = "USERS_1"
            Begin Extent = 
               Top = 130
               Left = 584
               Bottom = 289
               Right = 801
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DIARY"
            Begin Extent = 
               Top = 53
               Left = 286
               Bottom = 161
               Right = 460
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "ATTACHMENTS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "CASES"
            Begin Extent = 
               Top = 161
               Left = 59
               Bottom = 269
               Right = 269
            End
            DisplayFlags = 280
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
         Column = 2025
         Alias = 1320
         Table = 2385
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         O', 'SCHEMA', N'dbo', 'VIEW', N'MYATTACHMENTS', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'r = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'MYATTACHMENTS', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'MYATTACHMENTS', NULL, NULL
GO
