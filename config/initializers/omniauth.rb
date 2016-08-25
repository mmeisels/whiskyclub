OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :salesforce, ENV['SALESFORCE_KEY'], ENV['SALESFORCE_SECRET']
  provider :facebook, '647222288776932', '275da38318fec5beed1ef2f58a2afc7d', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
