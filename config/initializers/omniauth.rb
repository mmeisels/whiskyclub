OmniAuth.config.logger = Rails.logger
module Strategies
  autoload :SalesforceCommunity, Rails.root.join('lib', 'strategies', 'salesforce_community')
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :SalesforceCommunity, "https://test.salesforce.com"
  ##provider :salesforce, Rails.application.config.salesforce_app_id, Rails.application.config.salesforce_app_secret
end
