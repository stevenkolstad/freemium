# Use this hook to configure freemium mailer, can also be set straight in your models.
Freemium.setup do |config|
  # Configure the e-mail address which will be shown in FreemiumMailer.
  config.mailer_sender = "please-change-me@config-initializers-freemium.com"

  # ==> General configuration
  # Load and configure the ORM. Supports :active_record (default), :mongoid
  # (requires mongo_ext installed) and :data_mapper (experimental).
  require 'freemium/orm/active_record'

end