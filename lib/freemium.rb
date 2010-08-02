unless defined?(Devise)
  require 'devise'
end

Devise.module_eval do
#	autoload :Schema, 'freemium/schema'

	#class CreditCardStorageError < RuntimeError; end


  # Lets you configure which ActionMailer class contains appropriate
  # mailings for invoices, expiration warnings, and expiration notices.
  # You'll probably want to create your own, based on lib/subscription_mailer.rb.
  mattr_accessor :mailer
  @@mailer = #SubscriptionMailer
    
  mattr_accessor :mailer_sender
  @@mailer_sender = "please-change-me@config-initializers-freemium.com" 

  # The gateway of choice. Default gateway is a stubbed testing gateway.
  mattr_accessor :gateway
    @@gateway = ""#Freemium::Gateways::Test.new

  # You need to specify whether Freemium or your gateway's ARB module will control
  # the billing process. If your gateway's ARB controls the billing process, then
  # Freemium will simply try and keep up-to-date on transactions.
#   def billing_controller=(val)
#     case val
#       when :freemium: Subscription.send(:include, Freemium::ManualBilling)
#       when :arb:      Subscription.send(:include, Freemium::RecurringBilling)
#       else raise "unknown billing_controller: #{val}"
#     end
#   end

  # How many days to keep an account active after it fails to pay.
  mattr_accessor :days_grace
    @@days_grace = 3

  # What plan to assign to subscriptions that have expired. May be nil.
  mattr_accessor :expired_plan
    @@expired_plan = #SubscriptionPlan.find(:first, :conditions => "rate_cents = 0")

  # If you want to receive admin reports, enter an email (or list of emails) here.
  # These will be bcc'd on all SubscriptionMailer emails, and will also receive the
  # admin activity report.
  mattr_accessor :admin_report_recipients
  	@@admin_report_recipuents = ""

end

Devise.add_module :freemium, :controller => :payments, :model => 'freemium/model'

module Freemium; end

#require 'freemium/activity_logger'
#require 'freemium/models'
#require 'freemium/mailer'
#require 'freemium/routes'
#require 'freemium/schema'
#require 'freemium/rails'
