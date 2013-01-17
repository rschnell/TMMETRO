SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.CASEINVITES
AS
SELECT dbo.BASECASEINVITES.TITLE, dbo.BASECASEINVITES.REFERENCE, CASESTREE_12.NODENAME AS PROJECT, CASESTREE_1.NODENAME AS STATUS, 
               CASESTREE_2.NODENAME AS PRIORITY, CASESTREE_3.NODENAME AS IMPACT, CASESTREE_8.NODENAME AS RISK, USERS_4.UserName AS ASSIGNEDTO, 
               dbo.BASECASEINVITES._CMSDATEUPDATED AS UPDATED, USERS_1.UserName AS UPDATEDBY, 0 AS DEADLINEDAYS, USERS_3.UserName AS ASSIGNEDBY, 
               dbo.BASECASEINVITES._CMSDATERAISED AS RAISED, USERS_2.UserName AS MANAGEDBY, dbo.USERS.UserName AS RAISEDBY, 
               dbo.BASECASEINVITES._CMSDATEEND AS DEADLINE, dbo.BASECASEINVITES.CASEID, 0 AS ACTIONID, 
               dbo.BASECASEINVITES._CMSDATEOCCURED AS OCURRED, CASESTREE_10.NODENAME AS PRODUCT, CASESTREE_13.NODENAME AS LOCATION, 
               CASESTREE_14.NODENAME AS LOCATE, CASESTREE_11.NODENAME AS ORGANIZATION, CASESTREE_4.NODENAME AS CAT1, 
               CASESTREE_5.NODENAME AS CAT2, CASESTREE_6.NODENAME AS CAT3, CASESTREE_7.NODENAME AS CAT4, CASESTREE_9.NODENAME AS CAT5, 
               'NONE' AS DESCRIPTION, dbo.BASECASEINVITES.ISSTICKY, dbo.BASECASEINVITES._SUBSCRIPTIONID, dbo.BASECASEINVITES._ISUNMANAGED, 
               dbo.BASECASEINVITES.INVITEE, dbo.BASECASEINVITES.CASEID AS ID, dbo.BASECASEINVITES.REPORTEDBY, dbo.BASECASEINVITES.Guest, 
               dbo.BASECASEINVITES.FirstName, dbo.BASECASEINVITES.LastName, dbo.BASECASEINVITES.UserName, dbo.BASECASEINVITES.EVENTDESCRIPTION, 
               dbo.BASECASEINVITES.FILENO, dbo.BASECASEINVITES.RECOVEREDVALUE, dbo.BASECASEINVITES.TOTALVALUE, dbo.BASECASEINVITES.EVENTTIME, 
               dbo.BASECASEINVITES.EVENTDATE, dbo.BASECASEINVITES.ISFLAG1, dbo.BASECASEINVITES.ISFLAG2, dbo.BASECASEINVITES.REFERENCE1, 
               dbo.BASECASEINVITES.REFERENCE2, dbo.BASECASEINVITES.REFERENCE3, dbo.BASECASEINVITES.REFERENCE4, dbo.BASECASEINVITES.ACTIVE, 
               dbo.BASECASEINVITES.PREVENTEDVALUE, dbo.BASECASEINVITES.REFERENCE6, dbo.BASECASEINVITES.REFERENCE5, 
               dbo.BASECASEINVITES.EXTLOCATION, dbo.BASECASEINVITES.EXTLOCATIONLINE1, dbo.BASECASEINVITES.EXTLOCATIONLINE2, 
               dbo.BASECASEINVITES.EXTLOCATIONLINE3, dbo.BASECASEINVITES.EXTLOCATIONLINE4, CASESTREE_15.NODENAME AS CAT6, 
               CASESTREE_16.NODENAME AS CAT7, CASESTREE_18.NODENAME AS CAT8, dbo.CASESTREE.NODENAME AS CAT10, 
               CASESTREE_17.NODENAME AS CAT9
FROM  dbo.BASECASEINVITES INNER JOIN
               dbo.CASESTREE AS CASESTREE_8 ON dbo.BASECASEINVITES._CMSRISKOF = CASESTREE_8.NODEVALUE LEFT OUTER JOIN
               dbo.USERS AS USERS_4 ON dbo.BASECASEINVITES._CMSUSERSASSIGNEDTO = USERS_4.UserId LEFT OUTER JOIN
               dbo.CASESTREE ON dbo.BASECASEINVITES._CMSCAT10Of = dbo.CASESTREE.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_17 ON dbo.BASECASEINVITES._CMSCAT9Of = CASESTREE_17.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_18 ON dbo.BASECASEINVITES._CMSCAT8Of = CASESTREE_18.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_16 ON dbo.BASECASEINVITES._CMSCAT7Of = CASESTREE_16.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_15 ON dbo.BASECASEINVITES._CMSCAT6Of = CASESTREE_15.NODEVALUE LEFT OUTER JOIN
               dbo.USERS ON dbo.BASECASEINVITES._CMSUSERSRAISEDBY = dbo.USERS.UserId LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_3 ON dbo.BASECASEINVITES._CMSIMPACTOF = CASESTREE_3.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_10 ON dbo.BASECASEINVITES._CMSPRODUCTCONTAINS = CASESTREE_10.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_4 ON dbo.BASECASEINVITES._CMSCAT1OF = CASESTREE_4.NODEVALUE LEFT OUTER JOIN
               dbo.USERS AS USERS_1 ON dbo.BASECASEINVITES._CMSUSERSUPDATED = USERS_1.UserId LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_9 ON dbo.BASECASEINVITES._CMSCAT5Of = CASESTREE_9.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_11 ON dbo.BASECASEINVITES.GROUPID = CASESTREE_11.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_7 ON dbo.BASECASEINVITES._CMSCAT4Of = CASESTREE_7.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_14 ON dbo.BASECASEINVITES._CMSLOCATIONSRAISEDBY = CASESTREE_14.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_12 ON dbo.BASECASEINVITES._CMSPROJECTCONTAINS = CASESTREE_12.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_5 ON dbo.BASECASEINVITES._CMSCAT2OF = CASESTREE_5.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_13 ON dbo.BASECASEINVITES._CMSLOCATIONSDELIVERTO = CASESTREE_13.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_6 ON dbo.BASECASEINVITES._CMSCAT3OF = CASESTREE_6.NODEVALUE LEFT OUTER JOIN
               dbo.USERS AS USERS_2 ON dbo.BASECASEINVITES._CMSUSERSMANAGEDBY = USERS_2.UserId LEFT OUTER JOIN
               dbo.USERS AS USERS_3 ON dbo.BASECASEINVITES._CMSUSERSASSIGNEDBY = USERS_3.UserId LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_1 ON dbo.BASECASEINVITES._CMSSTATUSOF = CASESTREE_1.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_2 ON dbo.BASECASEINVITES._CMSPRIORITYOF = CASESTREE_2.NODEVALUE
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[1] 2[40] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[61] 4[29] 3) )"
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
         Configuration = "(H (1[82] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4[79] 3) )"
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
         Begin Table = "BASECASEINVITES"
            Begin Extent = 
               Top = 0
               Left = 0
               Bottom = 187
               Right = 299
            End
            DisplayFlags = 280
            TopColumn = 21
         End
         Begin Table = "USERS_4"
            Begin Extent = 
               Top = 481
               Left = 993
               Bottom = 598
               Right = 1221
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_8"
            Begin Extent = 
               Top = 678
               Left = 977
               Bottom = 795
               Right = 1137
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE"
            Begin Extent = 
               Top = 677
               Left = 644
               Bottom = 818
               Right = 828
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_17"
            Begin Extent = 
               Top = 903
               Left = 1257
               Bottom = 1044
               Right = 1441
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_18"
            Begin Extent = 
               Top = 183
               Left = 875
               Bottom = 324
               Right = 1059
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_16"
            Begin Extent = 
               Top = 354
               Left = 811
               Bottom = 495
               Right = 995
            ', 'SCHEMA', N'dbo', 'VIEW', N'CASEINVITES', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_15"
            Begin Extent = 
               Top = 798
               Left = 978
               Bottom = 939
               Right = 1162
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS"
            Begin Extent = 
               Top = 6
               Left = 789
               Bottom = 133
               Right = 1127
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_3"
            Begin Extent = 
               Top = 6
               Left = 1165
               Bottom = 123
               Right = 1325
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_10"
            Begin Extent = 
               Top = 246
               Left = 1028
               Bottom = 363
               Right = 1188
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_4"
            Begin Extent = 
               Top = 126
               Left = 1102
               Bottom = 243
               Right = 1262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS_1"
            Begin Extent = 
               Top = 612
               Left = 304
               Bottom = 729
               Right = 532
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_9"
            Begin Extent = 
               Top = 479
               Left = 730
               Bottom = 596
               Right = 890
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_11"
            Begin Extent = 
               Top = 525
               Left = 715
               Bottom = 642
               Right = 875
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_7"
            Begin Extent = 
               Top = 509
               Left = 860
               Bottom = 626
               Right = 1020
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_14"
            Begin Extent = 
               Top = 217
               Left = 63
               Bottom = 334
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_12"
            Begin Extent = 
               Top = 465
               Left = 128
               Bottom = 582
               Right = 288
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_5"
            Begin Extent = 
               Top = 211
               Left = 55
               Bottom = 328
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_13"
            Begin Extent = 
               Top = 229
               Left = 0
               Bottom = 346
               Right = 160
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_6"
            Begin Extent = 
               Top = 305
               Left = 0
               Bottom = 422
               Right = 160
            End
           ', 'SCHEMA', N'dbo', 'VIEW', N'CASEINVITES', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane3', N' DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS_2"
            Begin Extent = 
               Top = 243
               Left = 0
               Bottom = 360
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS_3"
            Begin Extent = 
               Top = 670
               Left = 448
               Bottom = 787
               Right = 676
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_1"
            Begin Extent = 
               Top = 349
               Left = 540
               Bottom = 466
               Right = 700
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_2"
            Begin Extent = 
               Top = 267
               Left = 717
               Bottom = 384
               Right = 877
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
      Begin ColumnWidths = 65
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
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 3408
         Alias = 1860
         Table = 2484
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
', 'SCHEMA', N'dbo', 'VIEW', N'CASEINVITES', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=3
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'CASEINVITES', NULL, NULL
GO
