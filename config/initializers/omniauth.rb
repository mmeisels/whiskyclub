OmniAuth.config.logger = Rails.logger
module OmniAuth
  module Strategies
    # tell OmniAuth to load our strategy
    autoload :HoneyBadger, Rails.root.join('lib','strategies', 'HoneyBadger')
  end
end
Rails.application.config.middleware.use OmniAuth::Builder do
  ##provider :salesforce, ENV['SALESFORCE_KEY'], ENV['SALESFORCE_SECRET']
  provider :HoneyBadger
end
