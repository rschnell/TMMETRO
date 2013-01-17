SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE dbo.cmsUpdScheduleConfig 
(
	@Name VARCHAR(50),
	@Value VARCHAR(1000)
)
AS
SET NOCOUNT ON

    IF EXISTS(SELECT * FROM [REPORTSCHEDULECONFIG] WHERE [NAME] = @Name)
    BEGIN
       UPDATE [REPORTSCHEDULECONFIG]
          SET [VALUE] = @Value
        WHERE [NAME] = @Name
    END
    ELSE
    BEGIN
       INSERT INTO [REPORTSCHEDULECONFIG] ([NAME], [VALUE])
                                   VALUES (@Name, @Value)
    END

GO
