SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.cmsUpdScheduleReport 
(
    @ReportID INTEGER=0,
    @Description VARCHAR(MAX),
    @Name VARCHAR(MAX),
    @Parameters VARCHAR(MAX),
    @Active INTEGER,
    @SubscriptionID INTEGER
)
AS
SET NOCOUNT ON

    IF @ReportID > 0
    AND EXISTS(SELECT [ID] FROM [REPORTS] WHERE [ID] = @ReportID AND [SUBSCRIPTIONID] = @SubscriptionID AND [DESCRIPTION] = @Description)
    BEGIN
       UPDATE [REPORTS]
          SET [DESCRIPTION] = @Description,
              [NAME] = @Name,
              [PARAMETERS] = @Parameters,
              [ACTIVE] = @Active,
              [SUBSCRIPTIONID] = @SubscriptionID
        WHERE [ID] = @ReportID
          AND [SUBSCRIPTIONID] = @SubscriptionID
          AND [DESCRIPTION] = @Description
    END
    ELSE
    BEGIN
       SET @ReportID = ((SELECT MAX([ID]) FROM [REPORTS]) + 1)
       INSERT INTO [REPORTS] ([ID], [DESCRIPTION], [NAME], [PARAMETERS], [SUBSCRIPTIONID], [REPORTTYPE], [ACTIVE])
                      VALUES (@ReportID, @Description, @Name, @Parameters, @SubscriptionID, 0, 1) -- default new report to active
    END

GO
