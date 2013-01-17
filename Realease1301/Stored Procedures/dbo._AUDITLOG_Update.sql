SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'AUDITLOG' table.
CREATE PROCEDURE [dbo].[_AUDITLOG_Update]
	-- The rest of writeable parameters
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
	@AdditionalInfo varchar(2024),
	-- Primary key parameters
	@Id uniqueidentifier
AS
	UPDATE [dbo].[AUDITLOG] SET
		[timestamp] = @Timestamp,
		[appDomainName] = @AppDomainName,
		[machineName] = @MachineName,
		[typeName] = @TypeName,
		[methodName] = @MethodName,
		[category] = @Category,
		[level] = @Level,
		[body] = @Body,
		[threadIdentity] = @ThreadIdentity,
		[windowsIdentity] = @WindowsIdentity,
		[additionalInfo] = @AdditionalInfo
	WHERE
		[id] = @Id
GO
