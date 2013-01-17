CREATE TABLE [dbo].[REPORTSCHEDULES]
(
[REPORTSCHEDULEID] [int] NOT NULL IDENTITY(1, 1),
[REPORTID] [int] NULL,
[SUBSCRIPTIONID] [int] NULL,
[START] [date] NULL,
[STOP] [date] NULL,
[SCHEDULEEND] [bit] NULL,
[INTERVAL] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[INTERVALHOURREPEAT] [bit] NULL,
[INTERVALDAYDAYS] [bit] NULL,
[INTERVALDAYREPEAT] [bit] NULL,
[INTERVALMONTHWEEK] [bit] NULL,
[INTERVALMONTHDAY] [bit] NULL,
[REPEATWEEKS] [int] NULL,
[REPEATDAYS] [int] NULL,
[REPEATHOURS] [int] NULL,
[REPEATMINUTES] [int] NULL,
[STARTHOURS] [int] NULL,
[STARTMINUTES] [int] NULL,
[RENDER] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SUN] [bit] NULL,
[MON] [bit] NULL,
[TUE] [bit] NULL,
[WED] [bit] NULL,
[THU] [bit] NULL,
[FRI] [bit] NULL,
[SAT] [bit] NULL,
[JAN] [bit] NULL,
[FEB] [bit] NULL,
[MAR] [bit] NULL,
[APR] [bit] NULL,
[MAY] [bit] NULL,
[JUN] [bit] NULL,
[JUL] [bit] NULL,
[AUG] [bit] NULL,
[SEP] [bit] NULL,
[OCT] [bit] NULL,
[NOV] [bit] NULL,
[DEC] [bit] NULL,
[WEEK] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DAYS] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UPDATED] [datetime] NULL,
[LASTRUN] [datetime] NULL,
[NEXTRUN] [datetime] NULL
) ON [PRIMARY]
GO