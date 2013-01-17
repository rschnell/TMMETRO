SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Updates a record in the 'Site' table.
CREATE PROCEDURE [dbo].[_SITE_Update]
	-- The rest of writeable parameters
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
	@SiteCheckoutProcess ntext,
	-- Primary key parameters
	@SiteID int
AS
	UPDATE [dbo].[Site] SET
		[SiteName] = @SiteName,
		[SiteDisplayName] = @SiteDisplayName,
		[SiteDescription] = @SiteDescription,
		[SiteStatus] = @SiteStatus,
		[SiteDomainName] = @SiteDomainName,
		[SiteDefaultStylesheetID] = @SiteDefaultStylesheetID,
		[SiteDefaultVisitorCulture] = @SiteDefaultVisitorCulture,
		[SiteDefaultEditorStylesheet] = @SiteDefaultEditorStylesheet,
		[SiteStoreAllowAnonymousCustomers] = @SiteStoreAllowAnonymousCustomers,
		[SiteStoreShippingFreeLimit] = @SiteStoreShippingFreeLimit,
		[SiteInvoiceTemplate] = @SiteInvoiceTemplate,
		[SiteDefaultCountryID] = @SiteDefaultCountryID,
		[SiteShowTaxRegistrationID] = @SiteShowTaxRegistrationID,
		[SiteShowOrganizationID] = @SiteShowOrganizationID,
		[SiteSendStoreEmailsFrom] = @SiteSendStoreEmailsFrom,
		[SiteSendOrderNotificationTo] = @SiteSendOrderNotificationTo,
		[SiteUseExtraCompanyAddress] = @SiteUseExtraCompanyAddress,
		[SiteSendOrderNotification] = @SiteSendOrderNotification,
		[SiteSendPaymentNotification] = @SiteSendPaymentNotification,
		[SiteCheckoutProcess] = @SiteCheckoutProcess
	WHERE
		[SiteID] = @SiteID
GO
