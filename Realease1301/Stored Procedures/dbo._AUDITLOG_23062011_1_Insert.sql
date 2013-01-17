SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Inserts a new record into the 'AUDITLOG_23062011_1' table.
CREATE PROCEDURE [dbo].[_AUDITLOG_23062011_1_Insert]
	@Id uniqueidentifier,
	@Timestamp datetime,
	@AppDomainName varchar(255),
	@MachineName varchar(255),
	@TypeName varchar(255),
	@MethodName varchar(1024),
	@Category varchar(255),
	@Level varchar(20),
	@Body varchar(8000),
	@ThreadIdentity varchar(255),
	@WindowsIdentity varchar(255),
	@AdditionalInfo varchar(2024)
AS
	INSERT INTO [dbo].[AUDITLOG_23062011_1]
	(
		[id],
		[timestamp],
		[appDomainName],
		[machineName],
		[typeName],
		[methodName],
		[category],
		[level],
		[body],
		[threadIdentity],
		[windowsIdentity],
		[additionalInfo]
	)
	VALUES
	(
		@Id,
		@Timestamp,
		@AppDomainName,
		@MachineName,
		@TypeName,
		@MethodName,
		@Category,
		@Level,
		@Body,
		@ThreadIdentity,
		@WindowsIdentity,
		@AdditionalInfo
	)
	SELECT @@IDENTITY
GO
