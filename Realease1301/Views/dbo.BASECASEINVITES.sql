SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.BASECASEINVITES
WITH SCHEMABINDING 
AS
SELECT DISTINCT 
               dbo.CASES.TITLE, dbo.CASES.REFERENCE, dbo.CASES._CMSPROJECTCONTAINS, dbo.CASES._CMSSTATUSOF, dbo.CASES._CMSPRIORITYOF, 
               dbo.CASES._CMSIMPACTOF, dbo.CASES._CMSRISKOF, dbo.CASES._CMSUSERSASSIGNEDTO, dbo.CASES._CMSDATEUPDATED, 
               dbo.CASES._CMSUSERSUPDATED, 0 AS DEADLINEDAYS, dbo.CASES._CMSUSERSASSIGNEDBY, dbo.CASES._CMSDATERAISED, 
               dbo.CASES._CMSUSERSMANAGEDBY, dbo.CASES._CMSUSERSRAISEDBY, dbo.CASES._CMSDATEEND, dbo.CASES.CASEID, dbo.CASESXUSERS.ACTIONID, 
               dbo.CASES._CMSDATEOCCURED, dbo.CASES._CMSPRODUCTCONTAINS, dbo.CASES._CMSLOCATIONSRAISEDBY, dbo.CASES._CMSLOCATIONSDELIVERTO, 
               dbo.CASES.GROUPID, dbo.CASES._CMSCAT1OF, dbo.CASES._CMSCAT2OF, dbo.CASES._CMSCAT3OF, dbo.CASES._CMSCAT4Of, dbo.CASES._CMSCAT5Of, 
               'NONE' AS DESCRIPTION, dbo.CASES.ISSTICKY, dbo.CASES.SUBSCRIPTIONID AS _SUBSCRIPTIONID, dbo.CASES.ISUNMANAGED AS _ISUNMANAGED, 
               dbo.USERS.UserId AS INVITEE, dbo.CASES.ID, dbo.CASES.REPORTEDBY, dbo.USERS.Guest, dbo.USERS.FirstName, dbo.USERS.LastName, 
               dbo.USERS.UserName, dbo.CASES.ACTIVE, dbo.CASES.PREVENTEDVALUE, dbo.CASES.REFERENCE6, dbo.CASES.REFERENCE5, dbo.CASES.REFERENCE4, 
               dbo.CASES.REFERENCE3, dbo.CASES.REFERENCE2, dbo.CASES.REFERENCE1, dbo.CASES.ISFLAG2, dbo.CASES.ISFLAG1, dbo.CASES.EVENTDATE, 
               dbo.CASES.EVENTTIME, dbo.CASES.TOTALVALUE, dbo.CASES.RECOVEREDVALUE, dbo.CASES.FILENO, dbo.CASES.EVENTDESCRIPTION, 
               dbo.CASES.EXTLOCATION, dbo.CASES.EXTLOCATIONLINE1, dbo.CASES.EXTLOCATIONLINE2, dbo.CASES.EXTLOCATIONLINE3, 
               dbo.CASES.EXTLOCATIONLINE4, dbo.CASES._CMSCAT6Of, dbo.CASES._CMSCAT7Of, dbo.CASES._CMSCAT8Of, dbo.CASES._CMSCAT9Of, 
               dbo.CASES._CMSCAT10Of
FROM  dbo.CASES INNER JOIN
               dbo.CASESXUSERS ON dbo.CASES.CASEID = dbo.CASESXUSERS.CASEID INNER JOIN
               dbo.USERS ON dbo.CASESXUSERS.USERID = dbo.USERS.UserId
WHERE (dbo.CASESXUSERS.ACTIONID = 0)
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[28] 4[33] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[25] 4[50] 3) )"
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
         Configuration = "(H (1[31] 4) )"
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
      ActivePaneConfig = 12
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CASES"
            Begin Extent = 
               Top = 4
               Left = 496
               Bottom = 413
               Right = 725
            End
            DisplayFlags = 280
            TopColumn = 37
         End
         Begin Table = "CASESXUSERS"
            Begin Extent = 
               Top = 0
               Left = 266
               Bottom = 117
               Right = 426
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS"
            Begin Extent = 
               Top = 3
               Left = 9
               Bottom = 120
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 16
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 40
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
         Width ', 'SCHEMA', N'dbo', 'VIEW', N'BASECASEINVITES', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'= 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 2628
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
', 'SCHEMA', N'dbo', 'VIEW', N'BASECASEINVITES', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'BASECASEINVITES', NULL, NULL
GO
