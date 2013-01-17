CREATE TABLE [dbo].[USERS]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[UserId] [int] NOT NULL,
[SUBSCRIPTIONID] [int] NULL,
[GROUPID] [int] NULL,
[OFFSET] [numeric] (4, 2) NULL CONSTRAINT [DF_USERS_OFFSET] DEFAULT ((0.0)),
[_CMSOrganizationBelongsTO] [int] NULL CONSTRAINT [DF_USERS__CMSOrganizationBelongsTO] DEFAULT ((0)),
[FirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UserName] [nchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DNNNAME] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DNN_USERID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PassWord] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Admin] [bit] NOT NULL CONSTRAINT [DF_USERS_Admin] DEFAULT ((0)),
[Active] [bit] NOT NULL CONSTRAINT [DF_USERS_Active] DEFAULT ((1)),
[LastUpdate] [datetime] NULL,
[External] [bit] NOT NULL CONSTRAINT [DF_USERS_External] DEFAULT ((0)),
[Guest] [bit] NOT NULL CONSTRAINT [DF_USERS_Guest] DEFAULT ((0)),
[Created] [datetime] NULL,
[Country] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastLogin] [datetime] NULL,
[LASTONLINE] [datetime] NULL,
[LASTTIMEOUT] [datetime] NULL,
[LASTLOGOUT] [datetime] NULL,
[SkypeHandle] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ManagerName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ManagerEmail] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Telephone] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Fax] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MobilePhone] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address2] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZipCode] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CountryID] [int] NULL,
[DepartmentID] [int] NULL,
[Confirmation] [datetime] NULL,
[SkypeStatus] [int] NULL,
[WebStatus] [int] NULL,
[Mood] [nchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IMProviderID] [int] NOT NULL CONSTRAINT [DF_USERS_IMProviderID] DEFAULT ((1)),
[IMUserName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IMPassword] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CodeCountry] [nchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CodeLocale] [nchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CodeCompany] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CodeLocation] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CodeTheme] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CodeOrganization] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PARENTID] [int] NULL CONSTRAINT [DF_USERS_PARENTID] DEFAULT ((0))
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[USERS] ADD CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [_dta_index_USERS_7_904350982__K49_K2_K4_K50_K1_K3_K36_K9] ON [dbo].[USERS] ([CodeOrganization], [UserId], [GROUPID], [PARENTID], [ID], [SUBSCRIPTIONID], [DepartmentID], [UserName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [_dta_index_USERS_7_904350982__K36_K49_K2_K4_K50_K1_K3_K9] ON [dbo].[USERS] ([DepartmentID], [CodeOrganization], [UserId], [GROUPID], [PARENTID], [ID], [SUBSCRIPTIONID], [UserName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [_dta_index_Users_8_1657772963__K2] ON [dbo].[USERS] ([UserId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [_dta_index_Users_8_1657772963__K2_7] ON [dbo].[USERS] ([UserId]) INCLUDE ([UserName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [_dta_index_USERS_7_904350982__K2_K9_K4_K36_K50_K1_K3] ON [dbo].[USERS] ([UserId], [UserName], [GROUPID], [DepartmentID], [PARENTID], [ID], [SUBSCRIPTIONID]) ON [PRIMARY]
GO
CREATE STATISTICS [_dta_stat_904350982_36_4_50_2_1_3] ON [dbo].[USERS] ([DepartmentID], [GROUPID], [PARENTID], [UserId], [ID], [SUBSCRIPTIONID])
GO
CREATE STATISTICS [_dta_stat_904350982_36_50_49_2_4_1_3_9] ON [dbo].[USERS] ([DepartmentID], [PARENTID], [CodeOrganization], [UserId], [GROUPID], [ID], [SUBSCRIPTIONID], [UserName])
GO
CREATE STATISTICS [_dta_stat_904350982_4_36_49] ON [dbo].[USERS] ([GROUPID], [DepartmentID], [CodeOrganization])
GO
CREATE STATISTICS [_dta_stat_904350982_4_50] ON [dbo].[USERS] ([GROUPID], [PARENTID])
GO
CREATE STATISTICS [_dta_stat_904350982_2_1_49_4_36] ON [dbo].[USERS] ([ID], [CodeOrganization], [GROUPID], [DepartmentID], [UserId])
GO
CREATE STATISTICS [_dta_stat_904350982_1_36_9_2] ON [dbo].[USERS] ([ID], [DepartmentID], [UserName], [UserId])
GO
CREATE STATISTICS [_dta_stat_904350982_1_3_49_2_4_36] ON [dbo].[USERS] ([ID], [SUBSCRIPTIONID], [CodeOrganization], [UserId], [GROUPID], [DepartmentID])
GO
CREATE STATISTICS [_dta_stat_904350982_9_1] ON [dbo].[USERS] ([UserName], [ID])
GO
