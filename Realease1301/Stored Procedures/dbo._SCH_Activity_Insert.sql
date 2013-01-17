SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'SCH_Activity' table.
CREATE PROCEDURE [dbo].[_SCH_Activity_Insert]
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
	@ResourceID int
AS
	INSERT INTO [dbo].[SCH_Activity]
	(
		[Status],
		[Subject],
		[SUBID],
		[StartTime],
		[EndTime],
		[Description],
		[Location],
		[AllDay],
		[CASEID],
		[ACTIONID],
		[RECURRENCEINFO],
		[REMINDERINFO],
		[EVENTTYPE],
		[label],
		[ResourceID]
	)
	VALUES
	(
		@Status,
		@Subject,
		@SUBID,
		@StartTime,
		@EndTime,
		@Description,
		@Location,
		@AllDay,
		@CASEID,
		@ACTIONID,
		@RECURRENCEINFO,
		@REMINDERINFO,
		@EVENTTYPE,
		@Label,
		@ResourceID
	)
	SELECT @@IDENTITY
GO
