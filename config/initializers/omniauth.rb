OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  ##provider :salesforce, ENV['SALESFORCE_KEY'], ENV['SALESFORCE_SECRET']
  provider OmniAuth::Strategies::SalesforceCommunity, Rails.application.config.salesforce_app_id, Rails.application.config.salesforce_app_secret
end
