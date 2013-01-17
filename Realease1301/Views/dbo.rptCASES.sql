SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [dbo].[rptCASES]
 
AS
SELECT     TOP (100) PERCENT dbo.SUBSCRIPTIONS.TMSUBNAME, dbo.CASEINVITES._SUBSCRIPTIONID AS TMSUBID, dbo.USERS.UserName AS CASEINVITEE, 
                      dbo.CASEINVITES.INVITEE, dbo.CASEINVITES.ID, dbo.CASEINVITES.TITLE, dbo.CASEINVITES.REFERENCE, dbo.CASEINVITES.PROJECT, dbo.CASEINVITES.STATUS, 
                      dbo.CASEINVITES.PRIORITY, dbo.CASEINVITES.IMPACT, dbo.CASEINVITES.RISK, dbo.CASEINVITES.ASSIGNEDTO, dbo.CASEINVITES.UPDATED, 
                      dbo.CASEINVITES.UPDATEDBY, dbo.CASEINVITES.ASSIGNEDBY, dbo.CASEINVITES.RAISED, dbo.CASEINVITES.MANAGEDBY, dbo.CASEINVITES.RAISEDBY, 
                      dbo.CASEINVITES.CASEID, dbo.CASEINVITES.OCURRED, dbo.CASEINVITES.PRODUCT, dbo.CASEINVITES.LOCATION, dbo.CASEINVITES.LOCATE, 
                      dbo.CASEINVITES.ORGANIZATION, dbo.CASEINVITES.CAT1, dbo.CASEINVITES.CAT2, dbo.CASEINVITES.CAT3, dbo.CASEINVITES.CAT4, dbo.CASEINVITES.CAT5, 
                      dbo.DESCRIPTIONS.NOTE AS CASEDESCRIPTION
FROM         dbo.CASEINVITES INNER JOIN
                      dbo.SUBSCRIPTIONS ON dbo.CASEINVITES._SUBSCRIPTIONID = dbo.SUBSCRIPTIONS.SUBSCRIPTIONID INNER JOIN
                      dbo.USERS ON dbo.CASEINVITES.INVITEE = dbo.USERS.UserId INNER JOIN
                      dbo.DESCRIPTIONS ON dbo.CASEINVITES.CASEID = dbo.DESCRIPTIONS.CASEID
WHERE     (dbo.DESCRIPTIONS.ACTIONID = 0) AND (dbo.CASEINVITES.STATUS = N'Open') OR
                      (dbo.CASEINVITES.STATUS = N'Pending') OR
                      (dbo.CASEINVITES.STATUS = N'New')
ORDER BY dbo.CASEINVITES.STATUS DESC, dbo.CASEINVITES.UPDATED DESC



GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[8] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[46] 4[48] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4[55] 2[21] 3) )"
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
         Configuration = "(H (4[50] 3) )"
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
               Left = 332
               Bottom = 409
               Right = 522
            End
            DisplayFlags = 280
            TopColumn = 12
         End
         Begin Table = "SUBSCRIPTIONS"
            Begin Extent = 
               Top = 130
               Left = 30
               Bottom = 247
               Right = 204
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS"
            Begin Extent = 
               Top = 257
               Left = 23
               Bottom = 374
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DESCRIPTIONS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
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
         Width =', 'SCHEMA', N'dbo', 'VIEW', N'rptCASES', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N' 1500
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
         Column = 1440
         Alias = 2280
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
', 'SCHEMA', N'dbo', 'VIEW', N'rptCASES', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'rptCASES', NULL, NULL
GO
