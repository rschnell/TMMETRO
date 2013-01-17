SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW dbo.MYPERSONS
AS
SELECT dbo.CASEX.CASEID, dbo.CASEX.INVITEE, dbo.PERSONS.PERSONID, dbo.PERSONS.ACTIONID, dbo.PERSONS.UPDATED, dbo.PERSONS.UPDATEDBY, 
               dbo.PERSONS.FIRSTNAME, dbo.PERSONS.MIDDLENAME, dbo.PERSONS.LASTNAME, dbo.PERSONS.PERSONADDRESS1, dbo.PERSONS.PERSONADDRESS2, 
               dbo.PERSONS.PERSONADDRESS3, dbo.PERSONS.CITY, dbo.PERSONS.POSTCODE, dbo.PERSONS.COUNTRY, dbo.PERSONS.PERSONREF1, 
               dbo.PERSONS.PERSONREF2, dbo.PERSONS.PERSONREF3, dbo.PERSONS.PERSONREF4, dbo.PERSONS.SUBSCRIPTIONID, dbo.PERSONS.REL1, 
               dbo.PERSONS.REL2, dbo.PERSONS.REL3, dbo.PERSONS.CONTACTNO1, dbo.PERSONS.CONTACTNO2, dbo.PERSONS.CONTACTNO3, 
               dbo.PERSONS.CONTACTNO4, dbo.PERSONS.NOTE, dbo.PERSONS.ACTIVE, dbo.PERSONS.CARDNO, dbo.PERSONS.CARDCOUNTRY, dbo.PERSONS.CARDNAME, 
               dbo.PERSONS.CARDLEVEL, dbo.PERSONS.GENDER, dbo.PERSONS.BIRTHDATE, dbo.PERSONS.BIRTHPLACE, dbo.PERSONS.BIRTHCOUNTRY, 
               dbo.PERSONS.NATIONALITY, dbo.PERSONS.COMPANY, dbo.PERSONS.COMPANYSINCE, dbo.PERSONS.DESCRIPTION, dbo.PERSONS.VEHICLEINVOLVED, 
               dbo.PERSONS.VEHICLEBRAND, dbo.PERSONS.VEHICLEPLATE, dbo.PERSONS.VEHICLETYPE, dbo.PERSONS.ISCHILD, dbo.PERSONS.ISEMPLOYEE, 
               dbo.PERSONS.ISSUSPECT, dbo.PERSONS.ISGUILTY, dbo.PERSONS.ISPENALTYPAID, dbo.PERSONS.ISPENALTYDEMANDED, dbo.PERSONS.PENALTYAMOUNT, 
               CASESTREE_6.NODENAME AS PERSONRELTYPE1, CASESTREE_7.NODENAME AS PERSONRELTYPE2, CASESTREE_4.NODENAME AS PERSONRELTYPE3, 
               CASESTREE_5.NODENAME AS PERSONREFTYPE1, CASESTREE_2.NODENAME AS PERSONREFTYPE3, CASESTREE_1.NODENAME AS PERSONREFTYPE2, 
               CASESTREE_3.NODENAME AS PERSONREFTYPE4, CASESTREE_8.NODENAME AS PERSONTITLE, CASESTREE_9.NODENAME AS PERSONGENDER, 
               CASESTREE_10.NODENAME AS CARDTYPE1, CASESTREE_11.NODENAME AS CARDTYPE2, CASESTREE_12.NODENAME AS CARDTYPE3, 
               dbo.PERSONS.CARDBLOCKED
FROM  dbo.CASESTREE AS CASESTREE_10 RIGHT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_12 RIGHT OUTER JOIN
               dbo.CASEX INNER JOIN
               dbo.PERSONS ON dbo.CASEX.CASEID = dbo.PERSONS.CASEID INNER JOIN
               dbo.CASESTREE AS CASESTREE_11 ON dbo.PERSONS.CARDTYPE2 = CASESTREE_11.NODEVALUE ON 
               CASESTREE_12.NODEVALUE = dbo.PERSONS.CARDTYPE3 ON CASESTREE_10.NODEVALUE = dbo.PERSONS.CARDTYPE1 LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_5 ON dbo.PERSONS.PERSONREFTYPE1 = CASESTREE_5.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_1 ON dbo.PERSONS.PERSONREFTYPE2 = CASESTREE_1.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_9 ON dbo.PERSONS.GENDERID = CASESTREE_9.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_6 ON dbo.PERSONS.RELTYPE1 = CASESTREE_6.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_7 ON dbo.PERSONS.RELTYPE2 = CASESTREE_7.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_4 ON dbo.PERSONS.RELTYPE3 = CASESTREE_4.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_8 ON dbo.PERSONS.TITLEID = CASESTREE_8.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_2 ON dbo.PERSONS.PERSONREFTYPE3 = CASESTREE_2.NODEVALUE LEFT OUTER JOIN
               dbo.CASESTREE AS CASESTREE_3 ON dbo.PERSONS.PERSONREFTYPE4 = CASESTREE_3.NODEVALUE
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[51] 4[10] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[41] 4[35] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4[30] 2[40] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1[56] 3) )"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[66] 3) )"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4[69] 3) )"
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
         Configuration = "(H (1[54] 4) )"
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
         Left = -70
      End
      Begin Tables = 
         Begin Table = "CASESTREE_10"
            Begin Extent = 
               Top = 311
               Left = 1023
               Bottom = 452
               Right = 1207
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "CASESTREE_12"
            Begin Extent = 
               Top = 150
               Left = 1212
               Bottom = 291
               Right = 1396
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "CASEX"
            Begin Extent = 
               Top = 5
               Left = 95
               Bottom = 146
               Right = 307
            End
            DisplayFlags = 280
            TopColumn = 47
         End
         Begin Table = "PERSONS"
            Begin Extent = 
               Top = 7
               Left = 308
               Bottom = 217
               Right = 530
            End
            DisplayFlags = 280
            TopColumn = 58
         End
         Begin Table = "CASESTREE_11"
            Begin Extent = 
               Top = 13
               Left = 1346
               Bottom = 154
               Right = 1530
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "CASESTREE_5"
            Begin Extent = 
               Top = 160
               Left = 73
               Bottom = 301
               Right = 257
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_1"
            Begin Extent = 
               Top = 374
               Left = 311
               Bottom = 515
               Right = 495
            End
   ', 'SCHEMA', N'dbo', 'VIEW', N'MYPERSONS', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'         DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_9"
            Begin Extent = 
               Top = 311
               Left = 592
               Bottom = 452
               Right = 776
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_6"
            Begin Extent = 
               Top = 65
               Left = 1368
               Bottom = 206
               Right = 1552
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "CASESTREE_7"
            Begin Extent = 
               Top = 36
               Left = 893
               Bottom = 176
               Right = 1077
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_4"
            Begin Extent = 
               Top = 28
               Left = 575
               Bottom = 169
               Right = 759
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_8"
            Begin Extent = 
               Top = 231
               Left = 312
               Bottom = 372
               Right = 496
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CASESTREE_2"
            Begin Extent = 
               Top = 90
               Left = 1384
               Bottom = 231
               Right = 1568
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "CASESTREE_3"
            Begin Extent = 
               Top = 311
               Left = 90
               Bottom = 452
               Right = 274
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
      Begin ColumnWidths = 63
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
         Column = 1440
         Alias = 3996
         Table = 3228
         Output = 720
         Append = 1400
         NewValue = 1', 'SCHEMA', N'dbo', 'VIEW', N'MYPERSONS', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane3', N'170
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
', 'SCHEMA', N'dbo', 'VIEW', N'MYPERSONS', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=3
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'MYPERSONS', NULL, NULL
GO
