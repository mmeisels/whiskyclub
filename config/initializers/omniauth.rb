OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider Rails.application.config.providerurl, Rails.application.config.salesforce_app_id, Rails.application.config.salesforce_app_secret
end
