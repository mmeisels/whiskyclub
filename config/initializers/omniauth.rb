OmniAuth.config.logger = Rails.logger
module OmniAuth
  module Strategies
    # tell OmniAuth to load our strategy
    autoload :HoneyBadger, Rails.root.join('lib','strategies', 'HoneyBadger')
  end
end
Rails.application.config.middleware.use OmniAuth::Builder do
  ##provider :salesforce, ENV['SALESFORCE_KEY'], ENV['SALESFORCE_SECRET']
  provider :HoneyBadger, Rails.application.config.salesforce_app_id, Rails.application.config.salesforce_app_secret, 'https://whisky-pr-5.herokuapp.com/oauth/salesforce'
end
