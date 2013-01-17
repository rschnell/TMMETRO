SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[ALLCASES]
AS
SELECT     dbo.CASES.TITLE, dbo.CASES.REFERENCE, CASESTREE_12.NODENAME AS PROJECT, CASESTREE_1.NODENAME AS STATUS, 
                      CASESTREE_2.NODENAME AS PRIORITY, CASESTREE_3.NODENAME AS IMPACT, CASESTREE_8.NODENAME AS RISK, USERS_4.UserName AS ASSIGNEDTO, 
                      dbo.CASES._CMSDATEUPDATED AS UPDATED, USERS_1.UserName AS UPDATEDBY, 0 AS DEADLINEDAYS, USERS_3.UserName AS ASSIGNEDBY, 
                      dbo.CASES._CMSDATERAISED AS RAISED, USERS_2.UserName AS MANAGEDBY, dbo.USERS.UserName AS RAISEDBY, dbo.CASES._CMSDATEEND AS DEADLINE, 
                      dbo.CASES.CASEID, 0 AS ACTIONID, dbo.CASES._CMSDATEOCCURED AS OCURRED, CASESTREE_10.NODENAME AS PRODUCT, 
                      CASESTREE_13.NODENAME AS LOCATION, CASESTREE_14.NODENAME AS LOCATE, CASESTREE_11.NODENAME AS ORGANIZATION, 
                      CASESTREE_4.NODENAME AS CAT1, CASESTREE_5.NODENAME AS CAT2, CASESTREE_6.NODENAME AS CAT3, CASESTREE_7.NODENAME AS CAT4, 
                      CASESTREE_9.NODENAME AS CAT5, 'NONE' AS DESCRIPTION, dbo.CASES.ISSTICKY, dbo.CASES.SUBSCRIPTIONID AS _SUBSCRIPTIONID, dbo.CASES.CASEID AS ID, 
                      dbo.CASES.REPORTEDBY, dbo.CASES.EVENTDESCRIPTION, dbo.CASES.FILENO, dbo.CASES.RECOVEREDVALUE, dbo.CASES.TOTALVALUE, dbo.CASES.EVENTTIME, 
                      dbo.CASES.EVENTDATE, dbo.CASES.ISFLAG1, dbo.CASES.ISFLAG2, dbo.CASES.REFERENCE1, dbo.CASES.REFERENCE2, dbo.CASES.REFERENCE3, 
                      dbo.CASES.REFERENCE4, dbo.CASES.ACTIVE, dbo.CASES.PREVENTEDVALUE, dbo.CASES.REFERENCE6, dbo.CASES.REFERENCE5, dbo.CASES.EXTLOCATION, 
                      dbo.CASES.EXTLOCATIONLINE1, dbo.CASES.EXTLOCATIONLINE2, dbo.CASES.EXTLOCATIONLINE3, dbo.CASES.EXTLOCATIONLINE4, 
                      CASESTREE_15.NODENAME AS CAT6, CASESTREE_16.NODENAME AS CAT7, CASESTREE_18.NODENAME AS CAT8, dbo.CASESTREE.NODENAME AS CAT10, 
                      CASESTREE_17.NODENAME AS CAT9
FROM         dbo.CASES INNER JOIN
                      dbo.CASESTREE AS CASESTREE_8 ON dbo.CASES._CMSRISKOF = CASESTREE_8.NODEVALUE LEFT OUTER JOIN
                      dbo.USERS AS USERS_4 ON dbo.CASES._CMSUSERSASSIGNEDTO = USERS_4.UserId LEFT OUTER JOIN
                      dbo.CASESTREE ON dbo.CASES._CMSCAT10Of = dbo.CASESTREE.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_17 ON dbo.CASES._CMSCAT9Of = CASESTREE_17.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_18 ON dbo.CASES._CMSCAT8Of = CASESTREE_18.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_16 ON dbo.CASES._CMSCAT7Of = CASESTREE_16.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_15 ON dbo.CASES._CMSCAT6Of = CASESTREE_15.NODEVALUE LEFT OUTER JOIN
                      dbo.USERS ON dbo.CASES._CMSUSERSRAISEDBY = dbo.USERS.UserId LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_3 ON dbo.CASES._CMSIMPACTOF = CASESTREE_3.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_10 ON dbo.CASES._CMSPRODUCTCONTAINS = CASESTREE_10.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_4 ON dbo.CASES._CMSCAT1OF = CASESTREE_4.NODEVALUE LEFT OUTER JOIN
                      dbo.USERS AS USERS_1 ON dbo.CASES._CMSUSERSUPDATED = USERS_1.UserId LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_9 ON dbo.CASES._CMSCAT5Of = CASESTREE_9.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_11 ON dbo.CASES.GROUPID = CASESTREE_11.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_7 ON dbo.CASES._CMSCAT4Of = CASESTREE_7.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_14 ON dbo.CASES._CMSLOCATIONSRAISEDBY = CASESTREE_14.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_12 ON dbo.CASES._CMSPROJECTCONTAINS = CASESTREE_12.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_5 ON dbo.CASES._CMSCAT2OF = CASESTREE_5.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_13 ON dbo.CASES._CMSLOCATIONSDELIVERTO = CASESTREE_13.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_6 ON dbo.CASES._CMSCAT3OF = CASESTREE_6.NODEVALUE LEFT OUTER JOIN
                      dbo.USERS AS USERS_2 ON dbo.CASES._CMSUSERSMANAGEDBY = USERS_2.UserId LEFT OUTER JOIN
                      dbo.USERS AS USERS_3 ON dbo.CASES._CMSUSERSASSIGNEDBY = USERS_3.UserId LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_1 ON dbo.CASES._CMSSTATUSOF = CASESTREE_1.NODEVALUE LEFT OUTER JOIN
                      dbo.CASESTREE AS CASESTREE_2 ON dbo.CASES._CMSPRIORITYOF = CASESTREE_2.NODEVALUE

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
         Configuration = "(H (1[50] 4[43] 3) )"
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
         Configuration = "(H (2[73] 3) )"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4[50] 3) )"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3) )"
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
      ActivePaneConfig = 3
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CASES"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 258
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_8"
            Begin Extent = 
               Top = 6
               Left = 296
               Bottom = 114
               Right = 447
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS_4"
            Begin Extent = 
               Top = 6
               Left = 485
               Bottom = 114
               Right = 704
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE"
            Begin Extent = 
               Top = 6
               Left = 742
               Bottom = 114
               Right = 893
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_17"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_18"
            Begin Extent = 
               Top = 114
               Left = 227
               Bottom = 222
               Right = 378
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_16"
            Begin Extent = 
               Top = 114
               Left = 416
               Bottom = 222
               Right = 567
            ', 'SCHEMA', N'dbo', 'VIEW', N'ALLCASES', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_15"
            Begin Extent = 
               Top = 114
               Left = 605
               Bottom = 222
               Right = 756
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS"
            Begin Extent = 
               Top = 114
               Left = 794
               Bottom = 222
               Right = 1013
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_3"
            Begin Extent = 
               Top = 222
               Left = 38
               Bottom = 330
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_10"
            Begin Extent = 
               Top = 222
               Left = 227
               Bottom = 330
               Right = 378
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_4"
            Begin Extent = 
               Top = 222
               Left = 416
               Bottom = 330
               Right = 567
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS_1"
            Begin Extent = 
               Top = 222
               Left = 605
               Bottom = 330
               Right = 824
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_9"
            Begin Extent = 
               Top = 222
               Left = 862
               Bottom = 330
               Right = 1013
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_11"
            Begin Extent = 
               Top = 330
               Left = 38
               Bottom = 438
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_7"
            Begin Extent = 
               Top = 330
               Left = 227
               Bottom = 438
               Right = 378
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_14"
            Begin Extent = 
               Top = 330
               Left = 416
               Bottom = 438
               Right = 567
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_12"
            Begin Extent = 
               Top = 330
               Left = 605
               Bottom = 438
               Right = 756
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_5"
            Begin Extent = 
               Top = 330
               Left = 794
               Bottom = 438
               Right = 945
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_13"
            Begin Extent = 
               Top = 438
               Left = 38
               Bottom = 546
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_6"
            Begin Extent = 
               Top = 438
               Left = 227
               Bottom = 546
               Right = 378
            End
           ', 'SCHEMA', N'dbo', 'VIEW', N'ALLCASES', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane3', N' DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS_2"
            Begin Extent = 
               Top = 438
               Left = 416
               Bottom = 546
               Right = 635
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS_3"
            Begin Extent = 
               Top = 438
               Left = 673
               Bottom = 546
               Right = 892
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_1"
            Begin Extent = 
               Top = 546
               Left = 38
               Bottom = 654
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_2"
            Begin Extent = 
               Top = 546
               Left = 227
               Bottom = 654
               Right = 378
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
         Width = 3675
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
         Column = 3525
         Alias = 2805
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
', 'SCHEMA', N'dbo', 'VIEW', N'ALLCASES', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=3
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'ALLCASES', NULL, NULL
GO
