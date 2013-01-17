SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.PERSONSCASES
AS
SELECT     dbo.PERSONS.PERSONID, dbo.PERSONS.ACTIONID, dbo.PERSONS.CASEID, dbo.PERSONS.UPDATED, dbo.PERSONS.UPDATEDBY, 
                      dbo.PERSONS.TITLE, dbo.PERSONS.FIRSTNAME, dbo.PERSONS.MIDDLENAME, dbo.PERSONS.LASTNAME, dbo.PERSONS.PERSONADDRESS1, 
                      dbo.PERSONS.PERSONADDRESS2, dbo.PERSONS.PERSONADDRESS3, dbo.PERSONS.CITY, dbo.PERSONS.POSTCODE, dbo.PERSONS.COUNTRY, 
                      dbo.PERSONS.CONTACTNO1, dbo.PERSONS.CONTACTNO2, dbo.PERSONS.CONTACTNO3, dbo.PERSONS.CONTACTNO4, dbo.PERSONS.NOTE, 
                      dbo.PERSONS.ACTIVE, dbo.PERSONS.CARDNO, dbo.PERSONS.CARDCOUNTRY, dbo.PERSONS.CARDNAME, dbo.PERSONS.CARDLEVEL, 
                      dbo.PERSONS.GENDER, dbo.PERSONS.BIRTHDATE, dbo.PERSONS.BIRTHPLACE, dbo.PERSONS.BIRTHCOUNTRY, dbo.PERSONS.NATIONALITY, 
                      dbo.PERSONS.COMPANY, dbo.PERSONS.COMPANYSINCE, dbo.PERSONS.DESCRIPTION, dbo.PERSONS.VEHICLEINVOLVED, 
                      dbo.PERSONS.VEHICLEBRAND, dbo.PERSONS.VEHICLEPLATE, dbo.PERSONS.VEHICLETYPE, dbo.PERSONS.ISCHILD, dbo.PERSONS.ISEMPLOYEE, 
                      dbo.PERSONS.ISSUSPECT, dbo.PERSONS.ISGUILTY, dbo.PERSONS.ISPENALTYPAID, dbo.PERSONS.ISPENALTYDEMANDED, 
                      dbo.PERSONS.PENALTYAMOUNT, dbo.PERSONS.ISKNOWN, dbo.PERSONS.AGE, dbo.PERSONS.DESCRIPTION1, dbo.PERSONS.DESCRIPTION2, 
                      dbo.PERSONS.DESCRIPTION3, dbo.PERSONS.DESCRIPTION4, dbo.PERSONS.DESCRIPTION5, dbo.PERSONS.DESCRIPTION6, 
                      dbo.PERSONS.NEXTOFKIN, dbo.PERSONS.PERSONREF2 AS IDCARDNO, dbo.CASES.REFERENCE, dbo.CASESTREE.NODENAME AS LOCATION, 
                      CASE WHEN dbo.CASES._CMSDATERAISED IS NULL THEN 9999 ELSE DATEDIFF(DAY, dbo.CASES._CMSDATERAISED, GetDate()) END AS DAYS
FROM         dbo.CASESTREE INNER JOIN
                      dbo.CASES ON dbo.CASESTREE.NODEVALUE = dbo.CASES._CMSCAT2OF RIGHT OUTER JOIN
                      dbo.PERSONS ON dbo.CASES.CASEID = dbo.PERSONS.CASEID
WHERE     (dbo.PERSONS.CASEID <> 0) AND (dbo.PERSONS.REL = N'SUSPECT')
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[31] 2[10] 3) )"
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
         Begin Table = "CASESTREE"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASES"
            Begin Extent = 
               Top = 0
               Left = 689
               Bottom = 108
               Right = 909
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PERSONS"
            Begin Extent = 
               Top = 35
               Left = 370
               Bottom = 177
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 66
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 59
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
         W', 'SCHEMA', N'dbo', 'VIEW', N'PERSONSCASES', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'idth = 1500
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
', 'SCHEMA', N'dbo', 'VIEW', N'PERSONSCASES', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'PERSONSCASES', NULL, NULL
GO
