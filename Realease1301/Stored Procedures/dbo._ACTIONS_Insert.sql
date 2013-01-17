SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Inserts a new record into the 'ACTIONS' table.
CREATE PROCEDURE [dbo].[_ACTIONS_Insert]
	@CASEID int,
	@TITLE varchar(70),
	@_CMSSTATUSOf int,
	@_CMSPRIORITYOf int,
	@_CMSDATERaised datetime,
	@_CMSDATEEnd datetime,
	@_CMSDATEEndAgreed datetime,
	@_CMSDATEClosed datetime,
	@CMSDATELastReminder datetime,
	@CMSDATENextReminder datetime,
	@_CMSDATEUpdated datetime,
	@_CMSUsersUpdated int,
	@_CMSUSERSAssignedBy int,
	@_CMSUSERSManagedBy int,
	@_CMSUsersAssignedTo int,
	@ActionTypeID int,
	@NoReminder bit,
	@ACTIVE bit,
	@ISISSUE bit,
	@_CMSRESOLUTIONSOf int,
	@_CMSRiskOf int,
	@_CMSDATEOpened datetime,
	@ISSTICKY bit,
	@_CMSDateOccured datetime,
	@_CMSIMPACTOf int,
	@_CMSCAT1OF int,
	@_CMSCAT2Of int,
	@_CMSCAT3Of int,
	@_CMSCAT4Of int
AS
	INSERT INTO [dbo].[ACTIONS]
	(
		[CASEID],
		[TITLE],
		[_CMSSTATUSOf],
		[_CMSPRIORITYOf],
		[_CMSDATERaised],
		[_CMSDATEEnd],
		[_CMSDATEEndAgreed],
		[_CMSDATEClosed],
		[CMSDATELastReminder],
		[CMSDATENextReminder],
		[_CMSDATEUpdated],
		[_CMSUsersUpdated],
		[_CMSUSERSAssignedBy],
		[_CMSUSERSManagedBy],
		[_CMSUsersAssignedTo],
		[ActionTypeID],
		[NoReminder],
		[ACTIVE],
		[ISISSUE],
		[_CMSRESOLUTIONSOf],
		[_CMSRiskOf],
		[_CMSDATEOpened],
		[ISSTICKY],
		[_CMSDateOccured],
		[_CMSIMPACTOf],
		[_CMSCAT1OF],
		[_CMSCAT2Of],
		[_CMSCAT3Of],
		[_CMSCAT4Of]
	)
	VALUES
	(
		@CASEID,
		@TITLE,
		@_CMSSTATUSOf,
		@_CMSPRIORITYOf,
		@_CMSDATERaised,
		@_CMSDATEEnd,
		@_CMSDATEEndAgreed,
		@_CMSDATEClosed,
		@CMSDATELastReminder,
		@CMSDATENextReminder,
		@_CMSDATEUpdated,
		@_CMSUsersUpdated,
		@_CMSUSERSAssignedBy,
		@_CMSUSERSManagedBy,
		@_CMSUsersAssignedTo,
		@ActionTypeID,
		@NoReminder,
		@ACTIVE,
		@ISISSUE,
		@_CMSRESOLUTIONSOf,
		@_CMSRiskOf,
		@_CMSDATEOpened,
		@ISSTICKY,
		@_CMSDateOccured,
		@_CMSIMPACTOf,
		@_CMSCAT1OF,
		@_CMSCAT2Of,
		@_CMSCAT3Of,
		@_CMSCAT4Of
	)
	SELECT @@IDENTITY
GO
