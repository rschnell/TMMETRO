SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[rptCASESMETRO]
AS
SELECT     TOP (100) PERCENT dbo.SUBSCRIPTIONCURRENCIES.COUNTRY_CODE AS [Country Code], dbo.SUBSCRIPTIONCURRENCIES.COMPANY, 
                      dbo.CASEINVITES._SUBSCRIPTIONID AS [Group ID], dbo.CASEINVITES.ID AS [Incident No.], dbo.CASEINVITES.INVITEE AS [Invitee ID], dbo.CASEINVITES.REFERENCE, 
                      dbo.USERS.UserName AS [Invitee Name], dbo.CASEINVITES.OCURRED AS [Date Occured], dbo.CASEINVITES.LOCATE AS [Assigned To Location], 
                      dbo.CASEINVITES.ORGANIZATION AS [Company Name], dbo.CASEINVITES.STATUS, dbo.CASEINVITES.PRIORITY, dbo.CASEINVITES.UPDATED AS [Date Updated], 
                      dbo.CASEINVITES.ASSIGNEDTO AS [Assigned To], dbo.CASEINVITES.UPDATEDBY AS [Updated By], dbo.CASEINVITES.ASSIGNEDBY AS [Assigned By], 
                      dbo.CASEINVITES.RAISED AS [Date Raised], dbo.CASEINVITES.MANAGEDBY AS [Managed By], dbo.CASEINVITES.RAISEDBY AS [Raised By], 
                      dbo.CASEINVITES.EVENTDATE AS [Event Date], dbo.CASEINVITES.EVENTTIME AS [Event Time], dbo.CASEINVITES.PRODUCT AS [Product Group], 
                      dbo.CASEINVITES.CAT1 AS [Incident Type], dbo.CASEINVITES.CAT2 AS Facility, dbo.CASEINVITES.CAT3 AS Location, dbo.CASEINVITES.CAT4 AS [Function], 
                      dbo.CASEINVITES.CAT5 AS [Store Area], dbo.CASEINVITES.CAT6 AS Evidence, dbo.CASEINVITES.CAT7 AS Conequences, dbo.CASEINVITES.CAT8 AS [Police Stations], 
                      dbo.CASEINVITES.CAT10 AS [Detected By], dbo.CASEINVITES.CAT9 AS [Assets Affected], dbo.CASES.Declared_USD AS [Recovered EUR], 
                      dbo.CASES.Declared_EUR AS [Total EUR], dbo.SUBSCRIPTIONCURRENCIES.CURRENCY_CODE AS [Currency Code], dbo.CASEINVITES.TOTALVALUE AS [Total Local], 
                      dbo.CASEINVITES.RECOVEREDVALUE AS [Recovered Local]
FROM         dbo.CASEINVITES INNER JOIN
                      dbo.USERS ON dbo.CASEINVITES.INVITEE = dbo.USERS.UserId INNER JOIN
                      dbo.SUBSCRIPTIONCURRENCIES ON dbo.CASEINVITES._SUBSCRIPTIONID = dbo.SUBSCRIPTIONCURRENCIES.SUBSCRIPTIONID INNER JOIN
                      dbo.CASES ON dbo.CASEINVITES.CASEID = dbo.CASES.CASEID
WHERE     (dbo.CASEINVITES.STATUS = N'Open') OR
                      (dbo.CASEINVITES.STATUS = N'Pending') OR
                      (dbo.CASEINVITES.STATUS = N'New')
ORDER BY dbo.CASEINVITES.STATUS DESC, [Date Updated] DESC

GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[7] 4[69] 2[5] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[47] 4[30] 3) )"
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
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 1
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CASEINVITES"
            Begin Extent = 
               Top = 0
               Left = 35
               Bottom = 673
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 15
         End
         Begin Table = "USERS"
            Begin Extent = 
               Top = 6
               Left = 468
               Bottom = 123
               Right = 696
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SUBSCRIPTIONCURRENCIES"
            Begin Extent = 
               Top = 119
               Left = 891
               Bottom = 473
               Right = 1068
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "CASES"
            Begin Extent = 
               Top = 6
               Left = 1106
               Bottom = 338
               Right = 1335
            End
            DisplayFlags = 280
            TopColumn = 70
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 43
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
         ', 'SCHEMA', N'dbo', 'VIEW', N'rptCASESMETRO', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'Width = 1500
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2955
         Alias = 4245
         Table = 5130
         Output = 6285
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
', 'SCHEMA', N'dbo', 'VIEW', N'rptCASESMETRO', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'rptCASESMETRO', NULL, NULL
GO
