SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.cmsGetCaseQuery 
(
	@SubscriptionID INTEGER=0,
	@SpecificType CHAR(1)='',			/* Specific Term */
	@SpecificValue VARCHAR(100)='',		/* Case Number, File Number, Key Word */
	@Company VARCHAR(100)='',
	@Country VARCHAR(10)='',
	@Location INTEGER=0,
	@IncidentType VARCHAR(10)='',
	@DateBegin DATETIME='1-Jan-1900',
	@DateFinish DATETIME='1-Jan-1900',
	@ValueType CHAR(1)='',				/* Loss, Damage, Recovery */
	@ValueBegin MONEY=0,
	@ValueFinish MONEY=0,
	@Other INTEGER=0,
	@Classification INTEGER=0
)
AS
SET NOCOUNT ON
CREATE TABLE #Search (CASEID INTEGER, TYPE VARCHAR(50))
DECLARE @MatchCriteria INTEGER
SET @MatchCriteria = 0
---------------------------------------------------------------------------------
IF @SpecificType = 'C' -- Case Number
BEGIN
	SET @MatchCriteria = @MatchCriteria + 1
	INSERT INTO #Search (CASEID, TYPE)
	SELECT CASEID, 'STC'
	FROM CASES WITH (NOLOCK)
	WHERE CASEID = CAST(@SpecificValue AS INTEGER)
	AND (@SubscriptionID = 0 OR SUBSCRIPTIONID = @SubscriptionID)
END
---------------------------------------------------------------------------------
IF @SpecificType = 'F' -- File Number
BEGIN
	SET @MatchCriteria = @MatchCriteria + 1
	INSERT INTO #Search (CASEID, TYPE)
	SELECT CASEID, 'STF'
	FROM CASES WITH (NOLOCK)
	WHERE FILENO LIKE ('%' + LTRIM(RTRIM(@SpecificValue)) + '%')
	AND (@SubscriptionID = 0 OR SUBSCRIPTIONID = @SubscriptionID)
END
---------------------------------------------------------------------------------
IF @SpecificType = 'K' -- Key Word
BEGIN
	SET @MatchCriteria = @MatchCriteria + 1
	INSERT INTO #Search (CASEID, TYPE)
	SELECT CASEID, 'STK'
	FROM CASES WITH (NOLOCK)
	WHERE EVENTDESCRIPTION LIKE '%' + @SpecificValue + '%'
	UNION
	SELECT CASEID, 'STK'
	FROM DIARY WITH (NOLOCK)
	WHERE NOTE LIKE '%' + @SpecificValue + '%'
	UNION
	SELECT DISTINCT CASEID, 'STK'
	FROM LEDGERVALUES AS L WITH (NOLOCK)
	INNER JOIN DIARY AS D WITH (NOLOCK) ON D.DIARYID = L.DIARYID
	WHERE L.Description LIKE '%' + @SpecificValue + '%'
END
---------------------------------------------------------------------------------
IF LEN(@Company) > 0
BEGIN
	SET @MatchCriteria = @MatchCriteria + 1
	INSERT INTO #Search (CASEID, TYPE)
	SELECT CASEID, 'COMPANY'
	FROM CASES WITH (NOLOCK)
	WHERE SUBSCRIPTIONID IN (SELECT DISTINCT SUBSCRIPTIONID
							 FROM SUBSCRIPTIONS WITH (NOLOCK)
							 WHERE TMROLE LIKE (LTRIM(RTRIM(@Company)) + '.%'))
	AND (@SubscriptionID = 0 OR SUBSCRIPTIONID = @SubscriptionID)
END
---------------------------------------------------------------------------------
IF LEN(@Country) > 0
BEGIN
	SET @MatchCriteria = @MatchCriteria + 1
	INSERT INTO #Search (CASEID, TYPE)
	SELECT CASEID, 'COUNTRY'
	FROM CASES WITH (NOLOCK)
	WHERE SUBSCRIPTIONID IN (SELECT DISTINCT SUBSCRIPTIONID
							 FROM SUBSCRIPTIONS WITH (NOLOCK)
							 WHERE TMROLE LIKE ('%.' + LTRIM(RTRIM(@Country))))
	AND (@SubscriptionID = 0 OR SUBSCRIPTIONID = @SubscriptionID)
END
---------------------------------------------------------------------------------
IF @Location > 0
BEGIN
	SET @MatchCriteria = @MatchCriteria + 1
	INSERT INTO #Search (CASEID, TYPE)
	SELECT CASEID, 'LOCATION'
	FROM CASES WITH (NOLOCK)
	WHERE _CMSCAT2OF = @Location
	AND (@SubscriptionID = 0 OR SUBSCRIPTIONID = @SubscriptionID)
END
---------------------------------------------------------------------------------
IF LEN(@IncidentType) > 0
BEGIN
	SET @MatchCriteria = @MatchCriteria + 1
	INSERT INTO #Search (CASEID, TYPE)
	SELECT C.CASEID, 'INCIDENT'
	FROM CASESTREE AS T WITH (NOLOCK)
	LEFT JOIN CASES AS C WITH (NOLOCK) ON (C._CMSCAT1OF = T.TREEID) AND (C.SUBSCRIPTIONID = @SubscriptionID)
	WHERE CATEGORYID = 1300 -- Incident Type
	AND T.ACTIVE = 1
	AND TREELEVEL > 1
	AND NODETAG = @IncidentType
	AND (@SubscriptionID = 0 OR SUBSCRIPTIONID = @SubscriptionID)
END
---------------------------------------------------------------------------------
IF @DateBegin > '1-Jan-1900' OR @DateFinish > '1-Jan-1900'
BEGIN
	SET @MatchCriteria = @MatchCriteria + 1
	INSERT INTO #Search (CASEID, TYPE)
	SELECT CASEID, 'DATE'
	FROM CASES WITH (NOLOCK)
	WHERE (EVENTDATE >= @DateBegin AND EVENTDATE <= @DateFinish)
	AND (@SubscriptionID = 0 OR SUBSCRIPTIONID = @SubscriptionID)
END
---------------------------------------------------------------------------------
IF @ValueBegin > 0 OR @ValueFinish >0
BEGIN
	IF @ValueType = 'L' -- Loss
	BEGIN
		SET @MatchCriteria = @MatchCriteria + 1
		INSERT INTO #Search (CASEID, TYPE)
		SELECT CASEID, 'VL'
		FROM CASES WITH (NOLOCK)
		WHERE (TOTALVALUE - RECOVEREDVALUE) >= @ValueBegin AND (TOTALVALUE - RECOVEREDVALUE) <= @ValueFinish
		AND (@SubscriptionID = 0 OR SUBSCRIPTIONID = @SubscriptionID)
	END
	IF @ValueType = 'D' -- Damage
	BEGIN
		SET @MatchCriteria = @MatchCriteria + 1
		INSERT INTO #Search (CASEID, TYPE)
		SELECT CASEID, 'VD'
		FROM CASES WITH (NOLOCK)
		WHERE TOTALVALUE >= @ValueBegin AND TOTALVALUE <= @ValueFinish
		AND (@SubscriptionID = 0 OR SUBSCRIPTIONID = @SubscriptionID)
	END
	IF @ValueType = 'R' -- Recovery
	BEGIN
		SET @MatchCriteria = @MatchCriteria + 1
		INSERT INTO #Search (CASEID, TYPE)
		SELECT CASEID, 'VR'
		FROM CASES WITH (NOLOCK)
		WHERE RECOVEREDVALUE >= @ValueBegin AND RECOVEREDVALUE <= @ValueFinish
		AND (@SubscriptionID = 0 OR SUBSCRIPTIONID = @SubscriptionID)
	END
END
---------------------------------------------------------------------------------
IF @Other > 0
BEGIN
	SET @MatchCriteria = @MatchCriteria + 1
	INSERT INTO #Search (CASEID, TYPE)
	SELECT CASEID, 'OTHER'
	FROM CASES WITH (NOLOCK)
	WHERE _CMSCAT1OF = @Other
	AND (@SubscriptionID = 0 OR SUBSCRIPTIONID = @SubscriptionID)
END
---------------------------------------------------------------------------------
IF @Classification > 0
BEGIN
	SET @MatchCriteria = @MatchCriteria + 1
	SELECT TREEID
	INTO #ClassificationLevel3
	FROM CASESTREE WITH (NOLOCK)
	WHERE CATEGORYID = 1501 -- Classification
	AND PARENTID = @Classification
	AND ACTIVE = 1
	SELECT TREEID
	INTO #ClassificationLevel4
	FROM CASESTREE WITH (NOLOCK)
	WHERE CATEGORYID = 1501 -- Classification
	AND PARENTID IN (SELECT TREEID FROM #ClassificationLevel3)
	AND ACTIVE = 1
	----------------------
	INSERT INTO #Search (CASEID, TYPE)
	SELECT DISTINCT C.CASEID, 'CLASS'
	FROM LEDGERVALUES AS L WITH (NOLOCK)
	INNER JOIN DIARY AS D WITH (NOLOCK) ON D.DIARYID = L.DIARYID
	INNER JOIN CASES AS C WITH (NOLOCK) ON C.CASEID = D.CASEID
	WHERE L.AssetTypeId IN (SELECT TREEID FROM #ClassificationLevel3
						    UNION
						    SELECT TREEID FROM #ClassificationLevel4)
	AND (@SubscriptionID = 0 OR SUBSCRIPTIONID = @SubscriptionID) 
END
---------------------------------------------------------------------------------
SELECT CASEID, COUNT(CASEID) AS SearchMatches
INTO #SearchCriteria
FROM #Search
GROUP BY CASEID
---------------------------------------------------------------------------------
IF @MatchCriteria > 0
BEGIN
	SELECT DISTINCT C.CASEID,
	       C.REFERENCE,
	       C.FILENO,
	       C.SUBSCRIPTIONID,
	       S.TMROLE,
	       C.EVENTDATE,
	       C.EVENTDESCRIPTION,
	       C._CMSCAT1OF AS CATEGORYID,
	       C._CMSCAT2OF AS LOCATIONID,
	       C.RECOVEREDVALUE,
	       C.TOTALVALUE
	FROM CASES AS C WITH (NOLOCK)
	INNER JOIN SUBSCRIPTIONS AS S WITH (NOLOCK) ON S.SUBSCRIPTIONID = C.SUBSCRIPTIONID
	WHERE CASEID IN (SELECT CASEID FROM #SearchCriteria WHERE SearchMatches = @MatchCriteria)
END
ELSE
BEGIN
	SELECT 0 AS CASEID,
	       'No match for search criteria' AS REFERENCE,
	       '' AS FILENO,
	       '' AS SUBSCRIPTIONID,
	       '' AS TMROLE,
	       '' AS EVENTDATE,
	       '' AS EVENTDESCRIPTION,
	       '' AS CATEGORYID,
	       '' AS LOCATIONID,
	       '' AS RECOVEREDVALUE,
	       '' AS TOTALVALUE
END
---------------------------------------------------------------------------------
DROP TABLE #Search
DROP TABLE #SearchCriteria

GO
