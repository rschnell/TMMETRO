SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[rptTIMESHEETS]
AS
SELECT     dbo.CASES.CASEID, dbo.PERSONS.PERSONID, dbo.CASES.REFERENCE AS [Case Reference], USERS_1.ManagerName AS [License NO], 
                      USERS_1.ManagerEmail AS Detective, dbo.CASES.EVENTDATE AS [Case Date], dbo.CASES.EVENTTIME, 
                      dbo.MYHOURVALUES.ACTIVITYDATE AS [Activity Date], dbo.CASES.ACTIVE, dbo.CASES._CMSUSERSRAISEDBY, dbo.MYHOURVALUES.HOURS, 
                      dbo.MYHOURVALUES.ACTIVITY AS [Activity Description], dbo.MYHOURVALUES.TYPEID AS [Cost Type], dbo.MYHOURVALUES.HOURSTYPE, 
                      dbo.MYHOURVALUES.WEEKNO AS [Week No], MONTH(dbo.MYHOURVALUES.ACTIVITYDATE) AS [Month No], 
                      YEAR(dbo.MYHOURVALUES.ACTIVITYDATE) AS Year, dbo.MYHOURVALUES.UserName, dbo.CASES.RECOVEREDVALUE AS [Recovered Value], 
                      dbo.CASES.TOTALVALUE AS [Total Value], dbo.MYHOURVALUES.USERID, dbo.CUSTOMERS.COMPANYCODE, dbo.CUSTOMERS.COMPANYNAME, 
                      dbo.CUSTOMERS.RATE1PERHOUR, dbo.CUSTOMERS.RATE2PERHOUR, dbo.CUSTOMERS.RATE3PERHOUR, dbo.CUSTOMERS.RATE4PERHOUR, 
                      dbo.PERSONS.RELTYPE, dbo.PERSONS.BIRTHDATE, dbo.PERSONS.GENDER, dbo.PERSONS.ISKNOWN, dbo.CASES.ISFLAG2 AS CHARGEDKNOWN, 
                      dbo.CASES.ISFLAG1 AS CHARGEDUNKNOWN, dbo.MYHOURVALUES.ENTRYNO, dbo.CASES._CMSCAT2OF
FROM         dbo.CASES INNER JOIN
                      dbo.PERSONS ON dbo.CASES.CASEID = dbo.PERSONS.CASEID RIGHT OUTER JOIN
                      dbo.ALLUSERS INNER JOIN
                      dbo.MYHOURVALUES ON dbo.ALLUSERS.UserId = dbo.MYHOURVALUES.USERID LEFT OUTER JOIN
                      dbo.CUSTOMERS ON dbo.ALLUSERS.AgencyID = dbo.CUSTOMERS.CUSTOMERID ON DAY(dbo.CASES.EVENTDATE) 
                      = DAY(dbo.MYHOURVALUES.ACTIVITYDATE) AND MONTH(dbo.CASES.EVENTDATE) = MONTH(dbo.MYHOURVALUES.ACTIVITYDATE) AND 
                      YEAR(dbo.CASES.EVENTDATE) = YEAR(dbo.MYHOURVALUES.ACTIVITYDATE) LEFT OUTER JOIN
                      dbo.USERS AS USERS_1 ON dbo.ALLUSERS.UserId = USERS_1.UserId
WHERE     (dbo.PERSONS.RELTYPE = 1) OR
                      (dbo.PERSONS.RELTYPE IS NULL)

GO