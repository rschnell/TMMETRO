SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'SCH_RecurrenceInfo' table.
CREATE PROCEDURE [dbo].[_SCH_RecurrenceInfo_Update]
	-- The rest of writeable parameters
	@Mode int,
	@RangeMode int,
	@StartDate datetime,
	@EndDate datetime,
	@TotalRecurrences int,
	@NDay int,
	@NWeek int,
	@NMonth int,
	@NYear int,
	@WeekDays nvarchar(255),
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[SCH_RecurrenceInfo] SET
		[Mode] = @Mode,
		[RangeMode] = @RangeMode,
		[StartDate] = @StartDate,
		[EndDate] = @EndDate,
		[TotalRecurrences] = @TotalRecurrences,
		[NDay] = @NDay,
		[NWeek] = @NWeek,
		[NMonth] = @NMonth,
		[NYear] = @NYear,
		[WeekDays] = @WeekDays
	WHERE
		[ID] = @ID
GO
