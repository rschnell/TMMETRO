SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.cmsGetSchedule
                 @ReportID integer=0,
                 @SubscriptionID integer=0
AS
SET NOCOUNT ON
  

SELECT S.[REPORTSCHEDULEID],
       S.[REPORTID],
       S.[SUBSCRIPTIONID],
       S.[START],
       S.[STOP],
       S.[SCHEDULEEND],
       S.[INTERVAL],
       S.[INTERVALHOURREPEAT],
       S.[INTERVALDAYDAYS],
       S.[INTERVALDAYREPEAT],
       S.[INTERVALMONTHWEEK],
       S.[INTERVALMONTHDAY],
       S.[REPEATWEEKS],
       S.[REPEATDAYS],
       S.[REPEATHOURS],
       S.[REPEATMINUTES],
       S.[STARTHOURS],
       S.[STARTMINUTES],
       S.[RENDER],
       S.[SUN],
       S.[MON],
       S.[TUE],
       S.[WED],
       S.[THU],
       S.[FRI],
       S.[SAT],
       S.[JAN],
       S.[FEB],
       S.[MAR],
       S.[APR],
       S.[MAY],
       S.[JUN],
       S.[JUL],
       S.[AUG],
       S.[SEP],
       S.[OCT],
       S.[NOV],
       S.[DEC],
       S.[WEEK],
       S.[DAYS],
       S.[LASTRUN],
       S.[NEXTRUN]
  FROM [REPORTSCHEDULES] AS S
 WHERE S.[REPORTID]= @ReportID
   AND S.[SUBSCRIPTIONID] = @SubscriptionID

GO
