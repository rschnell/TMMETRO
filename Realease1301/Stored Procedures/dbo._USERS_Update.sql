SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- Updates a record in the 'USERS' table.
CREATE PROCEDURE [dbo].[_USERS_Update]
	-- The rest of writeable parameters
	@UserId int,
	@SUBSCRIPTIONID int,
	@GROUPID int,
	@OFFSET numeric(4,2),
	@_CMSOrganizationBelongsTO int,
	@FirstName varchar(50),
	@LastName varchar(50),
	@UserName nchar(50),
	@DNNNAME nvarchar(50),
	@DNN_USERID nvarchar(50),
	@PassWord nvarchar(50),
	@Email nvarchar(50),
	@Admin bit,
	@Active bit,
	@LastUpdate datetime,
	@External bit,
	@Guest bit,
	@Created datetime,
	@Country nvarchar(50),
	@LastLogin datetime,
	@LASTONLINE datetime,
	@LASTTIMEOUT datetime,
	@LASTLOGOUT datetime,
	@SkypeHandle nvarchar(max),
	@ManagerName nvarchar(max),
	@ManagerEmail nvarchar(max),
	@Telephone nvarchar(max),
	@Fax nvarchar(max),
	@MobilePhone nvarchar(max),
	@Address1 nvarchar(max),
	@Address2 nvarchar(max),
	@City nvarchar(max),
	@ZipCode nvarchar(max),
	@CountryID int,
	@DepartmentID int,
	@Confirmation datetime,
	@SkypeStatus int,
	@WebStatus int,
	@Mood nchar(50),
	@IMProviderID int,
	@IMUserName nvarchar(50),
	@IMPassword nvarchar(50),
	@CodeCountry nchar(2),
	@CodeLocale nchar(5),
	@CodeCompany nvarchar(50),
	@CodeLocation nvarchar(50),
	@CodeTheme nvarchar(50),
	@CodeOrganization nvarchar(50),
	@PARENTID int,
	-- Primary key parameters
	@ID int
AS
	UPDATE [dbo].[USERS] SET
		[UserId] = @UserId,
		[SUBSCRIPTIONID] = @SUBSCRIPTIONID,
		[GROUPID] = @GROUPID,
		[OFFSET] = @OFFSET,
		[_CMSOrganizationBelongsTO] = @_CMSOrganizationBelongsTO,
		[FirstName] = @FirstName,
		[LastName] = @LastName,
		[UserName] = @UserName,
		[DNNNAME] = @DNNNAME,
		[DNN_USERID] = @DNN_USERID,
		[PassWord] = @PassWord,
		[Email] = @Email,
		[Admin] = @Admin,
		[Active] = @Active,
		[LastUpdate] = @LastUpdate,
		[External] = @External,
		[Guest] = @Guest,
		[Created] = @Created,
		[Country] = @Country,
		[LastLogin] = @LastLogin,
		[LASTONLINE] = @LASTONLINE,
		[LASTTIMEOUT] = @LASTTIMEOUT,
		[LASTLOGOUT] = @LASTLOGOUT,
		[SkypeHandle] = @SkypeHandle,
		[ManagerName] = @ManagerName,
		[ManagerEmail] = @ManagerEmail,
		[Telephone] = @Telephone,
		[Fax] = @Fax,
		[MobilePhone] = @MobilePhone,
		[Address1] = @Address1,
		[Address2] = @Address2,
		[City] = @City,
		[ZipCode] = @ZipCode,
		[CountryID] = @CountryID,
		[DepartmentID] = @DepartmentID,
		[Confirmation] = @Confirmation,
		[SkypeStatus] = @SkypeStatus,
		[WebStatus] = @WebStatus,
		[Mood] = @Mood,
		[IMProviderID] = @IMProviderID,
		[IMUserName] = @IMUserName,
		[IMPassword] = @IMPassword,
		[CodeCountry] = @CodeCountry,
		[CodeLocale] = @CodeLocale,
		[CodeCompany] = @CodeCompany,
		[CodeLocation] = @CodeLocation,
		[CodeTheme] = @CodeTheme,
		[CodeOrganization] = @CodeOrganization,
		[PARENTID] = @PARENTID
	WHERE
		[ID] = @ID
GO