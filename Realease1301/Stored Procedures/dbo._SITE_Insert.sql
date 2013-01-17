SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Inserts a new record into the 'Site' table.
CREATE PROCEDURE [dbo].[_SITE_Insert]
	@SiteName nvarchar(100),
	@SiteDisplayName nvarchar(200),
	@SiteDescription ntext,
	@SiteStatus nvarchar(20),
	@SiteDomainName nvarchar(400),
	@SiteDefaultStylesheetID int,
	@SiteDefaultVisitorCulture nvarchar(50),
	@SiteDefaultEditorStylesheet int,
	@SiteStoreAllowAnonymousCustomers bit,
	@SiteStoreShippingFreeLimit float,
	@SiteInvoiceTemplate ntext,
	@SiteDefaultCountryID int,
	@SiteShowTaxRegistrationID bit,
	@SiteShowOrganizationID bit,
	@SiteSendStoreEmailsFrom nvarchar(100),
	@SiteSendOrderNotificationTo nvarchar(100),
	@SiteUseExtraCompanyAddress bit,
	@SiteSendOrderNotification bit,
	@SiteSendPaymentNotification bit,
	@SiteCheckoutProcess ntext
AS
	INSERT INTO [dbo].[Site]
	(
		[SiteName],
		[SiteDisplayName],
		[SiteDescription],
		[SiteStatus],
		[SiteDomainName],
		[SiteDefaultStylesheetID],
		[SiteDefaultVisitorCulture],
		[SiteDefaultEditorStylesheet],
		[SiteStoreAllowAnonymousCustomers],
		[SiteStoreShippingFreeLimit],
		[SiteInvoiceTemplate],
		[SiteDefaultCountryID],
		[SiteShowTaxRegistrationID],
		[SiteShowOrganizationID],
		[SiteSendStoreEmailsFrom],
		[SiteSendOrderNotificationTo],
		[SiteUseExtraCompanyAddress],
		[SiteSendOrderNotification],
		[SiteSendPaymentNotification],
		[SiteCheckoutProcess]
	)
	VALUES
	(
		@SiteName,
		@SiteDisplayName,
		@SiteDescription,
		@SiteStatus,
		@SiteDomainName,
		@SiteDefaultStylesheetID,
		@SiteDefaultVisitorCulture,
		@SiteDefaultEditorStylesheet,
		@SiteStoreAllowAnonymousCustomers,
		@SiteStoreShippingFreeLimit,
		@SiteInvoiceTemplate,
		@SiteDefaultCountryID,
		@SiteShowTaxRegistrationID,
		@SiteShowOrganizationID,
		@SiteSendStoreEmailsFrom,
		@SiteSendOrderNotificationTo,
		@SiteUseExtraCompanyAddress,
		@SiteSendOrderNotification,
		@SiteSendPaymentNotification,
		@SiteCheckoutProcess
	)
	SELECT @@IDENTITY
GO
