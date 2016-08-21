OmniAuth.config.logger = Rails.logger
module OmniAuth
  module Strategies
    # tell OmniAuth to load our strategy
    autoload :SalesforceCommunity1, Rails.root.join('lib','omniauth', 'strategies', 'salesforcecommunity')
  end
end
Rails.application.config.middleware.use OmniAuth::Builder do
  ##provider :salesforce, ENV['SALESFORCE_KEY'], ENV['SALESFORCE_SECRET']
  provider :SalesforceCommunity1, Rails.application.config.salesforce_app_id, Rails.application.config.salesforce_app_secret
end
