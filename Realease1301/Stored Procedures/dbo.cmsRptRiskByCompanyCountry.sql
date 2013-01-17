SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.cmsRptRiskByCompanyCountry
                 @SubscriptionID integer=0
AS
SET NOCOUNT ON

declare @vArson nvarchar(50)
declare @vBlackmail nvarchar(50)
declare @vBombThreat nvarchar(50)
declare @vBurglary nvarchar(50)
declare @vCorruption nvarchar(50)
declare @vCounterfeit nvarchar(50)
declare @vFraud nvarchar(50)
declare @vHoldup nvarchar(50)
declare @vInformationSecurity nvarchar(50)
declare @vKidnap nvarchar(50)
declare @vTheft nvarchar(50)
declare @vOther nvarchar(50)

set @vArson = 'ARS'	
set @vBlackmail = 'BLM'
set @vBombThreat = 'BMB'
set @vBurglary = 'BRG'
set @vCorruption = 'COR'
set @vCounterfeit = 'CFM'
set @vFraud = 'FRD'
set @vHoldup = 'HLD'
set @vInformationSecurity = 'IS'
set @vKidnap = 'KDN'
set @vTheft = 'TFT'
set @vOther = 'OTH'

declare @dCurrent datetime
declare @dMonthCurrent datetime
declare @dMonthPrevious datetime
declare @dYearPrevious datetime

set @dCurrent = dateadd(day,-3,getdate()) /* report run a few days after month end, so backdate */
set @dMonthCurrent = cast(year(@dCurrent) as char(4)) + '-' + datename(month,@dCurrent) + '-01'
set @dMonthPrevious = dateadd(month,-1,@dMonthCurrent)
set @dYearPrevious = dateadd(year,-1,@dMonthCurrent)

-- cases for current month
select 'CM' as PERIOD,
       CASEID,
       REFERENCE,
       SUBSCRIPTIONID,
       EVENTDATE,
       _CMSCAT1OF as CATEGORYID,
       _CMSCAT2OF as LOCATIONID,
       RECOVEREDVALUE,
       TOTALVALUE
into #tCASES
from CASES
where (year(EVENTDATE) = year(@dMonthCurrent) and month(EVENTDATE) = month(@dMonthCurrent))
  and (@SubscriptionID = 0 or SUBSCRIPTIONID = @SubscriptionID)
union
-- cases for previous month
select 'PM' as PERIOD,
       CASEID,
       REFERENCE,
       SUBSCRIPTIONID,
       EVENTDATE,
       _CMSCAT1OF as CATEGORYID,
       _CMSCAT2OF as LOCATIONID,
       RECOVEREDVALUE,
       TOTALVALUE
from CASES
where (year(EVENTDATE) = year(@dMonthPrevious) and month(EVENTDATE) = month(@dMonthPrevious))
  and (@SubscriptionID = 0 or SUBSCRIPTIONID = @SubscriptionID)
union
-- cases in previous year for this month
select 'PY' as PERIOD,
       CASEID,
       REFERENCE,
       SUBSCRIPTIONID,
       EVENTDATE,
       _CMSCAT1OF as CATEGORYID,
       _CMSCAT2OF as LOCATIONID,
       RECOVEREDVALUE,
       TOTALVALUE
from CASES
where (year(EVENTDATE) = year(@dYearPrevious) and month(EVENTDATE) = month(@dYearPrevious))
  and (@SubscriptionID = 0 or SUBSCRIPTIONID = @SubscriptionID)

-- aggregate for category and location
select SUBSCRIPTIONID,
       PERIOD,
       CATEGORYID,
       LOCATIONID,
       count(CASEID) as [COUNT],
       sum(RECOVEREDVALUE) as RECOVEREDVALUE,
       sum(TOTALVALUE) as TOTALVALUE
into #tTOTAL
from #tCASES
group by SUBSCRIPTIONID,
         PERIOD,
         CATEGORYID,
         LOCATIONID

-- format for report
create table #tREPORT (iSubscriptionID integer, vStore nvarchar(50),
                       iTheftCountCM integer, mTheftRecoveredCM decimal(18,2), mTheftTotalCM decimal(18,2),
                       iTheftCountPM integer, mTheftRecoveredPM decimal(18,2), mTheftTotalPM decimal(18,2),
                       iTheftCountPY integer, mTheftRecoveredPY decimal(18,2), mTheftTotalPY decimal(18,2),
                       iBurglaryCountCM integer, mBurglaryRecoveredCM decimal(18,2), mBurglaryTotalCM decimal(18,2),
                       iBurglaryCountPM integer, mBurglaryRecoveredPM decimal(18,2), mBurglaryTotalPM decimal(18,2),
                       iBurglaryCountPY integer, mBurglaryRecoveredPY decimal(18,2), mBurglaryTotalPY decimal(18,2),
                       iFraudCountCM integer, mFraudRecoveredCM decimal(18,2), mFraudTotalCM decimal(18,2),
                       iFraudCountPM integer, mFraudRecoveredPM decimal(18,2), mFraudTotalPM decimal(18,2),
                       iFraudCountPY integer, mFraudRecoveredPY decimal(18,2), mFraudTotalPY decimal(18,2),
                       iCounterfeitCountCM integer, mCounterfeitRecoveredCM decimal(18,2), mCounterfeitTotalCM decimal(18,2),
                       iCounterfeitCountPM integer, mCounterfeitRecoveredPM decimal(18,2), mCounterfeitTotalPM decimal(18,2),
                       iCounterfeitCountPY integer, mCounterfeitRecoveredPY decimal(18,2), mCounterfeitTotalPY decimal(18,2),
                       iCorruptionCountCM integer, mCorruptionRecoveredCM decimal(18,2), mCorruptionTotalCM decimal(18,2),
                       iCorruptionCountPM integer, mCorruptionRecoveredPM decimal(18,2), mCorruptionTotalPM decimal(18,2),
                       iCorruptionCountPY integer, mCorruptionRecoveredPY decimal(18,2), mCorruptionTotalPY decimal(18,2),
                       iHoldupCountCM integer, mHoldupRecoveredCM decimal(18,2), mHoldupTotalCM decimal(18,2),
                       iHoldupCountPM integer, mHoldupRecoveredPM decimal(18,2), mHoldupTotalPM decimal(18,2),
                       iHoldupCountPY integer, mHoldupRecoveredPY decimal(18,2), mHoldupTotalPY decimal(18,2),
                       iBombThreatCountCM integer, mBombThreatRecoveredCM decimal(18,2), mBombThreatTotalCM decimal(18,2),
                       iBombThreatCountPM integer, mBombThreatRecoveredPM decimal(18,2), mBombThreatTotalPM decimal(18,2),
                       iBombThreatCountPY integer, mBombThreatRecoveredPY decimal(18,2), mBombThreatTotalPY decimal(18,2),
                       iInformationSecurityCountCM integer, mInformationSecurityRecoveredCM decimal(18,2), mInformationSecurityTotalCM decimal(18,2),
                       iInformationSecurityCountPM integer, mInformationSecurityRecoveredPM decimal(18,2), mInformationSecurityTotalPM decimal(18,2),
                       iInformationSecurityCountPY integer, mInformationSecurityRecoveredPY decimal(18,2), mInformationSecurityTotalPY decimal(18,2),
                       iArsonCountCM integer, mArsonRecoveredCM decimal(18,2), mArsonTotalCM decimal(18,2),
                       iArsonCountPM integer, mArsonRecoveredPM decimal(18,2), mArsonTotalPM decimal(18,2),
                       iArsonCountPY integer, mArsonRecoveredPY decimal(18,2), mArsonTotalPY decimal(18,2),
                       iOtherCountCM integer, mOtherRecoveredCM decimal(18,2), mOtherTotalCM decimal(18,2),
                       iOtherCountPM integer, mOtherRecoveredPM decimal(18,2), mOtherTotalPM decimal(18,2),
                       iOtherCountPY integer, mOtherRecoveredPY decimal(18,2), mOtherTotalPY decimal(18,2),
                       iBlackmailCountCM integer, mBlackmailRecoveredCM decimal(18,2), mBlackmailTotalCM decimal(18,2),
                       iBlackmailCountPM integer, mBlackmailRecoveredPM decimal(18,2), mBlackmailTotalPM decimal(18,2),
                       iBlackmailCountPY integer, mBlackmailRecoveredPY decimal(18,2), mBlackmailTotalPY decimal(18,2),
                       iKidnapCountCM integer, mKidnapRecoveredCM decimal(18,2), mKidnapTotalCM decimal(18,2),
                       iKidnapCountPM integer, mKidnapRecoveredPM decimal(18,2), mKidnapTotalPM decimal(18,2),
                       iKidnapCountPY integer, mKidnapRecoveredPY decimal(18,2), mKidnapTotalPY decimal(18,2))
declare @iSubscription integer
declare @iSubscriptionPrevious integer
declare @iTheftCountCM integer
declare @mTheftRecoveredCM decimal(18,2)
declare @mTheftTotalCM decimal(18,2)
declare @iTheftCountPM integer
declare @mTheftRecoveredPM decimal(18,2)
declare @mTheftTotalPM decimal(18,2)
declare @iTheftCountPY integer
declare @mTheftRecoveredPY decimal(18,2)
declare @mTheftTotalPY decimal(18,2)
declare @iBurglaryCountCM integer
declare @mBurglaryRecoveredCM decimal(18,2)
declare @mBurglaryTotalCM decimal(18,2)
declare @iBurglaryCountPM integer
declare @mBurglaryRecoveredPM decimal(18,2)
declare @mBurglaryTotalPM decimal(18,2)
declare @iBurglaryCountPY integer
declare @mBurglaryRecoveredPY decimal(18,2)
declare @mBurglaryTotalPY decimal(18,2)
declare @iFraudCountCM integer
declare @mFraudRecoveredCM decimal(18,2)
declare @mFraudTotalCM decimal(18,2)
declare @iFraudCountPM integer
declare @mFraudRecoveredPM decimal(18,2)
declare @mFraudTotalPM decimal(18,2)
declare @iFraudCountPY integer
declare @mFraudRecoveredPY decimal(18,2)
declare @mFraudTotalPY decimal(18,2)
declare @iCounterfeitCountCM integer
declare @mCounterfeitRecoveredCM decimal(18,2)
declare @mCounterfeitTotalCM decimal(18,2)
declare @iCounterfeitCountPM integer
declare @mCounterfeitRecoveredPM decimal(18,2)
declare @mCounterfeitTotalPM decimal(18,2)
declare @iCounterfeitCountPY integer
declare @mCounterfeitRecoveredPY decimal(18,2)
declare @mCounterfeitTotalPY decimal(18,2)
declare @iCorruptionCountCM integer
declare @mCorruptionRecoveredCM decimal(18,2)
declare @mCorruptionTotalCM decimal(18,2)
declare @iCorruptionCountPM integer
declare @mCorruptionRecoveredPM decimal(18,2)
declare @mCorruptionTotalPM decimal(18,2)
declare @iCorruptionCountPY integer
declare @mCorruptionRecoveredPY decimal(18,2)
declare @mCorruptionTotalPY decimal(18,2)
declare @iHoldupCountCM integer
declare @mHoldupRecoveredCM decimal(18,2)
declare @mHoldupTotalCM decimal(18,2)
declare @iHoldupCountPM integer
declare @mHoldupRecoveredPM decimal(18,2)
declare @mHoldupTotalPM decimal(18,2)
declare @iHoldupCountPY integer
declare @mHoldupRecoveredPY decimal(18,2)
declare @mHoldupTotalPY decimal(18,2)
declare @iBombThreatCountCM integer
declare @mBombThreatRecoveredCM decimal(18,2)
declare @mBombThreatTotalCM decimal(18,2)
declare @iBombThreatCountPM integer
declare @mBombThreatRecoveredPM decimal(18,2)
declare @mBombThreatTotalPM decimal(18,2)
declare @iBombThreatCountPY integer
declare @mBombThreatRecoveredPY decimal(18,2)
declare @mBombThreatTotalPY decimal(18,2)
declare @iInformationSecurityCountCM integer
declare @mInformationSecurityRecoveredCM decimal(18,2)
declare @mInformationSecurityTotalCM decimal(18,2)
declare @iInformationSecurityCountPM integer
declare @mInformationSecurityRecoveredPM decimal(18,2)
declare @mInformationSecurityTotalPM decimal(18,2)
declare @iInformationSecurityCountPY integer
declare @mInformationSecurityRecoveredPY decimal(18,2)
declare @mInformationSecurityTotalPY decimal(18,2)
declare @iArsonCountCM integer
declare @mArsonRecoveredCM decimal(18,2)
declare @mArsonTotalCM decimal(18,2)
declare @iArsonCountPM integer
declare @mArsonRecoveredPM decimal(18,2)
declare @mArsonTotalPM decimal(18,2)
declare @iArsonCountPY integer
declare @mArsonRecoveredPY decimal(18,2)
declare @mArsonTotalPY decimal(18,2)
declare @iOtherCountCM integer
declare @mOtherRecoveredCM decimal(18,2)
declare @mOtherTotalCM decimal(18,2)
declare @iOtherCountPM integer
declare @mOtherRecoveredPM decimal(18,2)
declare @mOtherTotalPM decimal(18,2)
declare @iOtherCountPY integer
declare @mOtherRecoveredPY decimal(18,2)
declare @mOtherTotalPY decimal(18,2)
declare @iBlackmailCountCM integer
declare @mBlackmailRecoveredCM decimal(18,2)
declare @mBlackmailTotalCM decimal(18,2)
declare @iBlackmailCountPM integer
declare @mBlackmailRecoveredPM decimal(18,2)
declare @mBlackmailTotalPM decimal(18,2)
declare @iBlackmailCountPY integer
declare @mBlackmailRecoveredPY decimal(18,2)
declare @mBlackmailTotalPY decimal(18,2)
declare @iKidnapCountCM integer
declare @mKidnapRecoveredCM decimal(18,2)
declare @mKidnapTotalCM decimal(18,2)
declare @iKidnapCountPM integer
declare @mKidnapRecoveredPM decimal(18,2)
declare @mKidnapTotalPM decimal(18,2)
declare @iKidnapCountPY integer
declare @mKidnapRecoveredPY decimal(18,2)
declare @mKidnapTotalPY decimal(18,2)
declare @vLocationPrevious nvarchar(50)
declare @vPeriod nvarchar(50)
declare @vCategory nvarchar(50)
declare @vLocation nvarchar(50)
declare @iCount integer
declare @mRecovered decimal(18,2)
declare @mTotal decimal(18,2)
-- initialise
set @iTheftCountCM = 0
set @mTheftRecoveredCM = 0
set @mTheftTotalCM = 0
set @iTheftCountPM = 0
set @mTheftRecoveredPM = 0
set @mTheftTotalPM = 0
set @iTheftCountPY = 0
set @mTheftRecoveredPY = 0
set @mTheftTotalPY = 0
set @iBurglaryCountCM = 0
set @mBurglaryRecoveredCM = 0
set @mBurglaryTotalCM = 0
set @iBurglaryCountPM = 0
set @mBurglaryRecoveredPM = 0
set @mBurglaryTotalPM = 0
set @iBurglaryCountPY = 0
set @mBurglaryRecoveredPY = 0
set @mBurglaryTotalPY = 0
set @iFraudCountCM = 0
set @mFraudRecoveredCM = 0
set @mFraudTotalCM = 0
set @iFraudCountPM = 0
set @mFraudRecoveredPM = 0
set @mFraudTotalPM = 0
set @iFraudCountPY = 0
set @mFraudRecoveredPY = 0
set @mFraudTotalPY = 0
set @iCounterfeitCountCM = 0
set @mCounterfeitRecoveredCM = 0
set @mCounterfeitTotalCM = 0
set @iCounterfeitCountPM = 0
set @mCounterfeitRecoveredPM = 0
set @mCounterfeitTotalPM = 0
set @iCounterfeitCountPY = 0
set @mCounterfeitRecoveredPY = 0
set @mCounterfeitTotalPY = 0
set @iCorruptionCountCM = 0
set @mCorruptionRecoveredCM = 0
set @mCorruptionTotalCM = 0
set @iCorruptionCountPM = 0
set @mCorruptionRecoveredPM = 0
set @mCorruptionTotalPM = 0
set @iCorruptionCountPY = 0
set @mCorruptionRecoveredPY = 0
set @mCorruptionTotalPY = 0
set @iHoldupCountCM = 0
set @mHoldupRecoveredCM = 0
set @mHoldupTotalCM = 0
set @iHoldupCountPM = 0
set @mHoldupRecoveredPM = 0
set @mHoldupTotalPM = 0
set @iHoldupCountPY = 0
set @mHoldupRecoveredPY = 0
set @mHoldupTotalPY = 0
set @iBombThreatCountCM = 0
set @mBombThreatRecoveredCM = 0
set @mBombThreatTotalCM = 0
set @iBombThreatCountPM = 0
set @mBombThreatRecoveredPM = 0
set @mBombThreatTotalPM = 0
set @iBombThreatCountPY = 0
set @mBombThreatRecoveredPY = 0
set @mBombThreatTotalPY = 0
set @iInformationSecurityCountCM = 0
set @mInformationSecurityRecoveredCM = 0
set @mInformationSecurityTotalCM = 0
set @iInformationSecurityCountPM = 0
set @mInformationSecurityRecoveredPM = 0
set @mInformationSecurityTotalPM = 0
set @iInformationSecurityCountPY = 0
set @mInformationSecurityRecoveredPY = 0
set @mInformationSecurityTotalPY = 0
set @iArsonCountCM = 0
set @mArsonRecoveredCM = 0
set @mArsonTotalCM = 0
set @iArsonCountPM = 0
set @mArsonRecoveredPM = 0
set @mArsonTotalPM = 0
set @iArsonCountPY = 0
set @mArsonRecoveredPY = 0
set @mArsonTotalPY = 0
set @iOtherCountCM = 0
set @mOtherRecoveredCM = 0
set @mOtherTotalCM = 0
set @iOtherCountPM = 0
set @mOtherRecoveredPM = 0
set @mOtherTotalPM = 0
set @iOtherCountPY = 0
set @mOtherRecoveredPY = 0
set @mOtherTotalPY = 0
set @iBlackmailCountCM = 0
set @mBlackmailRecoveredCM = 0
set @mBlackmailTotalCM = 0
set @iBlackmailCountPM = 0
set @mBlackmailRecoveredPM = 0
set @mBlackmailTotalPM = 0
set @iBlackmailCountPY = 0
set @mBlackmailRecoveredPY = 0
set @mBlackmailTotalPY = 0
set @iKidnapCountCM = 0
set @mKidnapRecoveredCM = 0
set @mKidnapTotalCM = 0
set @iKidnapCountPM = 0
set @mKidnapRecoveredPM = 0
set @mKidnapTotalPM = 0
set @iKidnapCountPY = 0
set @mKidnapRecoveredPY = 0
set @mKidnapTotalPY = 0
set @vLocationPrevious = ''

declare curCASES cursor for
select T.SUBSCRIPTIONID,
       T.PERIOD,
       C.NODETAG as CATEGORY,
       L.NODENAME as LOCATION,
       T.[COUNT],
       T.RECOVEREDVALUE,
       T.TOTALVALUE
from #tTOTAL as T
inner join CASESTREE as C on C.TREEID = T.CATEGORYID
inner join CASESTREE as L on L.TREEID = T.LOCATIONID
order by L.NODENAME /*LOCATION*/,
         T.PERIOD,
         C.NODETAG /*CATEGORY*/
open curCASES
     fetch next from curCASES into @iSubscription, @vPeriod, @vCategory, @vLocation, @iCount, @mRecovered, @mTotal
while @@FETCH_STATUS = 0
begin
     if @vLocationPrevious <> ''
     begin
         if @vLocation <> @vLocationPrevious
         begin
             insert into #tREPORT (iSubscriptionID, vStore,
                                   iTheftCountCM, mTheftRecoveredCM, mTheftTotalCM,
                                   iTheftCountPM, mTheftRecoveredPM, mTheftTotalPM,
                                   iTheftCountPY, mTheftRecoveredPY, mTheftTotalPY,
                                   iBurglaryCountCM, mBurglaryRecoveredCM, mBurglaryTotalCM,
                                   iBurglaryCountPM, mBurglaryRecoveredPM, mBurglaryTotalPM,
                                   iBurglaryCountPY, mBurglaryRecoveredPY, mBurglaryTotalPY,
                                   iFraudCountCM, mFraudRecoveredCM, mFraudTotalCM,
                                   iFraudCountPM, mFraudRecoveredPM, mFraudTotalPM,
                                   iFraudCountPY, mFraudRecoveredPY, mFraudTotalPY,
                                   iCounterfeitCountCM, mCounterfeitRecoveredCM, mCounterfeitTotalCM,
                                   iCounterfeitCountPM, mCounterfeitRecoveredPM, mCounterfeitTotalPM,
                                   iCounterfeitCountPY, mCounterfeitRecoveredPY, mCounterfeitTotalPY,
                                   iCorruptionCountCM, mCorruptionRecoveredCM, mCorruptionTotalCM,
                                   iCorruptionCountPM, mCorruptionRecoveredPM, mCorruptionTotalPM,
                                   iCorruptionCountPY, mCorruptionRecoveredPY, mCorruptionTotalPY,
                                   iHoldupCountCM, mHoldupRecoveredCM, mHoldupTotalCM,
                                   iHoldupCountPM, mHoldupRecoveredPM, mHoldupTotalPM,
                                   iHoldupCountPY, mHoldupRecoveredPY, mHoldupTotalPY,
                                   iBombThreatCountCM, mBombThreatRecoveredCM, mBombThreatTotalCM,
                                   iBombThreatCountPM, mBombThreatRecoveredPM, mBombThreatTotalPM,
                                   iBombThreatCountPY, mBombThreatRecoveredPY, mBombThreatTotalPY,
                                   iInformationSecurityCountCM, mInformationSecurityRecoveredCM, mInformationSecurityTotalCM,
                                   iInformationSecurityCountPM, mInformationSecurityRecoveredPM, mInformationSecurityTotalPM,
                                   iInformationSecurityCountPY, mInformationSecurityRecoveredPY, mInformationSecurityTotalPY,
                                   iArsonCountCM, mArsonRecoveredCM, mArsonTotalCM,
                                   iArsonCountPM, mArsonRecoveredPM, mArsonTotalPM,
                                   iArsonCountPY, mArsonRecoveredPY, mArsonTotalPY,
                                   iOtherCountCM, mOtherRecoveredCM, mOtherTotalCM,
                                   iOtherCountPM, mOtherRecoveredPM, mOtherTotalPM,
                                   iOtherCountPY, mOtherRecoveredPY, mOtherTotalPY,
                                   iBlackmailCountCM, mBlackmailRecoveredCM, mBlackmailTotalCM,
                                   iBlackmailCountPM, mBlackmailRecoveredPM, mBlackmailTotalPM,
                                   iBlackmailCountPY, mBlackmailRecoveredPY, mBlackmailTotalPY,
                                   iKidnapCountCM, mKidnapRecoveredCM, mKidnapTotalCM,
                                   iKidnapCountPM, mKidnapRecoveredPM, mKidnapTotalPM,
                                   iKidnapCountPY, mKidnapRecoveredPY, mKidnapTotalPY)
                           values (@iSubscriptionPrevious, @vLocationPrevious,
                                   @iTheftCountCM, @mTheftRecoveredCM, @mTheftTotalCM,
                                   @iTheftCountPM, @mTheftRecoveredPM, @mTheftTotalPM,
                                   @iTheftCountPY, @mTheftRecoveredPY, @mTheftTotalPY,
                                   @iBurglaryCountCM, @mBurglaryRecoveredCM, @mBurglaryTotalCM,
                                   @iBurglaryCountPM, @mBurglaryRecoveredPM, @mBurglaryTotalPM,
                                   @iBurglaryCountPY, @mBurglaryRecoveredPY, @mBurglaryTotalPY,
                                   @iFraudCountCM, @mFraudRecoveredCM, @mFraudTotalCM,
                                   @iFraudCountPM, @mFraudRecoveredPM, @mFraudTotalPM,
                                   @iFraudCountPY, @mFraudRecoveredPY, @mFraudTotalPY,
                                   @iCounterfeitCountCM, @mCounterfeitRecoveredCM, @mCounterfeitTotalCM,
                                   @iCounterfeitCountPM, @mCounterfeitRecoveredPM, @mCounterfeitTotalPM,
                                   @iCounterfeitCountPY, @mCounterfeitRecoveredPY, @mCounterfeitTotalPY,
                                   @iCorruptionCountCM, @mCorruptionRecoveredCM, @mCorruptionTotalCM,
                                   @iCorruptionCountPM, @mCorruptionRecoveredPM, @mCorruptionTotalPM,
                                   @iCorruptionCountPY, @mCorruptionRecoveredPY, @mCorruptionTotalPY,
                                   @iHoldupCountCM, @mHoldupRecoveredCM, @mHoldupTotalCM,
                                   @iHoldupCountPM, @mHoldupRecoveredPM, @mHoldupTotalPM,
                                   @iHoldupCountPY, @mHoldupRecoveredPY, @mHoldupTotalPY,
                                   @iBombThreatCountCM, @mBombThreatRecoveredCM, @mBombThreatTotalCM,
                                   @iBombThreatCountPM, @mBombThreatRecoveredPM, @mBombThreatTotalPM,
                                   @iBombThreatCountPY, @mBombThreatRecoveredPY, @mBombThreatTotalPY,
                                   @iInformationSecurityCountCM, @mInformationSecurityRecoveredCM, @mInformationSecurityTotalCM,
                                   @iInformationSecurityCountPM, @mInformationSecurityRecoveredPM, @mInformationSecurityTotalPM,
                                   @iInformationSecurityCountPY, @mInformationSecurityRecoveredPY, @mInformationSecurityTotalPY,
                                   @iArsonCountCM, @mArsonRecoveredCM, @mArsonTotalCM,
                                   @iArsonCountPM, @mArsonRecoveredPM, @mArsonTotalPM,
                                   @iArsonCountPY, @mArsonRecoveredPY, @mArsonTotalPY,
                                   @iOtherCountCM, @mOtherRecoveredCM, @mOtherTotalCM,
                                   @iOtherCountPM, @mOtherRecoveredPM, @mOtherTotalPM,
                                   @iOtherCountPY, @mOtherRecoveredPY, @mOtherTotalPY,
                                   @iBlackmailCountCM, @mBlackmailRecoveredCM, @mBlackmailTotalCM,
                                   @iBlackmailCountPM, @mBlackmailRecoveredPM, @mBlackmailTotalPM,
                                   @iBlackmailCountPY, @mBlackmailRecoveredPY, @mBlackmailTotalPY,
                                   @iKidnapCountCM, @mKidnapRecoveredCM, @mKidnapTotalCM,
                                   @iKidnapCountPM, @mKidnapRecoveredPM, @mKidnapTotalPM,
                                   @iKidnapCountPY, @mKidnapRecoveredPY, @mKidnapTotalPY)
             -- reset
             set @iTheftCountCM = 0
             set @mTheftRecoveredCM = 0
             set @mTheftTotalCM = 0
             set @iTheftCountPM = 0
             set @mTheftRecoveredPM = 0
             set @mTheftTotalPM = 0
             set @iTheftCountPY = 0
             set @mTheftRecoveredPY = 0
             set @mTheftTotalPY = 0
             set @iBurglaryCountCM = 0
             set @mBurglaryRecoveredCM = 0
             set @mBurglaryTotalCM = 0
             set @iBurglaryCountPM = 0
             set @mBurglaryRecoveredPM = 0
             set @mBurglaryTotalPM = 0
             set @iBurglaryCountPY = 0
             set @mBurglaryRecoveredPY = 0
             set @mBurglaryTotalPY = 0
             set @iFraudCountCM = 0
             set @mFraudRecoveredCM = 0
             set @mFraudTotalCM = 0
             set @iFraudCountPM = 0
             set @mFraudRecoveredPM = 0
             set @mFraudTotalPM = 0
             set @iFraudCountPY = 0
             set @mFraudRecoveredPY = 0
             set @mFraudTotalPY = 0
             set @iCounterfeitCountCM = 0
             set @mCounterfeitRecoveredCM = 0
             set @mCounterfeitTotalCM = 0
             set @iCounterfeitCountPM = 0
             set @mCounterfeitRecoveredPM = 0
             set @mCounterfeitTotalPM = 0
             set @iCounterfeitCountPY = 0
             set @mCounterfeitRecoveredPY = 0
             set @mCounterfeitTotalPY = 0
             set @iCorruptionCountCM = 0
             set @mCorruptionRecoveredCM = 0
             set @mCorruptionTotalCM = 0
             set @iCorruptionCountPM = 0
             set @mCorruptionRecoveredPM = 0
             set @mCorruptionTotalPM = 0
             set @iCorruptionCountPY = 0
             set @mCorruptionRecoveredPY = 0
             set @mCorruptionTotalPY = 0
             set @iHoldupCountCM = 0
             set @mHoldupRecoveredCM = 0
             set @mHoldupTotalCM = 0
             set @iHoldupCountPM = 0
             set @mHoldupRecoveredPM = 0
             set @mHoldupTotalPM = 0
             set @iHoldupCountPY = 0
             set @mHoldupRecoveredPY = 0
             set @mHoldupTotalPY = 0
             set @iBombThreatCountCM = 0
             set @mBombThreatRecoveredCM = 0
             set @mBombThreatTotalCM = 0
             set @iBombThreatCountPM = 0
             set @mBombThreatRecoveredPM = 0
             set @mBombThreatTotalPM = 0
             set @iBombThreatCountPY = 0
             set @mBombThreatRecoveredPY = 0
             set @mBombThreatTotalPY = 0
             set @iInformationSecurityCountCM = 0
             set @mInformationSecurityRecoveredCM = 0
             set @mInformationSecurityTotalCM = 0
             set @iInformationSecurityCountPM = 0
             set @mInformationSecurityRecoveredPM = 0
             set @mInformationSecurityTotalPM = 0
             set @iInformationSecurityCountPY = 0
             set @mInformationSecurityRecoveredPY = 0
             set @mInformationSecurityTotalPY = 0
             set @iArsonCountCM = 0
             set @mArsonRecoveredCM = 0
             set @mArsonTotalCM = 0
             set @iArsonCountPM = 0
             set @mArsonRecoveredPM = 0
             set @mArsonTotalPM = 0
             set @iArsonCountPY = 0
             set @mArsonRecoveredPY = 0
             set @mArsonTotalPY = 0
             set @iOtherCountCM = 0
             set @mOtherRecoveredCM = 0
             set @mOtherTotalCM = 0
             set @iOtherCountPM = 0
             set @mOtherRecoveredPM = 0
             set @mOtherTotalPM = 0
             set @iOtherCountPY = 0
             set @mOtherRecoveredPY = 0
             set @mOtherTotalPY = 0
             set @iBlackmailCountCM = 0
             set @mBlackmailRecoveredCM = 0
             set @mBlackmailTotalCM = 0
             set @iBlackmailCountPM = 0
             set @mBlackmailRecoveredPM = 0
             set @mBlackmailTotalPM = 0
             set @iBlackmailCountPY = 0
             set @mBlackmailRecoveredPY = 0
             set @mBlackmailTotalPY = 0
             set @iKidnapCountCM = 0
             set @mKidnapRecoveredCM = 0
             set @mKidnapTotalCM = 0
             set @iKidnapCountPM = 0
             set @mKidnapRecoveredPM = 0
             set @mKidnapTotalPM = 0
             set @iKidnapCountPY = 0
             set @mKidnapRecoveredPY = 0
             set @mKidnapTotalPY = 0
         end
     end
     if @vCategory = @vTheft
     begin
          if @vPeriod = 'CM'
          begin
               set @iTheftCountCM = @iCount
               set @mTheftRecoveredCM = @mRecovered
               set @mTheftTotalCM = @mTotal
          end
          if @vPeriod = 'PM'
          begin
               set @iTheftCountPM = @iCount
               set @mTheftRecoveredPM = @mRecovered
               set @mTheftTotalPM = @mTotal
          end
          if @vPeriod = 'PY'
          begin
               set @iTheftCountPY = @iCount
               set @mTheftRecoveredPY = @mRecovered
               set @mTheftTotalPY = @mTotal
          end
     end
     if @vCategory = @vBurglary
     begin
          if @vPeriod = 'CM'
          begin
               set @iBurglaryCountCM = @iCount
               set @mBurglaryRecoveredCM = @mRecovered
               set @mBurglaryTotalCM = @mTotal
          end
          if @vPeriod = 'PM'
          begin
               set @iBurglaryCountPM = @iCount
               set @mBurglaryRecoveredPM = @mRecovered
               set @mBurglaryTotalPM = @mTotal
          end
          if @vPeriod = 'PY'
          begin
               set @iBurglaryCountPY = @iCount
               set @mBurglaryRecoveredPY = @mRecovered
               set @mBurglaryTotalPY = @mTotal
          end
     end
     if @vCategory = @vFraud
     begin
          if @vPeriod = 'CM'
          begin
               set @iFraudCountCM = @iCount
               set @mFraudRecoveredCM = @mRecovered
               set @mFraudTotalCM = @mTotal
          end
          if @vPeriod = 'PM'
          begin
               set @iFraudCountPM = @iCount
               set @mFraudRecoveredPM = @mRecovered
               set @mFraudTotalPM = @mTotal
          end
          if @vPeriod = 'PY'
          begin
               set @iFraudCountPY = @iCount
               set @mFraudRecoveredPY = @mRecovered
               set @mFraudTotalPY = @mTotal
          end
     end
     if @vCategory = @vCounterfeit
     begin
          if @vPeriod = 'CM'
          begin
               set @iCounterfeitCountCM = @iCount
               set @mCounterfeitRecoveredCM = @mRecovered
               set @mCounterfeitTotalCM = @mTotal
          end
          if @vPeriod = 'PM'
          begin
               set @iCounterfeitCountPM = @iCount
               set @mCounterfeitRecoveredPM = @mRecovered
               set @mCounterfeitTotalPM = @mTotal
          end
          if @vPeriod = 'PY'
          begin
               set @iCounterfeitCountPY = @iCount
               set @mCounterfeitRecoveredPY = @mRecovered
               set @mCounterfeitTotalPY = @mTotal
          end
     end
     if @vCategory = @vCorruption
     begin
          if @vPeriod = 'CM'
          begin
               set @iCorruptionCountCM = @iCount
               set @mCorruptionRecoveredCM = @mRecovered
               set @mCorruptionTotalCM = @mTotal
          end
          if @vPeriod = 'PM'
          begin
               set @iCorruptionCountPM = @iCount
               set @mCorruptionRecoveredPM = @mRecovered
               set @mCorruptionTotalPM = @mTotal
          end
          if @vPeriod = 'PY'
          begin
               set @iCorruptionCountPY = @iCount
               set @mCorruptionRecoveredPY = @mRecovered
               set @mCorruptionTotalPY = @mTotal
          end
     end
     if @vCategory = @vHoldup
     begin
          if @vPeriod = 'CM'
          begin
               set @iHoldupCountCM = @iCount
               set @mHoldupRecoveredCM = @mRecovered
               set @mHoldupTotalCM = @mTotal
          end
          if @vPeriod = 'PM'
          begin
               set @iHoldupCountPM = @iCount
               set @mHoldupRecoveredPM = @mRecovered
               set @mHoldupTotalPM = @mTotal
          end
          if @vPeriod = 'PY'
          begin
               set @iHoldupCountPY = @iCount
               set @mHoldupRecoveredPY = @mRecovered
               set @mHoldupTotalPY = @mTotal
          end
     end
     if @vCategory = @vBombThreat
     begin
          if @vPeriod = 'CM'
          begin
               set @iBombThreatCountCM = @iCount
               set @mBombThreatRecoveredCM = @mRecovered
               set @mBombThreatTotalCM = @mTotal
          end
          if @vPeriod = 'PM'
          begin
               set @iBombThreatCountPM = @iCount
               set @mBombThreatRecoveredPM = @mRecovered
               set @mBombThreatTotalPM = @mTotal
          end
          if @vPeriod = 'PY'
          begin
               set @iBombThreatCountPY = @iCount
               set @mBombThreatRecoveredPY = @mRecovered
               set @mBombThreatTotalPY = @mTotal
          end
     end
     if @vCategory = @vInformationSecurity
     begin
          if @vPeriod = 'CM'
          begin
               set @iInformationSecurityCountCM = @iCount
               set @mInformationSecurityRecoveredCM = @mRecovered
               set @mInformationSecurityTotalCM = @mTotal
          end
          if @vPeriod = 'PM'
          begin
               set @iInformationSecurityCountPM = @iCount
               set @mInformationSecurityRecoveredPM = @mRecovered
               set @mInformationSecurityTotalPM = @mTotal
          end
          if @vPeriod = 'PY'
          begin
               set @iInformationSecurityCountPY = @iCount
               set @mInformationSecurityRecoveredPY = @mRecovered
               set @mInformationSecurityTotalPY = @mTotal
          end
     end
     if @vCategory = @vArson	
     begin
          if @vPeriod = 'CM'
          begin
               set @iArsonCountCM = @iCount
               set @mArsonRecoveredCM = @mRecovered
               set @mArsonTotalCM = @mTotal
          end
          if @vPeriod = 'PM'
          begin
               set @iArsonCountPM = @iCount
               set @mArsonRecoveredPM = @mRecovered
               set @mArsonTotalPM = @mTotal
          end
          if @vPeriod = 'PY'
          begin
               set @iArsonCountPY = @iCount
               set @mArsonRecoveredPY = @mRecovered
               set @mArsonTotalPY = @mTotal
          end
     end
     if @vCategory = @vOther
     begin
          if @vPeriod = 'CM'
          begin
               set @iOtherCountCM = @iCount
               set @mOtherRecoveredCM = @mRecovered
               set @mOtherTotalCM = @mTotal
          end
          if @vPeriod = 'PM'
          begin
               set @iOtherCountPM = @iCount
               set @mOtherRecoveredPM = @mRecovered
               set @mOtherTotalPM = @mTotal
          end
          if @vPeriod = 'PY'
          begin
               set @iOtherCountPY = @iCount
               set @mOtherRecoveredPY = @mRecovered
               set @mOtherTotalPY = @mTotal
          end
     end
     if @vCategory = @vBlackmail
     begin
          if @vPeriod = 'CM'
          begin
               set @iBlackmailCountCM = @iCount
               set @mBlackmailRecoveredCM = @mRecovered
               set @mBlackmailTotalCM = @mTotal
          end
          if @vPeriod = 'PM'
          begin
               set @iBlackmailCountPM = @iCount
               set @mBlackmailRecoveredPM = @mRecovered
               set @mBlackmailTotalPM = @mTotal
          end
          if @vPeriod = 'PY'
          begin
               set @iBlackmailCountPY = @iCount
               set @mBlackmailRecoveredPY = @mRecovered
               set @mBlackmailTotalPY = @mTotal
          end
     end
     if @vCategory = @vKidnap
     begin
          if @vPeriod = 'CM'
          begin
               set @iKidnapCountCM = @iCount
               set @mKidnapRecoveredCM = @mRecovered
               set @mKidnapTotalCM = @mTotal
          end
          if @vPeriod = 'PM'
          begin
               set @iKidnapCountPM = @iCount
               set @mKidnapRecoveredPM = @mRecovered
               set @mKidnapTotalPM = @mTotal
          end
          if @vPeriod = 'PY'
          begin
               set @iKidnapCountPY = @iCount
               set @mKidnapRecoveredPY = @mRecovered
               set @mKidnapTotalPY = @mTotal
          end
     end
     set @vLocationPrevious = @vLocation
     set @iSubscriptionPrevious = @iSubscription
     fetch next from curCASES into @iSubscription, @vPeriod, @vCategory, @vLocation, @iCount, @mRecovered, @mTotal
end
close curCASES
deallocate curCASES
if @vLocationPrevious <> ''
begin
    insert into #tREPORT (iSubscriptionID, vStore,
                          iTheftCountCM, mTheftRecoveredCM, mTheftTotalCM,
                          iTheftCountPM, mTheftRecoveredPM, mTheftTotalPM,
                          iTheftCountPY, mTheftRecoveredPY, mTheftTotalPY,
                          iBurglaryCountCM, mBurglaryRecoveredCM, mBurglaryTotalCM,
                          iBurglaryCountPM, mBurglaryRecoveredPM, mBurglaryTotalPM,
                          iBurglaryCountPY, mBurglaryRecoveredPY, mBurglaryTotalPY,
                          iFraudCountCM, mFraudRecoveredCM, mFraudTotalCM,
                          iFraudCountPM, mFraudRecoveredPM, mFraudTotalPM,
                          iFraudCountPY, mFraudRecoveredPY, mFraudTotalPY,
                          iCounterfeitCountCM, mCounterfeitRecoveredCM, mCounterfeitTotalCM,
                          iCounterfeitCountPM, mCounterfeitRecoveredPM, mCounterfeitTotalPM,
                          iCounterfeitCountPY, mCounterfeitRecoveredPY, mCounterfeitTotalPY,
                          iCorruptionCountCM, mCorruptionRecoveredCM, mCorruptionTotalCM,
                          iCorruptionCountPM, mCorruptionRecoveredPM, mCorruptionTotalPM,
                          iCorruptionCountPY, mCorruptionRecoveredPY, mCorruptionTotalPY,
                          iHoldupCountCM, mHoldupRecoveredCM, mHoldupTotalCM,
                          iHoldupCountPM, mHoldupRecoveredPM, mHoldupTotalPM,
                          iHoldupCountPY, mHoldupRecoveredPY, mHoldupTotalPY,
                          iBombThreatCountCM, mBombThreatRecoveredCM, mBombThreatTotalCM,
                          iBombThreatCountPM, mBombThreatRecoveredPM, mBombThreatTotalPM,
                          iBombThreatCountPY, mBombThreatRecoveredPY, mBombThreatTotalPY,
                          iInformationSecurityCountCM, mInformationSecurityRecoveredCM, mInformationSecurityTotalCM,
                          iInformationSecurityCountPM, mInformationSecurityRecoveredPM, mInformationSecurityTotalPM,
                          iInformationSecurityCountPY, mInformationSecurityRecoveredPY, mInformationSecurityTotalPY,
                          iArsonCountCM, mArsonRecoveredCM, mArsonTotalCM,
                          iArsonCountPM, mArsonRecoveredPM, mArsonTotalPM,
                          iArsonCountPY, mArsonRecoveredPY, mArsonTotalPY,
                          iOtherCountCM, mOtherRecoveredCM, mOtherTotalCM,
                          iOtherCountPM, mOtherRecoveredPM, mOtherTotalPM,
                          iOtherCountPY, mOtherRecoveredPY, mOtherTotalPY,
                          iBlackmailCountCM, mBlackmailRecoveredCM, mBlackmailTotalCM,
                          iBlackmailCountPM, mBlackmailRecoveredPM, mBlackmailTotalPM,
                          iBlackmailCountPY, mBlackmailRecoveredPY, mBlackmailTotalPY,
                          iKidnapCountCM, mKidnapRecoveredCM, mKidnapTotalCM,
                          iKidnapCountPM, mKidnapRecoveredPM, mKidnapTotalPM,
                          iKidnapCountPY, mKidnapRecoveredPY, mKidnapTotalPY)
                  values (@iSubscriptionPrevious, @vLocationPrevious,
                          @iTheftCountCM, @mTheftRecoveredCM, @mTheftTotalCM,
                          @iTheftCountPM, @mTheftRecoveredPM, @mTheftTotalPM,
                          @iTheftCountPY, @mTheftRecoveredPY, @mTheftTotalPY,
                          @iBurglaryCountCM, @mBurglaryRecoveredCM, @mBurglaryTotalCM,
                          @iBurglaryCountPM, @mBurglaryRecoveredPM, @mBurglaryTotalPM,
                          @iBurglaryCountPY, @mBurglaryRecoveredPY, @mBurglaryTotalPY,
                          @iFraudCountCM, @mFraudRecoveredCM, @mFraudTotalCM,
                          @iFraudCountPM, @mFraudRecoveredPM, @mFraudTotalPM,
                          @iFraudCountPY, @mFraudRecoveredPY, @mFraudTotalPY,
                          @iCounterfeitCountCM, @mCounterfeitRecoveredCM, @mCounterfeitTotalCM,
                          @iCounterfeitCountPM, @mCounterfeitRecoveredPM, @mCounterfeitTotalPM,
                          @iCounterfeitCountPY, @mCounterfeitRecoveredPY, @mCounterfeitTotalPY,
                          @iCorruptionCountCM, @mCorruptionRecoveredCM, @mCorruptionTotalCM,
                          @iCorruptionCountPM, @mCorruptionRecoveredPM, @mCorruptionTotalPM,
                          @iCorruptionCountPY, @mCorruptionRecoveredPY, @mCorruptionTotalPY,
                          @iHoldupCountCM, @mHoldupRecoveredCM, @mHoldupTotalCM,
                          @iHoldupCountPM, @mHoldupRecoveredPM, @mHoldupTotalPM,
                          @iHoldupCountPY, @mHoldupRecoveredPY, @mHoldupTotalPY,
                          @iBombThreatCountCM, @mBombThreatRecoveredCM, @mBombThreatTotalCM,
                          @iBombThreatCountPM, @mBombThreatRecoveredPM, @mBombThreatTotalPM,
                          @iBombThreatCountPY, @mBombThreatRecoveredPY, @mBombThreatTotalPY,
                          @iInformationSecurityCountCM, @mInformationSecurityRecoveredCM, @mInformationSecurityTotalCM,
                          @iInformationSecurityCountPM, @mInformationSecurityRecoveredPM, @mInformationSecurityTotalPM,
                          @iInformationSecurityCountPY, @mInformationSecurityRecoveredPY, @mInformationSecurityTotalPY,
                          @iArsonCountCM, @mArsonRecoveredCM, @mArsonTotalCM,
                          @iArsonCountPM, @mArsonRecoveredPM, @mArsonTotalPM,
                          @iArsonCountPY, @mArsonRecoveredPY, @mArsonTotalPY,
                          @iOtherCountCM, @mOtherRecoveredCM, @mOtherTotalCM,
                          @iOtherCountPM, @mOtherRecoveredPM, @mOtherTotalPM,
                          @iOtherCountPY, @mOtherRecoveredPY, @mOtherTotalPY,
                          @iBlackmailCountCM, @mBlackmailRecoveredCM, @mBlackmailTotalCM,
                          @iBlackmailCountPM, @mBlackmailRecoveredPM, @mBlackmailTotalPM,
                          @iBlackmailCountPY, @mBlackmailRecoveredPY, @mBlackmailTotalPY,
                          @iKidnapCountCM, @mKidnapRecoveredCM, @mKidnapTotalCM,
                          @iKidnapCountPM, @mKidnapRecoveredPM, @mKidnapTotalPM,
                          @iKidnapCountPY, @mKidnapRecoveredPY, @mKidnapTotalPY)
end

-- report results
select S.DESCRIPTION as Company,
       @dMonthCurrent as dMonthCurrent,
       R.*
from #tREPORT as R
inner join SUBSCRIPTIONS as S on S.SUBSCRIPTIONID = R.iSubscriptionID

-- housekeeping
if  not OBJECT_ID('tempdb..#tREPORT') is null
drop table #tREPORT
if not OBJECT_ID('tempdb..#tCASES') is null
drop table #tCASES
if not OBJECT_ID('tempdb..#tTOTAL') is null
drop table #tTOTAL

GO
