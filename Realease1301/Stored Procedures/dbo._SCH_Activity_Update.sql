SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'SCH_Activity' table.
CREATE PROCEDURE [dbo].[_SCH_Activity_Update]
	-- The rest of writeable parameters
	@Status int,
	@Subject nvarchar(255),
	@SUBID int,
	@StartTime smalldatetime,
	@EndTime smalldatetime,
	@Description ntext,
	@Location nvarchar(64),
	@AllDay bit,
	@CASEID int,
	@ACTIONID int,
	@RECURRENCEINFO ntext,
	@REMINDERINFO ntext,
	@EVENTTYPE int,
	@Label int,
	@ResourceID int,
	-- Primary key parameters
	@ActivityID int
AS
	UPDATE [dbo].[SCH_Activity] SET
		[Status] = @Status,
		[Subject] = @Subject,
		[SUBID] = @SUBID,
		[StartTime] = @StartTime,
		[EndTime] = @EndTime,
		[Description] = @Description,
		[Location] = @Location,
		[AllDay] = @AllDay,
		[CASEID] = @CASEID,
		[ACTIONID] = @ACTIONID,
		[RECURRENCEINFO] = @RECURRENCEINFO,
		[REMINDERINFO] = @REMINDERINFO,
		[EVENTTYPE] = @EVENTTYPE,
		[label] = @Label,
		[ResourceID] = @ResourceID
	WHERE
		[ActivityID] = @ActivityID
GO
