CREATE TABLE [dbo].[AUDITLOG_2908]
(
[id] [uniqueidentifier] NOT NULL,
[timestamp] [datetime] NOT NULL,
[appDomainName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[machineName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[typeName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[methodName] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[category] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[level] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[body] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[threadIdentity] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[windowsIdentity] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[additionalInfo] [varchar] (2024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LOGID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
