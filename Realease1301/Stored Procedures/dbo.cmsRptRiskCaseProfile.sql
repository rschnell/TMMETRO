SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.cmsRptRiskCaseProfile
                 @SubscriptionID integer
AS
SET NOCOUNT ON

declare @dCurrent datetime
declare @dMonthCurrent datetime
declare @dMonthPrevious datetime

set @dCurrent = dateadd(day,-3,getdate()) /* report run a few days after month end, so backdate */
set @dMonthCurrent = cast(year(@dCurrent) as char(4)) + '-' + datename(month,@dCurrent) + '-01'
set @dMonthCurrent = dateadd(day,-1,dateadd(month,1,@dMonthCurrent)) /* set to last day of month */
set @dMonthPrevious = dateadd(month,-1,@dMonthCurrent)

-- cases for current month
select C.CASEID,
       C.REFERENCE,
       C.SUBSCRIPTIONID,
       convert(varchar(6),@dMonthPrevious,112) as PERIOD,
       T.NODEVALUE as STATUSVALUE,
       T.NODENAME as STATUSNAME,
       C.RECOVEREDVALUE,
       C.TOTALVALUE
into #tCASES
from CASESTREE as T
left join CASES as C on (C._CMSSTATUSOF = T.NODEVALUE)
                    and (C.SUBSCRIPTIONID = @SubscriptionID)
                    and (C.EVENTDATE > @dMonthPrevious and C.EVENTDATE <= @dMonthCurrent)
where (T.CATEGORYID = 2)

-- aggregate for category and period
select PERIOD,
       STATUSVALUE,
       STATUSNAME, 
       count(CASEID) as [COUNT],
       sum(RECOVEREDVALUE) as RECOVEREDVALUE,
       sum(TOTALVALUE) as TOTALVALUE
into #tREPORT
from #tCASES
group by PERIOD,
         STATUSVALUE,
         STATUSNAME

-- report results
select S.DESCRIPTION as Company,
       R.*
from #tREPORT as R
inner join SUBSCRIPTIONS as S on S.SUBSCRIPTIONID = @SubscriptionID

-- housekeeping
if not OBJECT_ID('tempdb..#tREPORT') is null
drop table #tREPORT
if not OBJECT_ID('tempdb..#tCASES') is null
drop table #tCASES

GO
