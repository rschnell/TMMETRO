SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.CASEY
AS
SELECT TOP (100) PERCENT dbo.CASES.CASEID, dbo.CASES.REFERENCE, dbo.CASES.TITLE, CASESTREE_12.NODENAME AS Project, CASESTREE_1.NODENAME AS Status, 
               CASESTREE_2.NODENAME AS Priority, CASESTREE_3.NODENAME AS Impact, CASESTREE_8.NODENAME AS Risk, USERS_4.UserName AS [Assigned to], 
               dbo.CASES._CMSDATEUPDATED AS [Date Updated], USERS_1.UserName AS [Updated By], 0 AS DEADLINEDAYS, USERS_3.UserName AS [Assigned By], 
               dbo.CASES._CMSDATERAISED AS [Date Raised], USERS_2.UserName AS [Managed By], dbo.USERS.UserName AS [Raised By], dbo.CASES._CMSDATEEND AS DEADLINE, 0 AS ACTIONID, 
               dbo.CASES._CMSDATEOCCURED AS [Date Occured], CASESTREE_10.NODENAME AS PRODUCT, CASESTREE_13.NODENAME AS [Assigned To Location], 
               CASESTREE_14.NODENAME AS [Raised By Location], CASESTREE_11.NODENAME AS [Company Name], CASESTREE_4.NODENAME AS [Incident Type], 
               CASESTREE_6.NODENAME AS [Incident Location], CASESTREE_7.NODENAME AS [Function], CASESTREE_9.NODENAME AS Evidence, 'NONE' AS DESCRIPTION, dbo.CASES.ISSTICKY, 
               dbo.CASES.CASEID AS ID, dbo.CASES.REPORTEDBY AS [Reported By], dbo.CASES.EVENTDESCRIPTION, dbo.CASES.FILENO, dbo.CASES.RECOVEREDVALUE AS [Recovered Local], 
               dbo.CASES.TOTALVALUE AS [Total Local], dbo.CASES.EVENTTIME, dbo.CASES.EVENTDATE, dbo.CASES.ISFLAG1, dbo.CASES.ISFLAG2, dbo.CASES.REFERENCE1, dbo.CASES.REFERENCE2, 
               dbo.CASES.REFERENCE3, dbo.CASES.REFERENCE4, dbo.CASES.ACTIVE, dbo.CASES.PREVENTEDVALUE, dbo.CASES.REFERENCE6, dbo.CASES.REFERENCE5, dbo.CASES.EXTLOCATION, 
               dbo.CASES.EXTLOCATIONLINE1, dbo.CASES.EXTLOCATIONLINE2, dbo.CASES.EXTLOCATIONLINE3, dbo.CASES.EXTLOCATIONLINE4, CASESTREE_15.NODENAME AS [Store Area], 
               CASESTREE_16.NODENAME AS Consequences, CASESTREE_18.NODENAME AS [Police Stations], CASESTREE_19.NODENAME AS [Detected By], 
               CASESTREE_17.NODENAME AS [Assets Affected], dbo.SUBSCRIPTIONS.TMROLE AS [COMPANY CODE], dbo.SUBSCRIPTIONS.SITECODE AS THEME, 
               dbo.SUBSCRIPTIONS.DESCRIPTION AS [Company Title], dbo.CASES.SUBSCRIPTIONID AS GROUPID, dbo.CASES.Declared_USD AS [Recovered EUR], dbo.CASES.Declared_EUR AS [Total EUR], 
               dbo.SUBSCRIPTIONCURRENCIES.CURRENCY_CODE AS [Currency Code], dbo.SUBSCRIPTIONCURRENCIES.COUNTRY_CODE AS [Country Code], dbo.SUBSCRIPTIONCURRENCIES.COMPANY, 
               dbo.SUBSCRIPTIONCURRENCIES.[Country Name], dbo.CASESTREETERMS.BASETERM + N' ' + dbo.CASESTREETERMS.TEXT1 AS FACILITY
FROM  dbo.CASES LEFT OUTER JOIN
               dbo.SUBSCRIPTIONS ON dbo.CASES.SUBSCRIPTIONID = dbo.SUBSCRIPTIONS.SUBSCRIPTIONID LEFT OUTER JOIN
               dbo.SUBSCRIPTIONCURRENCIES ON dbo.SUBSCRIPTIONS.SUBSCRIPTIONID = dbo.SUBSCRIPTIONCURRENCIES.SUBSCRIPTIONID LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_8 ON dbo.CASES._CMSRISKOF = CASESTREE_8.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREETERMS ON dbo.CASES._CMSCAT2OF = dbo.CASESTREETERMS.TREEID LEFT OUTER JOIN
               dbo.USERS AS USERS_4 ON dbo.CASES._CMSUSERSASSIGNEDTO = USERS_4.UserId LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_19 ON dbo.CASES._CMSCAT10Of = CASESTREE_19.NODEVALUE LEFT OUTER JOIN
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
               dbo.CASESTREE AS CASESTREE_13 ON dbo.CASES._CMSLOCATIONSDELIVERTO = CASESTREE_13.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_6 ON dbo.CASES._CMSCAT3OF = CASESTREE_6.NODEVALUE LEFT OUTER JOIN
               dbo.USERS AS USERS_2 ON dbo.CASES._CMSUSERSMANAGEDBY = USERS_2.UserId LEFT OUTER JOIN
               dbo.USERS AS USERS_3 ON dbo.CASES._CMSUSERSASSIGNEDBY = USERS_3.UserId LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_1 ON dbo.CASES._CMSSTATUSOF = CASESTREE_1.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_2 ON dbo.CASES._CMSPRIORITYOF = CASESTREE_2.NODEVALUE
WHERE (NOT (USERS_3.UserName IS NULL)) AND (NOT (USERS_4.UserName IS NULL)) AND (dbo.CASESTREETERMS.BASETERM + N' ' + dbo.CASESTREETERMS.TEXT1 <> N'') AND 
               (NOT (dbo.CASES.REFERENCE = 'NA')) AND (NOT (LEFT(dbo.CASES.REFERENCE, 1) = '-')) AND (NOT (dbo.CASES._CMSUSERSMANAGEDBY IS NULL)) AND 
               (NOT (dbo.CASES.REPORTEDBY = 'NA')) AND (dbo.SUBSCRIPTIONS.SITECODE IS NOT NULL) AND (CASESTREE_1.NODENAME = N'Open' OR
               CASESTREE_1.NODENAME = N'Closed')
ORDER BY dbo.CASES.CASEID
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
         Begin Table = "CASES"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 150
               Right = 309
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "SUBSCRIPTIONS"
            Begin Extent = 
               Top = 154
               Left = 48
               Bottom = 297
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SUBSCRIPTIONCURRENCIES"
            Begin Extent = 
               Top = 301
               Left = 48
               Bottom = 444
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_8"
            Begin Extent = 
               Top = 448
               Left = 48
               Bottom = 591
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREETERMS"
            Begin Extent = 
               Top = 448
               Left = 280
               Bottom = 591
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS_4"
            Begin Extent = 
               Top = 595
               Left = 48
               Bottom = 738
               Right = 309
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_19"
            Begin Extent = 
               Top = 742
               Left = 48
               Bottom = 885
               Right = 232
            En', 'SCHEMA', N'dbo', 'VIEW', N'CASEY', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'd
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_17"
            Begin Extent = 
               Top = 742
               Left = 280
               Bottom = 885
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_18"
            Begin Extent = 
               Top = 889
               Left = 48
               Bottom = 1032
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_16"
            Begin Extent = 
               Top = 889
               Left = 280
               Bottom = 1032
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_15"
            Begin Extent = 
               Top = 1036
               Left = 48
               Bottom = 1179
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS"
            Begin Extent = 
               Top = 1183
               Left = 48
               Bottom = 1326
               Right = 309
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_3"
            Begin Extent = 
               Top = 1036
               Left = 280
               Bottom = 1179
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_10"
            Begin Extent = 
               Top = 1330
               Left = 48
               Bottom = 1473
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_4"
            Begin Extent = 
               Top = 1330
               Left = 280
               Bottom = 1473
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS_1"
            Begin Extent = 
               Top = 1477
               Left = 48
               Bottom = 1620
               Right = 309
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_9"
            Begin Extent = 
               Top = 1624
               Left = 48
               Bottom = 1767
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_11"
            Begin Extent = 
               Top = 1624
               Left = 280
               Bottom = 1767
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_7"
            Begin Extent = 
               Top = 1771
               Left = 48
               Bottom = 1914
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_14"
            Begin Extent = 
               Top = 1771
               Left = 280
               Bottom = 1914
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_12"
            Begin Extent = 
               Top = 1918
               Left = 48
               Bottom = 2061
               Right = 232
           ', 'SCHEMA', N'dbo', 'VIEW', N'CASEY', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane3', N' End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_13"
            Begin Extent = 
               Top = 1918
               Left = 280
               Bottom = 2061
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_6"
            Begin Extent = 
               Top = 2065
               Left = 48
               Bottom = 2208
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS_2"
            Begin Extent = 
               Top = 2212
               Left = 48
               Bottom = 2355
               Right = 309
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS_3"
            Begin Extent = 
               Top = 2359
               Left = 48
               Bottom = 2502
               Right = 309
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_1"
            Begin Extent = 
               Top = 2065
               Left = 280
               Bottom = 2208
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_2"
            Begin Extent = 
               Top = 2506
               Left = 48
               Bottom = 2649
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
      Begin ColumnWidths = 9
         Width = 284
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
', 'SCHEMA', N'dbo', 'VIEW', N'CASEY', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=3
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'CASEY', NULL, NULL
GO
