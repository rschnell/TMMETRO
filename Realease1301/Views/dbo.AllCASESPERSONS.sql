SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.AllCASESPERSONS
AS
SELECT dbo.PERSONS.PERSONID, dbo.CASES.CASEID, dbo.CASES.SUBSCRIPTIONID, dbo.CASESXPERSONS.ACTIVE, dbo.USERS.Email, dbo.CASES.REFERENCE, 
               dbo.PERSONS.CONTACTNO1, dbo.PERSONS.CONTACTNO2, dbo.PERSONS.UPDATED, dbo.PERSONS.UPDATEDBY, dbo.PERSONS.TITLE, 
               dbo.PERSONS.FIRSTNAME, dbo.PERSONS.MIDDLENAME, dbo.PERSONS.LASTNAME, dbo.PERSONS.PERSONADDRESS1, dbo.PERSONS.PERSONADDRESS2, 
               dbo.PERSONS.PERSONADDRESS3, dbo.PERSONS.CITY, dbo.PERSONS.POSTCODE, dbo.PERSONS.COUNTRY, dbo.PERSONS.PERSONREF1, 
               dbo.PERSONS.PERSONREFTYPE1, dbo.PERSONS.PERSONREF2, dbo.PERSONS.PERSONREFTYPE2, dbo.PERSONS.PERSONREF3, 
               dbo.PERSONS.PERSONREFTYPE3, dbo.PERSONS.PERSONREF4, dbo.PERSONS.PERSONREFTYPE4, dbo.PERSONS.REL1, dbo.PERSONS.RELTYPE1, 
               dbo.PERSONS.REL2, dbo.PERSONS.RELTYPE2, dbo.PERSONS.REL3, dbo.PERSONS.CONTACTNO3, dbo.PERSONS.CONTACTNO4, dbo.PERSONS.NOTE, 
               dbo.PERSONS.CARDNO, dbo.PERSONS.CARDCOUNTRY, dbo.PERSONS.CARDNAME, dbo.PERSONS.CARDLEVEL, dbo.PERSONS.GENDER, 
               dbo.PERSONS.BIRTHDATE, dbo.PERSONS.BIRTHPLACE, dbo.PERSONS.BIRTHCOUNTRY, dbo.PERSONS.NATIONALITY, dbo.PERSONS.COMPANY, 
               dbo.PERSONS.COMPANYSINCE, dbo.PERSONS.DESCRIPTION, dbo.PERSONS.VEHICLEINVOLVED, dbo.PERSONS.VEHICLEBRAND, 
               dbo.PERSONS.VEHICLEPLATE, dbo.PERSONS.VEHICLETYPE, dbo.PERSONS.ISCHILD, dbo.PERSONS.ISEMPLOYEE, dbo.PERSONS.ISSUSPECT, 
               dbo.PERSONS.ISGUILTY, dbo.PERSONS.ISPENALTYPAID, dbo.PERSONS.ISPENALTYDEMANDED, dbo.PERSONS.GENDERID, dbo.PERSONS.PENALTYAMOUNT, 
               dbo.PERSONS.TITLEID, dbo.PERSONS.CARDTYPE1, dbo.PERSONS.CARDTYPE2, dbo.PERSONS.CARDTYPE3, dbo.PERSONS.CARDBLOCKED, 
               dbo.PERSONS.ISKNOWN, dbo.PERSONS.REL, dbo.PERSONS.RELTYPE, dbo.PERSONS.KINFIRSTNAME, dbo.PERSONS.AGE, dbo.PERSONS.KINLASTNAME, 
               dbo.PERSONS.ISFLAG1, dbo.PERSONS.ISFLAG2, dbo.PERSONS.ISFLAG3, dbo.PERSONS.ISFLAG4, dbo.PERSONS.ISFLAG5, dbo.PERSONS.ISFLAG6, 
               dbo.PERSONS.DESCRIPTION1, dbo.PERSONS.DESCRIPTION2, dbo.PERSONS.DESCRIPTION3, dbo.PERSONS.DESCRIPTION4, dbo.PERSONS.DESCRIPTION5, 
               dbo.PERSONS.DESCRIPTION6, dbo.PERSONS.NEXTOFKIN, dbo.PERSONS.RELTYPE3
FROM  dbo.CASES INNER JOIN
               dbo.CASESXPERSONS ON dbo.CASES.CASEID = dbo.CASESXPERSONS.CASEID INNER JOIN
               dbo.PERSONS ON dbo.CASESXPERSONS.PERSONID = dbo.PERSONS.PERSONID INNER JOIN
               dbo.USERS ON dbo.CASES._CMSUSERSASSIGNEDTO = dbo.USERS.UserId
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[5] 4[72] 2[4] 3) )"
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
               Bottom = 285
               Right = 309
            End
            DisplayFlags = 280
            TopColumn = 17
         End
         Begin Table = "CASESXPERSONS"
            Begin Extent = 
               Top = 7
               Left = 627
               Bottom = 148
               Right = 811
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PERSONS"
            Begin Extent = 
               Top = 10
               Left = 919
               Bottom = 388
               Right = 1141
            End
            DisplayFlags = 280
            TopColumn = 26
         End
         Begin Table = "USERS"
            Begin Extent = 
               Top = 151
               Left = 457
               Bottom = 292
               Right = 718
            End
            DisplayFlags = 280
            TopColumn = 10
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 86
         Width = 284
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
         Width = 120', 'SCHEMA', N'dbo', 'VIEW', N'AllCASESPERSONS', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'0
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
         Column = 2976
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
', 'SCHEMA', N'dbo', 'VIEW', N'AllCASESPERSONS', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'AllCASESPERSONS', NULL, NULL
GO
