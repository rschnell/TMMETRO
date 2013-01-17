SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.cmsRptRiskByCompanyCategory
                 @SubscriptionID integer,
                 @Category nvarchar(5)
AS
SET NOCOUNT ON

declare @vCategoryName nvarchar(50)
declare @dCurrent datetime
declare @dMonthCurrent datetime
declare @dYearPrevious datetime

set @dCurrent = dateadd(day,-3,getdate()) /* report run a few days after month end, so backdate */
set @dMonthCurrent = cast(year(@dCurrent) as char(4)) + '-' + datename(month,@dCurrent) + '-01'
set @dYearPrevious = dateadd(year,-1,@dMonthCurrent)
set @dMonthCurrent = dateadd(day,-1,dateadd(month,1,@dMonthCurrent)) /* set to last day of month */

-- setup shell for report chart
create table #tREPORT (iSubscriptionID integer,
                       vCategory nvarchar(50),
                       iPeriod integer,
                       iCount integer,
                       mRecovered decimal(18,2),
                       mTotal decimal(18,2))
if @Category = 'ARS' set @vCategoryName = 'Arson'
if @Category = 'BLM' set @vCategoryName = 'Blackmail'
if @Category = 'BMB' set @vCategoryName = 'Bomb Threat'
if @Category = 'BRG' set @vCategoryName = 'Burglary'
if @Category = 'COR' set @vCategoryName = 'Corruption'
if @Category = 'CFM' set @vCategoryName = 'Counterfeit'
if @Category = 'FRD' set @vCategoryName = 'Fraud'
if @Category = 'HLD' set @vCategoryName = 'Holdup'
if @Category = 'IS'  set @vCategoryName = 'Information Security'
if @Category = 'KDN' set @vCategoryName = 'Kidnap'
if @Category = 'TFT' set @vCategoryName = 'Theft'
if @Category = 'OTH' set @vCategoryName = 'Other'
insert into #tREPORT (iSubscriptionID, vCategory, iPeriod, iCount, mRecovered, mTotal)
              values (@SubscriptionID, @vCategoryName, convert(varchar(6),dateadd(month,0,@dYearPrevious),112), 0, 0, 0)
insert into #tREPORT (iSubscriptionID, vCategory, iPeriod, iCount, mRecovered, mTotal)
              values (@SubscriptionID, @vCategoryName, convert(varchar(6),dateadd(month,1,@dYearPrevious),112), 0, 0, 0)
insert into #tREPORT (iSubscriptionID, vCategory, iPeriod, iCount, mRecovered, mTotal)
              values (@SubscriptionID, @vCategoryName, convert(varchar(6),dateadd(month,2,@dYearPrevious),112), 0, 0, 0)
insert into #tREPORT (iSubscriptionID, vCategory, iPeriod, iCount, mRecovered, mTotal)
              values (@SubscriptionID, @vCategoryName, convert(varchar(6),dateadd(month,3,@dYearPrevious),112), 0, 0, 0)
insert into #tREPORT (iSubscriptionID, vCategory, iPeriod, iCount, mRecovered, mTotal)
              values (@SubscriptionID, @vCategoryName, convert(varchar(6),dateadd(month,4,@dYearPrevious),112), 0, 0, 0)
insert into #tREPORT (iSubscriptionID, vCategory, iPeriod, iCount, mRecovered, mTotal)
              values (@SubscriptionID, @vCategoryName, convert(varchar(6),dateadd(month,5,@dYearPrevious),112), 0, 0, 0)
insert into #tREPORT (iSubscriptionID, vCategory, iPeriod, iCount, mRecovered, mTotal)
              values (@SubscriptionID, @vCategoryName, convert(varchar(6),dateadd(month,6,@dYearPrevious),112), 0, 0, 0)
insert into #tREPORT (iSubscriptionID, vCategory, iPeriod, iCount, mRecovered, mTotal)
              values (@SubscriptionID, @vCategoryName, convert(varchar(6),dateadd(month,7,@dYearPrevious),112), 0, 0, 0)
insert into #tREPORT (iSubscriptionID, vCategory, iPeriod, iCount, mRecovered, mTotal)
              values (@SubscriptionID, @vCategoryName, convert(varchar(6),dateadd(month,8,@dYearPrevious),112), 0, 0, 0)
insert into #tREPORT (iSubscriptionID, vCategory, iPeriod, iCount, mRecovered, mTotal)
              values (@SubscriptionID, @vCategoryName, convert(varchar(6),dateadd(month,9,@dYearPrevious),112), 0, 0, 0)
insert into #tREPORT (iSubscriptionID, vCategory, iPeriod, iCount, mRecovered, mTotal)
              values (@SubscriptionID, @vCategoryName, convert(varchar(6),dateadd(month,10,@dYearPrevious),112), 0, 0, 0)
insert into #tREPORT (iSubscriptionID, vCategory, iPeriod, iCount, mRecovered, mTotal)
              values (@SubscriptionID, @vCategoryName, convert(varchar(6),dateadd(month,11,@dYearPrevious),112), 0, 0, 0)
insert into #tREPORT (iSubscriptionID, vCategory, iPeriod, iCount, mRecovered, mTotal)
              values (@SubscriptionID, @vCategoryName, convert(varchar(6),dateadd(month,12,@dYearPrevious),112), 0, 0, 0)

-- cases for current month
select C.CASEID,
       C.REFERENCE,
       C.SUBSCRIPTIONID,
       convert(varchar(6),C.EVENTDATE,112) as PERIOD,
       T.TREEID as CATEGORYID,
       C.RECOVEREDVALUE,
       C.TOTALVALUE
into #tCASES
from CASESTREE as T
left join CASES as C on (C._CMSCAT1OF = T.TREEID)
                    and (C.SUBSCRIPTIONID = @SubscriptionID)
                    and (C.EVENTDATE >= @dYearPrevious and C.EVENTDATE <= @dMonthCurrent)
where (T.NODETAG = @Category)

-- aggregate for category and period
select PERIOD,
       CATEGORYID,
       count(CASEID) as [COUNT],
       sum(RECOVEREDVALUE) as RECOVEREDVALUE,
       sum(TOTALVALUE) as TOTALVALUE
into #tTOTAL
from #tCASES
group by PERIOD,
         CATEGORYID

-- format for report
declare @vPeriod varchar(6)
declare @iCount integer
declare @mRecovered decimal(18,2)
declare @mTotal decimal(18,2)
declare @iCount00 integer
declare @iCount01 integer
declare @iCount02 integer
declare @iCount03 integer
declare @iCount04 integer
declare @iCount05 integer
declare @iCount06 integer
declare @iCount07 integer
declare @iCount08 integer
declare @iCount09 integer
declare @iCount10 integer
declare @iCount11 integer
declare @iCount12 integer
declare @mRecovered00 decimal(18,2)
declare @mRecovered01 decimal(18,2)
declare @mRecovered02 decimal(18,2)
declare @mRecovered03 decimal(18,2)
declare @mRecovered04 decimal(18,2)
declare @mRecovered05 decimal(18,2)
declare @mRecovered06 decimal(18,2)
declare @mRecovered07 decimal(18,2)
declare @mRecovered08 decimal(18,2)
declare @mRecovered09 decimal(18,2)
declare @mRecovered10 decimal(18,2)
declare @mRecovered11 decimal(18,2)
declare @mRecovered12 decimal(18,2)
declare @mTotal00 decimal(18,2)
declare @mTotal01 decimal(18,2)
declare @mTotal02 decimal(18,2)
declare @mTotal03 decimal(18,2)
declare @mTotal04 decimal(18,2)
declare @mTotal05 decimal(18,2)
declare @mTotal06 decimal(18,2)
declare @mTotal07 decimal(18,2)
declare @mTotal08 decimal(18,2)
declare @mTotal09 decimal(18,2)
declare @mTotal10 decimal(18,2)
declare @mTotal11 decimal(18,2)
declare @mTotal12 decimal(18,2)
-- initialise
set @iCount00 = 0
set @iCount01 = 0
set @iCount02 = 0
set @iCount03 = 0
set @iCount04 = 0
set @iCount05 = 0
set @iCount06 = 0
set @iCount07 = 0
set @iCount08 = 0
set @iCount09 = 0
set @iCount10 = 0
set @iCount11 = 0
set @iCount12 = 0
set @mRecovered00 = 0
set @mRecovered01 = 0
set @mRecovered02 = 0
set @mRecovered03 = 0
set @mRecovered04 = 0
set @mRecovered05 = 0
set @mRecovered06 = 0
set @mRecovered07 = 0
set @mRecovered08 = 0
set @mRecovered09 = 0
set @mRecovered10 = 0
set @mRecovered11 = 0
set @mRecovered12 = 0
set @mTotal00 = 0
set @mTotal01 = 0
set @mTotal02 = 0
set @mTotal03 = 0
set @mTotal04 = 0
set @mTotal05 = 0
set @mTotal06 = 0
set @mTotal07 = 0
set @mTotal08 = 0
set @mTotal09 = 0
set @mTotal10 = 0
set @mTotal11 = 0
set @mTotal12 = 0

declare curCASES cursor for
select PERIOD,
       [COUNT],
       RECOVEREDVALUE,
       TOTALVALUE
from #tTOTAL
order by PERIOD
open curCASES
     fetch next from curCASES into @vPeriod, @iCount, @mRecovered, @mTotal
while @@FETCH_STATUS = 0
begin
     if @vPeriod = convert(varchar(6),dateadd(month,0,@dYearPrevious),112)
     begin
          set @iCount00 = @iCount
          set @mRecovered00 = @mRecovered
          set @mTotal00 = @mTotal
     end
     if @vPeriod = convert(varchar(6),dateadd(month,1,@dYearPrevious),112)
     begin
          set @iCount01 = @iCount
          set @mRecovered01 = @mRecovered
          set @mTotal01 = @mTotal
     end
     if @vPeriod = convert(varchar(6),dateadd(month,2,@dYearPrevious),112)
     begin
          set @iCount02 = @iCount
          set @mRecovered02 = @mRecovered
          set @mTotal02 = @mTotal
     end
     if @vPeriod = convert(varchar(6),dateadd(month,3,@dYearPrevious),112)
     begin
          set @iCount03 = @iCount
          set @mRecovered03 = @mRecovered
          set @mTotal03 = @mTotal
     end
     if @vPeriod = convert(varchar(6),dateadd(month,4,@dYearPrevious),112)
     begin
          set @iCount04 = @iCount
          set @mRecovered04 = @mRecovered
          set @mTotal04 = @mTotal
     end
     if @vPeriod = convert(varchar(6),dateadd(month,5,@dYearPrevious),112)
     begin
          set @iCount05 = @iCount
          set @mRecovered05 = @mRecovered
          set @mTotal05 = @mTotal
     end
     if @vPeriod = convert(varchar(6),dateadd(month,6,@dYearPrevious),112)
     begin
          set @iCount06 = @iCount
          set @mRecovered06 = @mRecovered
          set @mTotal06 = @mTotal
     end
     if @vPeriod = convert(varchar(6),dateadd(month,7,@dYearPrevious),112)
     begin
          set @iCount07 = @iCount
          set @mRecovered07 = @mRecovered
          set @mTotal07 = @mTotal
     end
     if @vPeriod = convert(varchar(6),dateadd(month,8,@dYearPrevious),112)
     begin
          set @iCount08 = @iCount
          set @mRecovered08 = @mRecovered
          set @mTotal08 = @mTotal
     end
     if @vPeriod = convert(varchar(6),dateadd(month,9,@dYearPrevious),112)
     begin
          set @iCount09 = @iCount
          set @mRecovered09 = @mRecovered
          set @mTotal09 = @mTotal
     end
     if @vPeriod = convert(varchar(6),dateadd(month,10,@dYearPrevious),112)
     begin
          set @iCount10 = @iCount
          set @mRecovered10 = @mRecovered
          set @mTotal10 = @mTotal
     end
     if @vPeriod = convert(varchar(6),dateadd(month,11,@dYearPrevious),112)
     begin
          set @iCount11 = @iCount
          set @mRecovered11 = @mRecovered
          set @mTotal11 = @mTotal
     end
     if @vPeriod = convert(varchar(6),dateadd(month,12,@dYearPrevious),112)
     begin
          set @iCount12 = @iCount
          set @mRecovered12 = @mRecovered
          set @mTotal12 = @mTotal
     end
     fetch next from curCASES into @vPeriod, @iCount, @mRecovered, @mTotal
end
close curCASES
deallocate curCASES

update #tREPORT set iCount = @iCount00, mRecovered = @mRecovered00, mTotal = @mTotal00
              where iPeriod = convert(varchar(6),dateadd(month,0,@dYearPrevious),112)
update #tREPORT set iCount = @iCount01, mRecovered = @mRecovered01, mTotal = @mTotal01
              where iPeriod = convert(varchar(6),dateadd(month,1,@dYearPrevious),112)
update #tREPORT set iCount = @iCount02, mRecovered = @mRecovered02, mTotal = @mTotal02
              where iPeriod = convert(varchar(6),dateadd(month,2,@dYearPrevious),112)
update #tREPORT set iCount = @iCount03, mRecovered = @mRecovered03, mTotal = @mTotal03
              where iPeriod = convert(varchar(6),dateadd(month,3,@dYearPrevious),112)
update #tREPORT set iCount = @iCount04, mRecovered = @mRecovered04, mTotal = @mTotal04
              where iPeriod = convert(varchar(6),dateadd(month,4,@dYearPrevious),112)
update #tREPORT set iCount = @iCount05, mRecovered = @mRecovered05, mTotal = @mTotal05
              where iPeriod = convert(varchar(6),dateadd(month,5,@dYearPrevious),112)
update #tREPORT set iCount = @iCount06, mRecovered = @mRecovered06, mTotal = @mTotal06
              where iPeriod = convert(varchar(6),dateadd(month,6,@dYearPrevious),112)
update #tREPORT set iCount = @iCount07, mRecovered = @mRecovered07, mTotal = @mTotal07
              where iPeriod = convert(varchar(6),dateadd(month,7,@dYearPrevious),112)
update #tREPORT set iCount = @iCount08, mRecovered = @mRecovered08, mTotal = @mTotal08
              where iPeriod = convert(varchar(6),dateadd(month,8,@dYearPrevious),112)
update #tREPORT set iCount = @iCount09, mRecovered = @mRecovered09, mTotal = @mTotal09
              where iPeriod = convert(varchar(6),dateadd(month,9,@dYearPrevious),112)
update #tREPORT set iCount = @iCount10, mRecovered = @mRecovered10, mTotal = @mTotal10
              where iPeriod = convert(varchar(6),dateadd(month,10,@dYearPrevious),112)
update #tREPORT set iCount = @iCount11, mRecovered = @mRecovered11, mTotal = @mTotal11
              where iPeriod = convert(varchar(6),dateadd(month,11,@dYearPrevious),112)
update #tREPORT set iCount = @iCount12, mRecovered = @mRecovered12, mTotal = @mTotal12
              where iPeriod = convert(varchar(6),dateadd(month,12,@dYearPrevious),112)

-- report results
select S.DESCRIPTION as Company,
       R.*
from #tREPORT as R
inner join SUBSCRIPTIONS as S on S.SUBSCRIPTIONID = R.iSubscriptionID
order by R.iPeriod

-- housekeeping
if not OBJECT_ID('tempdb..#tREPORT') is null
drop table #tREPORT
if not OBJECT_ID('tempdb..#tCASES') is null
drop table #tCASES
if not OBJECT_ID('tempdb..#tTOTAL') is null
drop table #tTOTAL

GO
