SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[cmsGetScheduleEmail] 
(
	@SubscriptionID INTEGER=0,
	@ReportScheduleID INTEGER=0
)
AS
SET NOCOUNT ON

SELECT U.[ID],
       U.[FirstName],
       U.[LastName],
       U.[Email],
       ISNULL(E.[REPORTSCHEDULEEMAILID],0) AS [Status]
  FROM [USERS] AS U
  LEFT JOIN [REPORTSCHEDULEEMAILS] AS E ON E.[REPORTSCHEDULEID] = @ReportScheduleID AND E.[EMAIL] = U.[Email]
 WHERE (U.[WEBSTATUS] > 0
   AND (LEN(U.[LastName]) > 0)
   AND (@SubscriptionID = 0 OR @SubscriptionID = U.[GROUPID])
   AND NOT (U.[GUEST] = 1)  )
 ORDER BY U.[Email]


GO
