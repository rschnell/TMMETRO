SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'SCH_RecurrenceInfo' table.
CREATE PROCEDURE [dbo].[_SCH_RecurrenceInfo_Insert]
	@Mode int,
	@RangeMode int,
	@StartDate datetime,
	@EndDate datetime,
	@TotalRecurrences int,
	@NDay int,
	@NWeek int,
	@NMonth int,
	@NYear int,
	@WeekDays nvarchar(255)
AS
	INSERT INTO [dbo].[SCH_RecurrenceInfo]
	(
		[Mode],
		[RangeMode],
		[StartDate],
		[EndDate],
		[TotalRecurrences],
		[NDay],
		[NWeek],
		[NMonth],
		[NYear],
		[WeekDays]
	)
	VALUES
	(
		@Mode,
		@RangeMode,
		@StartDate,
		@EndDate,
		@TotalRecurrences,
		@NDay,
		@NWeek,
		@NMonth,
		@NYear,
		@WeekDays
	)
	SELECT @@IDENTITY
GO
