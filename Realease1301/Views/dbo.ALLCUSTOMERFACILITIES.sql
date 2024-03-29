SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[ALLCUSTOMERFACILITIES]
AS
SELECT     dbo.CUSTOMERS.CUSTOMERID, dbo.CUSTOMERS.COMPANYNAME, dbo.CUSTOMERS.COMPANYCODE, dbo.AllCASESTree.NODENAME, dbo.AllCASESTree.TREEID, 
                      dbo.AllCASESTree.NODEVALUE, dbo.AllCASESTree.CATEGORYID, dbo.AllCASESTree.NODETEXT, dbo.AllCASESTree.ACTIVE AS ACTIVEFACILITY, 
                      dbo.CUSTOMERS.ADDRESSLINE1, dbo.CUSTOMERS.ADDRESSLINE2, dbo.CUSTOMERS.CITY, dbo.CUSTOMERS.POSTCODE, dbo.CUSTOMERS.COUNTRY, 
                      dbo.CUSTOMERS.TELEPHONE, dbo.CUSTOMERS.PERSONID, dbo.CUSTOMERS.USERID, dbo.CUSTOMERS.REGNO, dbo.CUSTOMERS.ACTIVE AS ACTIVECUSTOMER, 
                      dbo.AllCASESTree.RATE
FROM         dbo.CUSTOMERSXFACILITIES INNER JOIN
                      dbo.CUSTOMERS ON dbo.CUSTOMERSXFACILITIES.CUSTOMERID = dbo.CUSTOMERS.CUSTOMERID INNER JOIN
                      dbo.AllCASESTree ON dbo.CUSTOMERSXFACILITIES.TREEID = dbo.AllCASESTree.TREEID


GO
