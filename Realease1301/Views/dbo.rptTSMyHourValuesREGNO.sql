SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.rptTSMyHourValuesREGNO
AS
SELECT YEAR(dbo.MYHOURVALUES.ACTIVITYDATE) * 100 + MONTH(dbo.MYHOURVALUES.ACTIVITYDATE) AS YEARMONTH, dbo.MYHOURVALUES.ENTRYNO, 
               USERS_1.ManagerName AS [License NO], USERS_1.ManagerEmail AS [Detective Email], dbo.MYHOURVALUES.ACTIVITYDATE AS [Activity Date], dbo.MYHOURVALUES.HOURS, 
               dbo.MYHOURVALUES.ACTIVITY AS [Activity Description], dbo.MYHOURVALUES.TYPEID AS [Cost Type], dbo.MYHOURVALUES.HOURSTYPE, dbo.MYHOURVALUES.UserName, 
               dbo.MYHOURVALUES.USERID, dbo.CUSTOMERS.COMPANYCODE, dbo.CUSTOMERS.COMPANYNAME AS Agency, dbo.CUSTOMERS.RATE2PERHOUR, dbo.CUSTOMERS.RATE3PERHOUR, 
               dbo.CUSTOMERS.RATE4PERHOUR, dbo.CUSTOMERS.ADDRESSLINE1, dbo.CUSTOMERS.ADDRESSLINE2, dbo.CUSTOMERS.CITY, dbo.CUSTOMERS.POSTCODE, dbo.CUSTOMERS.TELEPHONE, 
               dbo.CUSTOMERS.EMAIL, USERS_1.LastName AS [Detective LastName], USERS_1.FirstName AS [Detective FirstName], YEAR(dbo.MYHOURVALUES.ACTIVITYDATE) AS YEARNO, 
               MONTH(dbo.MYHOURVALUES.ACTIVITYDATE) AS MONTHNO, DAY(dbo.MYHOURVALUES.ACTIVITYDATE) AS DAYNO, dbo.MYHOURVALUES.WEEKNO AS [Week No], 
               CASESTREE_1.NODENAME AS FACILITY, dbo.MYHOURVALUES.ValueToDate, dbo.MYHOURVALUES.ValueFromDate, CAST(DATEPART(hour, dbo.MYHOURVALUES.ValueFromDate) 
               AS VARCHAR(2)) + ':' + CAST(DATEPART(minute, dbo.MYHOURVALUES.ValueFromDate) AS VARCHAR(2)) AS STARTTIME, CAST(DATEPART(hour, dbo.MYHOURVALUES.ValueToDate) 
               AS VARCHAR(2)) + ':' + CAST(DATEPART(minute, dbo.MYHOURVALUES.ValueToDate) AS VARCHAR(2)) AS ENDTIME, dbo.MYHOURVALUES.PAUSE, CASESTREE_1.NODEVALUE AS FACILITYID, 
               dbo.MYHOURVALUES.RATE AS RATE1PERHOUR, dbo.CUSTOMERS.REGNO
FROM  dbo.USERS AS USERS_1 RIGHT OUTER JOIN
               dbo.CUSTOMERS INNER JOIN
               dbo.CUSTOMERSXUSERS ON dbo.CUSTOMERS.CUSTOMERID = dbo.CUSTOMERSXUSERS.CUSTOMERID INNER JOIN
               dbo.ALLUSERS INNER JOIN
               dbo.MYHOURVALUES ON dbo.ALLUSERS.UserId = dbo.MYHOURVALUES.USERID INNER JOIN
               dbo.CASESTREE AS CASESTREE_1 ON dbo.MYHOURVALUES.LOCATIONID = CASESTREE_1.NODEVALUE ON dbo.CUSTOMERSXUSERS.USERID = dbo.ALLUSERS.UserId ON 
               USERS_1.UserId = dbo.ALLUSERS.UserId
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[38] 4[35] 2[5] 3) )"
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
         Begin Table = "USERS_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 266
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMERS"
            Begin Extent = 
               Top = 6
               Left = 304
               Bottom = 125
               Right = 493
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CUSTOMERSXUSERS"
            Begin Extent = 
               Top = 6
               Left = 531
               Bottom = 110
               Right = 691
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ALLUSERS"
            Begin Extent = 
               Top = 114
               Left = 531
               Bottom = 233
               Right = 759
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MYHOURVALUES"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 245
               Right = 200
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_1"
            Begin Extent = 
               Top = 126
               Left = 238
               Bottom = 245
               Right = 398
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
      Begin ColumnWidths = 38
         Width = 284
         Width = 1200
         W', 'SCHEMA', N'dbo', 'VIEW', N'rptTSMyHourValuesREGNO', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'idth = 1200
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
      Begin ColumnWidths = 11
         Column = 6960
         Alias = 1656
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
', 'SCHEMA', N'dbo', 'VIEW', N'rptTSMyHourValuesREGNO', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'rptTSMyHourValuesREGNO', NULL, NULL
GO
