CREATE TABLE [dbo].[SCH_RecurrenceInfo]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Mode] [int] NULL,
[RangeMode] [int] NULL,
[StartDate] [datetime] NULL,
[EndDate] [datetime] NULL,
[TotalRecurrences] [int] NULL,
[NDay] [int] NULL,
[NWeek] [int] NULL,
[NMonth] [int] NULL,
[NYear] [int] NULL,
[WeekDays] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SCH_RecurrenceInfo] ADD CONSTRAINT [aaaaaSch_RecurrenceInfo_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'Attributes', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', NULL, NULL
GO
EXEC sp_addextendedproperty N'DateCreated', N'5/02/2008 9:02:52 AM', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', NULL, NULL
GO
EXEC sp_addextendedproperty N'DisplayViewsOnSharePointSite', N'1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', NULL, NULL
GO
EXEC sp_addextendedproperty N'FilterOnLoad', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', NULL, NULL
GO
EXEC sp_addextendedproperty N'HideNewField', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', NULL, NULL
GO
EXEC sp_addextendedproperty N'LastUpdated', N'7/07/2008 3:19:15 AM', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DefaultView', N'2', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_OrderByOn', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Orientation', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', NULL, NULL
GO
EXEC sp_addextendedproperty N'Name', N'Sch_RecurrenceInfo', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', NULL, NULL
GO
EXEC sp_addextendedproperty N'OrderByOnLoad', N'True', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', NULL, NULL
GO
EXEC sp_addextendedproperty N'RecordCount', N'5', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', NULL, NULL
GO
EXEC sp_addextendedproperty N'TotalsRow', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', NULL, NULL
GO
EXEC sp_addextendedproperty N'Updatable', N'True', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', NULL, NULL
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'EndDate'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'EndDate'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'EndDate'
GO
EXEC sp_addextendedproperty N'Attributes', N'1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'EndDate'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'EndDate'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'EndDate'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'EndDate'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'EndDate'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'EndDate'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'EndDate'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'EndDate'
GO
EXEC sp_addextendedproperty N'Name', N'EndDate', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'EndDate'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'4', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'EndDate'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'EndDate'
GO
EXEC sp_addextendedproperty N'ShowDatePicker', N'1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'EndDate'
GO
EXEC sp_addextendedproperty N'Size', N'8', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'EndDate'
GO
EXEC sp_addextendedproperty N'SourceField', N'EndDate', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'EndDate'
GO
EXEC sp_addextendedproperty N'SourceTable', N'Sch_RecurrenceInfo', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'EndDate'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'EndDate'
GO
EXEC sp_addextendedproperty N'Type', N'8', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'EndDate'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'Attributes', N'17', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'Name', N'ID', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'Size', N'4', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'SourceField', N'ID', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'SourceTable', N'Sch_RecurrenceInfo', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'Type', N'4', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'Mode'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'Mode'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'Mode'
GO
EXEC sp_addextendedproperty N'Attributes', N'1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'Mode'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'Mode'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'Mode'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'Mode'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'Mode'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'Mode'
GO
EXEC sp_addextendedproperty N'MS_DecimalPlaces', N'255', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'Mode'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'Mode'
GO
EXEC sp_addextendedproperty N'Name', N'Mode', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'Mode'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'Mode'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'Mode'
GO
EXEC sp_addextendedproperty N'Size', N'4', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'Mode'
GO
EXEC sp_addextendedproperty N'SourceField', N'Mode', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'Mode'
GO
EXEC sp_addextendedproperty N'SourceTable', N'Sch_RecurrenceInfo', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'Mode'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'Mode'
GO
EXEC sp_addextendedproperty N'Type', N'4', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'Mode'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NDay'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NDay'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NDay'
GO
EXEC sp_addextendedproperty N'Attributes', N'1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NDay'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NDay'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NDay'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NDay'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NDay'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NDay'
GO
EXEC sp_addextendedproperty N'MS_DecimalPlaces', N'255', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NDay'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NDay'
GO
EXEC sp_addextendedproperty N'Name', N'NDay', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NDay'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'6', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NDay'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NDay'
GO
EXEC sp_addextendedproperty N'Size', N'4', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NDay'
GO
EXEC sp_addextendedproperty N'SourceField', N'NDay', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NDay'
GO
EXEC sp_addextendedproperty N'SourceTable', N'Sch_RecurrenceInfo', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NDay'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NDay'
GO
EXEC sp_addextendedproperty N'Type', N'4', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NDay'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NMonth'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NMonth'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NMonth'
GO
EXEC sp_addextendedproperty N'Attributes', N'1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NMonth'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NMonth'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NMonth'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NMonth'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NMonth'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NMonth'
GO
EXEC sp_addextendedproperty N'MS_DecimalPlaces', N'255', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NMonth'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NMonth'
GO
EXEC sp_addextendedproperty N'Name', N'NMonth', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NMonth'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'8', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NMonth'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NMonth'
GO
EXEC sp_addextendedproperty N'Size', N'4', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NMonth'
GO
EXEC sp_addextendedproperty N'SourceField', N'NMonth', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NMonth'
GO
EXEC sp_addextendedproperty N'SourceTable', N'Sch_RecurrenceInfo', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NMonth'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NMonth'
GO
EXEC sp_addextendedproperty N'Type', N'4', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NMonth'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NWeek'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NWeek'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NWeek'
GO
EXEC sp_addextendedproperty N'Attributes', N'1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NWeek'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NWeek'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NWeek'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NWeek'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NWeek'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NWeek'
GO
EXEC sp_addextendedproperty N'MS_DecimalPlaces', N'255', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NWeek'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NWeek'
GO
EXEC sp_addextendedproperty N'Name', N'NWeek', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NWeek'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'7', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NWeek'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NWeek'
GO
EXEC sp_addextendedproperty N'Size', N'4', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NWeek'
GO
EXEC sp_addextendedproperty N'SourceField', N'NWeek', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NWeek'
GO
EXEC sp_addextendedproperty N'SourceTable', N'Sch_RecurrenceInfo', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NWeek'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NWeek'
GO
EXEC sp_addextendedproperty N'Type', N'4', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NWeek'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NYear'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NYear'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NYear'
GO
EXEC sp_addextendedproperty N'Attributes', N'1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NYear'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NYear'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NYear'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NYear'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NYear'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NYear'
GO
EXEC sp_addextendedproperty N'MS_DecimalPlaces', N'255', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NYear'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NYear'
GO
EXEC sp_addextendedproperty N'Name', N'NYear', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NYear'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'9', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NYear'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NYear'
GO
EXEC sp_addextendedproperty N'Size', N'4', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NYear'
GO
EXEC sp_addextendedproperty N'SourceField', N'NYear', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NYear'
GO
EXEC sp_addextendedproperty N'SourceTable', N'Sch_RecurrenceInfo', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NYear'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NYear'
GO
EXEC sp_addextendedproperty N'Type', N'4', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'NYear'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'RangeMode'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'RangeMode'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'RangeMode'
GO
EXEC sp_addextendedproperty N'Attributes', N'1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'RangeMode'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'RangeMode'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'RangeMode'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'RangeMode'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'RangeMode'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'RangeMode'
GO
EXEC sp_addextendedproperty N'MS_DecimalPlaces', N'255', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'RangeMode'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'RangeMode'
GO
EXEC sp_addextendedproperty N'Name', N'RangeMode', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'RangeMode'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'2', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'RangeMode'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'RangeMode'
GO
EXEC sp_addextendedproperty N'Size', N'4', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'RangeMode'
GO
EXEC sp_addextendedproperty N'SourceField', N'RangeMode', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'RangeMode'
GO
EXEC sp_addextendedproperty N'SourceTable', N'Sch_RecurrenceInfo', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'RangeMode'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'RangeMode'
GO
EXEC sp_addextendedproperty N'Type', N'4', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'RangeMode'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'StartDate'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'StartDate'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'StartDate'
GO
EXEC sp_addextendedproperty N'Attributes', N'1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'StartDate'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'StartDate'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'StartDate'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'StartDate'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'StartDate'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'StartDate'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'StartDate'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'StartDate'
GO
EXEC sp_addextendedproperty N'Name', N'StartDate', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'StartDate'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'3', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'StartDate'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'StartDate'
GO
EXEC sp_addextendedproperty N'ShowDatePicker', N'1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'StartDate'
GO
EXEC sp_addextendedproperty N'Size', N'8', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'StartDate'
GO
EXEC sp_addextendedproperty N'SourceField', N'StartDate', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'StartDate'
GO
EXEC sp_addextendedproperty N'SourceTable', N'Sch_RecurrenceInfo', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'StartDate'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'StartDate'
GO
EXEC sp_addextendedproperty N'Type', N'8', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'StartDate'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'TotalRecurrences'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'TotalRecurrences'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'TotalRecurrences'
GO
EXEC sp_addextendedproperty N'Attributes', N'1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'TotalRecurrences'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'TotalRecurrences'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'TotalRecurrences'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'TotalRecurrences'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'TotalRecurrences'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'TotalRecurrences'
GO
EXEC sp_addextendedproperty N'MS_DecimalPlaces', N'255', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'TotalRecurrences'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'TotalRecurrences'
GO
EXEC sp_addextendedproperty N'Name', N'TotalRecurrences', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'TotalRecurrences'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'5', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'TotalRecurrences'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'TotalRecurrences'
GO
EXEC sp_addextendedproperty N'Size', N'4', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'TotalRecurrences'
GO
EXEC sp_addextendedproperty N'SourceField', N'TotalRecurrences', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'TotalRecurrences'
GO
EXEC sp_addextendedproperty N'SourceTable', N'Sch_RecurrenceInfo', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'TotalRecurrences'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'TotalRecurrences'
GO
EXEC sp_addextendedproperty N'Type', N'4', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'TotalRecurrences'
GO
EXEC sp_addextendedproperty N'AggregateType', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'WeekDays'
GO
EXEC sp_addextendedproperty N'AllowZeroLength', N'True', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'WeekDays'
GO
EXEC sp_addextendedproperty N'AppendOnly', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'WeekDays'
GO
EXEC sp_addextendedproperty N'Attributes', N'2', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'WeekDays'
GO
EXEC sp_addextendedproperty N'CollatingOrder', N'1033', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'WeekDays'
GO
EXEC sp_addextendedproperty N'ColumnHidden', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'WeekDays'
GO
EXEC sp_addextendedproperty N'ColumnOrder', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'WeekDays'
GO
EXEC sp_addextendedproperty N'ColumnWidth', N'-1', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'WeekDays'
GO
EXEC sp_addextendedproperty N'DataUpdatable', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'WeekDays'
GO
EXEC sp_addextendedproperty N'MS_DisplayControl', N'109', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'WeekDays'
GO
EXEC sp_addextendedproperty N'MS_IMEMode', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'WeekDays'
GO
EXEC sp_addextendedproperty N'MS_IMESentMode', N'3', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'WeekDays'
GO
EXEC sp_addextendedproperty N'Name', N'WeekDays', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'WeekDays'
GO
EXEC sp_addextendedproperty N'OrdinalPosition', N'10', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'WeekDays'
GO
EXEC sp_addextendedproperty N'Required', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'WeekDays'
GO
EXEC sp_addextendedproperty N'Size', N'255', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'WeekDays'
GO
EXEC sp_addextendedproperty N'SourceField', N'WeekDays', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'WeekDays'
GO
EXEC sp_addextendedproperty N'SourceTable', N'Sch_RecurrenceInfo', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'WeekDays'
GO
EXEC sp_addextendedproperty N'TextAlign', N'0', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'WeekDays'
GO
EXEC sp_addextendedproperty N'Type', N'10', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'WeekDays'
GO
EXEC sp_addextendedproperty N'UnicodeCompression', N'False', 'SCHEMA', N'dbo', 'TABLE', N'SCH_RecurrenceInfo', 'COLUMN', N'WeekDays'
GO
