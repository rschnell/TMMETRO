SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.ALLCASESTREETERMS
AS
SELECT DISTINCT 
                      dbo.CASESTREETERMS.TREEID, dbo.CATEGORIES.CATNAME, dbo.CASESTREETERMS.BASETERM, dbo.CASESTREE.CATEGORYID, dbo.CASESTREE.NODENAME, 
                      dbo.CASESTREE.NODEVALUE, dbo.CASESTREE.NODETEXT, dbo.CASESTREE.[DEFAULT], dbo.CASESTREE.TREELEVEL, dbo.CASESTREE.TREELN, 
                      dbo.CASESTREE.TREERN, dbo.CASESTREE.ACTIVE, dbo.CASESTREE.NODETAG, dbo.CASESTREE.PARENTID, dbo.CASESTREETERMS.UPDATEBYID, 
                      dbo.CASESTREETERMS.UPDATEDBY, dbo.CASESTREETERMS.LASTUPDATED, dbo.CASESTREETERMS.ENUSTP, dbo.CASESTREETERMS.DEDETP, 
                      dbo.CASESTREETERMS.THTHTP, dbo.CASESTREE.TREEID AS Expr1, dbo.CASESTREETERMS.ENUSTR, dbo.CASESTREETERMS.DEDETR, 
                      dbo.CASESTREETERMS.THTHTR, dbo.SUBSXTEMPLATES.SUBSCRIPTIONID, dbo.CASESTREETERMS.enUSTPTIP, dbo.CASESTREETERMS.TEXT1, 
                      dbo.CASESTREETERMS.TEXT2, dbo.CASESTREETERMS.TEXT3, dbo.CASESTREETERMS.ENGBTP, dbo.CASESTREETERMS.ENGBTPTIP, dbo.CASESTREE.NODEID, 
                      dbo.CASESTREETERMS.TEXT4, dbo.CASESTREETERMS.TEXT5, dbo.CASESTREETERMS.TEXT6, dbo.CASESTREETERMS.TEXT7, dbo.CASESTREETERMS.TEXT8, 
                      dbo.CASESTREETERMS.THTHTPTIP, dbo.CASESTREETERMS.NLNLTP, dbo.CASESTREETERMS.NLNLTPTIP, dbo.CASESTREETERMS.TRTRTP, 
                      dbo.CASESTREETERMS.TRTRTPTIP, dbo.CASESTREETERMS.DEDETPTIP, dbo.CASESTREETERMS.GBGBTP, dbo.CASESTREETERMS.GBGBTPTIP, 
                      dbo.CASESTREETERMS.HEILTPTIP, dbo.CASESTREETERMS.HEILTP, dbo.CASESTREETERMS.AREGTP, dbo.CASESTREETERMS.AREGTPTIP, 
                      dbo.CASESTREETERMS.ZHCNTP, dbo.CASESTREETERMS.ZHCNTPTIP, dbo.CASESTREETERMS.VIVNTP, dbo.CASESTREETERMS.VIVNTPTIP, 
                      dbo.CASESTREETERMS.JAJPTP, dbo.CASESTREETERMS.JAJPTPTIP, dbo.CASESTREETERMS.ENNLTPTIP, dbo.CASESTREETERMS.ENNLTP, 
                      dbo.CASESTREETERMS.JAJATP, dbo.CASESTREETERMS.JAJATPTIP, dbo.CASESTREETERMS.ENENTP, dbo.CASESTREETERMS.ENENTPTIP, 
                      dbo.CASESTREETERMS.FRFRTP, dbo.CASESTREETERMS.FRFRTPTIP
FROM         dbo.CATEGORIES INNER JOIN
                      dbo.CASESTREE ON dbo.CATEGORIES.CATEGORYID = dbo.CASESTREE.CATEGORYID INNER JOIN
                      dbo.SUBSXTEMPLATES ON dbo.CATEGORIES.TEMPLATEID = dbo.SUBSXTEMPLATES.TEMPLATEID INNER JOIN
                      dbo.CASESTREETERMS ON dbo.CASESTREE.TREEID = dbo.CASESTREETERMS.TREEID
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[47] 4[17] 2[14] 3) )"
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
         Configuration = "(H (1[60] 3) )"
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
      ActivePaneConfig = 4
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CATEGORIES"
            Begin Extent = 
               Top = 38
               Left = 243
               Bottom = 234
               Right = 422
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE"
            Begin Extent = 
               Top = 37
               Left = 492
               Bottom = 156
               Right = 652
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "SUBSXTEMPLATES"
            Begin Extent = 
               Top = 35
               Left = 11
               Bottom = 139
               Right = 185
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREETERMS"
            Begin Extent = 
               Top = 32
               Left = 688
               Bottom = 255
               Right = 848
            End
            DisplayFlags = 280
            TopColumn = 39
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 34
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
     ', 'SCHEMA', N'dbo', 'VIEW', N'ALLCASESTREETERMS', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'    Width = 1500
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
      PaneHidden = 
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
', 'SCHEMA', N'dbo', 'VIEW', N'ALLCASESTREETERMS', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'ALLCASESTREETERMS', NULL, NULL
GO
