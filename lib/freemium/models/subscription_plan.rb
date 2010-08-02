module Devise
  module Models

    # Invitable is responsible to send emails with invitations.
    # When an invitation is sent to an email, an account is created for it.
    # An invitation has a link to set the password, as reset password from recoverable.
    #
    # Configuration:
    #
    #   invite_for: the time you want the user will have to confirm the account after
    #               is invited. When invite_for is zero, the invitation won't expire.
    #               By default invite_for is 0.
    #
    # Examples:
    #
    #   User.find(1).invited?             # true/false
    #   User.send_invitation(:email => 'someone@example.com') # send invitation
    #   User.accept_invitation!(:invitation_token => '...')   # accept invitation with a token
    #   User.find(1).accept_invitation!   # accept invitation
    #   User.find(1).resend_invitation!   # reset invitation status and send invitation again
    module SubscriptionPlan

      def self.included(base)
        base.class_eval do
          extend ClassMethods
        end
      end

# == Attributes
#   subscriptions:      all subscriptions for the plan
#   rate_cents:         how much this plan costs, in cents
#   rate:     ``          how much this plan costs, in Money
#   yearly:             whether this plan cycles yearly or monthly
#

  # yes, subscriptions.subscription_plan_id may not be null, but
  # this at least makes the delete not happen if there are any active.
		  has_many :subscriptions, :dependent => :nullify
		
		  composed_of :rate, :class_name => 'Money', :mapping => [ %w(rate_cents cents) ], :allow_nil => true
		
		  validates_presence_of :name
		  validates_presence_of :rate_cents
		
		  # returns the daily cost of this plan.
		  def daily_rate
		    yearly_rate / 365
		  end
		
		  # returns the yearly cost of this plan.
		  def yearly_rate
		    yearly? ? rate : rate * 12
		  end
		
		  # returns the monthly cost of this plan.
		  def monthly_rate
		    yearly? ? rate / 12 : rate
		  end
		end
	end
end