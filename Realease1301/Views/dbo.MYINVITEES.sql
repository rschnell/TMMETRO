SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.MYINVITEES
WITH SCHEMABINDING 
AS
SELECT dbo.USERS.UserId, dbo.SUBSXUSERS.SUBSCRIPTIONID AS SUBID, dbo.USERS.GROUPID, dbo.USERS.UserName, dbo.USERS.DNNNAME, dbo.USERS.Email, 
               dbo.USERS.LASTONLINE, dbo.USERS.LASTTIMEOUT, dbo.USERS.LastLogin, dbo.SUBSXUSERS.ISSUBMANAGER, dbo.USERS.SkypeHandle, dbo.USERS.Mood, 
               0 AS ONLINEMINS, 0 AS LOGINMINS, dbo.USERS.WebStatus, dbo.USERS.SkypeStatus, dbo.USERS.Confirmation, dbo.USERS.DepartmentID, 
               dbo.USERS.CountryID, dbo.USERS.ZipCode, dbo.USERS.City, dbo.USERS.Address2, dbo.USERS.Address1, dbo.USERS.MobilePhone, dbo.USERS.Fax, 
               dbo.USERS.Telephone, dbo.USERS.ManagerEmail, dbo.USERS.ManagerName, dbo.USERS.LASTLOGOUT, dbo.USERS.Created, dbo.USERS.Guest, 
               dbo.USERS.[External] AS EXTEAM, dbo.USERS.LastUpdate, dbo.SUBSXUSERS.ACTIVE, dbo.USERS.Admin, dbo.USERS.PassWord, dbo.USERS.DNN_USERID, 
               dbo.USERS.LastName, dbo.USERS.FirstName, dbo.USERS._CMSOrganizationBelongsTO, dbo.USERS.OFFSET, dbo.USERS.SUBSCRIPTIONID, 
               dbo.USERS.IMUserName, dbo.IMProviders.IMCode
FROM  dbo.SUBSXUSERS INNER JOIN
               dbo.USERS ON dbo.SUBSXUSERS.USERID = dbo.USERS.UserId INNER JOIN
               dbo.IMProviders ON dbo.USERS.IMProviderID = dbo.IMProviders.ID
WHERE (dbo.SUBSXUSERS.ACTIVE = 1)
GO
CREATE UNIQUE CLUSTERED INDEX [SUBUSERID] ON [dbo].[MYINVITEES] ([SUBID], [UserId]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[28] 4[36] 2[8] 3) )"
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
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[66] 3) )"
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
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SUBSXUSERS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 262
               Right = 284
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "USERS"
            Begin Extent = 
               Top = 23
               Left = 408
               Bottom = 240
               Right = 625
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "IMProviders"
            Begin Extent = 
               Top = 145
               Left = 877
               Bottom = 377
               Right = 1050
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
      Begin ColumnWidths = 45
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
     ', 'SCHEMA', N'dbo', 'VIEW', N'MYINVITEES', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'    Width = 1500
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
      Begin ColumnWidths = 9
         Column = 1440
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
', 'SCHEMA', N'dbo', 'VIEW', N'MYINVITEES', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'MYINVITEES', NULL, NULL
GO
