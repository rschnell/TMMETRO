SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'ACTIONS' table.
CREATE PROCEDURE [dbo].[_ACTIONS_Update]
	-- The rest of writeable parameters
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
	@_CMSCAT4Of int,
	-- Primary key parameters
	@ACTIONID int
AS
	UPDATE [dbo].[ACTIONS] SET
		[CASEID] = @CASEID,
		[TITLE] = @TITLE,
		[_CMSSTATUSOf] = @_CMSSTATUSOf,
		[_CMSPRIORITYOf] = @_CMSPRIORITYOf,
		[_CMSDATERaised] = @_CMSDATERaised,
		[_CMSDATEEnd] = @_CMSDATEEnd,
		[_CMSDATEEndAgreed] = @_CMSDATEEndAgreed,
		[_CMSDATEClosed] = @_CMSDATEClosed,
		[CMSDATELastReminder] = @CMSDATELastReminder,
		[CMSDATENextReminder] = @CMSDATENextReminder,
		[_CMSDATEUpdated] = @_CMSDATEUpdated,
		[_CMSUsersUpdated] = @_CMSUsersUpdated,
		[_CMSUSERSAssignedBy] = @_CMSUSERSAssignedBy,
		[_CMSUSERSManagedBy] = @_CMSUSERSManagedBy,
		[_CMSUsersAssignedTo] = @_CMSUsersAssignedTo,
		[ActionTypeID] = @ActionTypeID,
		[NoReminder] = @NoReminder,
		[ACTIVE] = @ACTIVE,
		[ISISSUE] = @ISISSUE,
		[_CMSRESOLUTIONSOf] = @_CMSRESOLUTIONSOf,
		[_CMSRiskOf] = @_CMSRiskOf,
		[_CMSDATEOpened] = @_CMSDATEOpened,
		[ISSTICKY] = @ISSTICKY,
		[_CMSDateOccured] = @_CMSDateOccured,
		[_CMSIMPACTOf] = @_CMSIMPACTOf,
		[_CMSCAT1OF] = @_CMSCAT1OF,
		[_CMSCAT2Of] = @_CMSCAT2Of,
		[_CMSCAT3Of] = @_CMSCAT3Of,
		[_CMSCAT4Of] = @_CMSCAT4Of
	WHERE
		[ACTIONID] = @ACTIONID
GO
