SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.XACTIONS
AS
SELECT     dbo.ACTIONS.TITLE, CASESTREE_2.NODENAME AS STATUS, CASESTREE_1.NODENAME AS PRIORITY, CASESTREE_5.NODENAME AS IMPACT, 
                      CASESTREE_3.NODENAME AS RISK, USERS_1.UserName AS ASSIGNEDTO, dbo.ACTIONS._CMSDATEUpdated AS UPDATED, USERS_4.UserName AS UPDATEDBY, 
                      CASE WHEN dbo.ACTIONS._CMSDATEEND IS NULL THEN 9999 ELSE DATEDIFF(DAY, GetDate(), dbo.ACTIONS._CMSDATEEND) END AS DEADLINEDAYS, 
                      USERS_2.UserName AS ASSIGNEDBY, USERS_5.UserName AS MANAGEDBY, USERS_5.UserName AS RAISEDBY, dbo.ACTIONS._CMSDATEEnd AS DEADLINE, 
                      dbo.ACTIONS.CASEID, dbo.ACTIONS.ACTIONID, dbo.DIARY.Note AS DESCRIPTION, dbo.ACTIONS.ACTIONID AS ID, dbo.CASES.SUBSCRIPTIONID AS _SUBSCRIPTIONID,
                       dbo.ACTIONS.ISISSUE, CASE WHEN dbo.ACTIONS.IsSticky IS NULL THEN 0 ELSE dbo.ACTIONS.IsSticky END AS ISSTICKY, 0 AS _ISUNMANAGED, 
                      dbo.ACTIONS._CMSDATERaised AS RAISED, 0 AS INVITEE, dbo.CASESTREE.NODENAME AS PROJECT, CASESTREE_6.NODENAME AS CAT1, 
                      CASESTREE_7.NODENAME AS CAT2, CASESTREE_4.NODENAME AS CAT3, CASESTREE_8.NODENAME AS CAT4, dbo.ACTIONS._CMSDateOccured AS OCCURED, 
                      USERS_1.UserName
FROM         dbo.USERS AS USERS_1 RIGHT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_2 RIGHT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_1 RIGHT OUTER JOIN
                      dbo.DIARY INNER JOIN
                      dbo.ACTIONS INNER JOIN
                      dbo.CASES ON dbo.ACTIONS.CASEID = dbo.CASES.CASEID ON dbo.DIARY.ACTIONID = dbo.ACTIONS.ACTIONID LEFT OUTER JOIN
                      dbo.USERS AS USERS_5 ON dbo.CASES._CMSUSERSMANAGEDBY = USERS_5.UserId LEFT OUTER JOIN
                      dbo.USERS AS USERS_2 ON dbo.ACTIONS._CMSUSERSAssignedBy = USERS_2.UserId LEFT OUTER JOIN
                      dbo.USERS AS USERS_4 ON dbo.ACTIONS._CMSUsersUpdated = USERS_4.UserId LEFT OUTER JOIN
                      dbo.USERS ON dbo.ACTIONS._CMSUSERSManagedBy = dbo.USERS.ID ON CASESTREE_1.NODEVALUE = dbo.ACTIONS._CMSPRIORITYOf ON 
                      CASESTREE_2.NODEVALUE = dbo.ACTIONS._CMSSTATUSOf ON USERS_1.UserId = dbo.ACTIONS._CMSUsersAssignedTo LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_7 ON dbo.ACTIONS._CMSCAT2Of = CASESTREE_7.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_4 ON dbo.ACTIONS._CMSCAT3Of = CASESTREE_4.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_3 ON dbo.ACTIONS._CMSRiskOf = CASESTREE_3.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_5 ON dbo.ACTIONS._CMSIMPACTOf = CASESTREE_5.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_8 ON dbo.ACTIONS._CMSCAT4Of = CASESTREE_8.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_6 ON dbo.ACTIONS._CMSCAT1OF = CASESTREE_6.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE ON dbo.CASES._CMSPROJECTCONTAINS = dbo.CASESTREE.NODEVALUE
WHERE     (dbo.DIARY.IsDescription = 1)
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[48] 4[10] 2[26] 3) )"
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
         Configuration = "(H (1[84] 3) )"
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
         Begin Table = "CASESTREE_3"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_6"
            Begin Extent = 
               Top = 0
               Left = 67
               Bottom = 117
               Right = 227
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_5"
            Begin Extent = 
               Top = 0
               Left = 110
               Bottom = 117
               Right = 270
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ACTIONS"
            Begin Extent = 
               Top = 19
               Left = 518
               Bottom = 136
               Right = 722
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS_5"
            Begin Extent = 
               Top = 130
               Left = 83
               Bottom = 247
               Right = 311
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASES"
            Begin Extent = 
               Top = 366
               Left = 38
               Bottom = 483
               Right = 267
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS_1"
            Begin Extent = 
               Top = 694
               Left = 681
               Bottom = 811
               Right = 909
            End
            DisplayFlags =', 'SCHEMA', N'dbo', 'VIEW', N'XACTIONS', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N' 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_8"
            Begin Extent = 
               Top = 0
               Left = 801
               Bottom = 117
               Right = 961
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_7"
            Begin Extent = 
               Top = 336
               Left = 799
               Bottom = 453
               Right = 959
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS"
            Begin Extent = 
               Top = 610
               Left = 481
               Bottom = 749
               Right = 709
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_4"
            Begin Extent = 
               Top = 503
               Left = 749
               Bottom = 620
               Right = 909
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS_2"
            Begin Extent = 
               Top = 876
               Left = 729
               Bottom = 993
               Right = 957
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_1"
            Begin Extent = 
               Top = 673
               Left = 448
               Bottom = 790
               Right = 608
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_2"
            Begin Extent = 
               Top = 738
               Left = 548
               Bottom = 855
               Right = 708
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DIARY"
            Begin Extent = 
               Top = 794
               Left = 31
               Bottom = 911
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS_4"
            Begin Extent = 
               Top = 966
               Left = 38
               Bottom = 1083
               Right = 266
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE"
            Begin Extent = 
               Top = 578
               Left = 56
               Bottom = 695
               Right = 216
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
', 'SCHEMA', N'dbo', 'VIEW', N'XACTIONS', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'XACTIONS', NULL, NULL
GO
