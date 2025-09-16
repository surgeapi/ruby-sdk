# typed: strong

module SurgeAPI
  module Resources
    class Campaigns
      # Creates a campaign to register account to send text messages.
      sig do
        params(
          account_id: String,
          consent_flow: String,
          description: String,
          message_samples: T::Array[String],
          privacy_policy_url: String,
          use_cases: T::Array[SurgeAPI::CampaignParams::UseCase::OrSymbol],
          volume: SurgeAPI::CampaignParams::Volume::OrSymbol,
          includes: T::Array[SurgeAPI::CampaignParams::Include::OrSymbol],
          link_sample: String,
          terms_and_conditions_url: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::Campaign)
      end
      def create(
        # The account for which the campaign should be created.
        account_id,
        # A string explaining the method through which end users will opt in to receive
        # messages from the brand. Typically this should include URLs for opt-in forms or
        # screenshots that might be helpful in explaining the flow to someone unfamiliar
        # with the organization's purpose.
        consent_flow:,
        # An explanation of the organization's purpose and how it will be using text
        # messaging to accomplish that purpose.
        description:,
        # An array of 2-5 strings with examples of the messages that will be sent from
        # this campaign. Typically the first sample should be a compliance message like
        # `You are now opted in to messages from {brand name}. Frequency varies. Msg&data rates apply. Reply STOP to opt out.`
        # These samples don't necessarily need to be the only templates that will be used
        # for the campaign, but they should reflect the purpose of the messages that will
        # be sent. Any variable content can be reflected by wrapping it in square brackets
        # like `[customer name]`.
        message_samples:,
        # The URL of the privacy policy for the brand in question. This may be a shared
        # privacy policy if it's the policy that is displayed to end users when they opt
        # in to messaging.
        privacy_policy_url:,
        # A list containing 1-5 types of messages that will be sent with this campaign.
        #
        # The following use cases are typically available to all brands:
        #
        # - `account_notification` - For sending reminders, alerts, and general
        #   account-related notifications like booking confirmations or appointment
        #   reminders.
        # - `customer_care` - For account support, troubleshooting, and general customer
        #   service communication.
        # - `delivery_notification` - For notifying customers about the status of product
        #   or service deliveries.
        # - `fraud_alert` - For warning customers about suspicious or potentially
        #   fraudulent activity.
        # - `higher_education` - For messaging related to colleges, universities, and
        #   school districts outside of K–12.
        # - `marketing` - For promotional or advertising messages intended to market
        #   products or services.
        # - `polling_voting` - For conducting surveys, polls, or voting-related messaging.
        # - `public_service_announcement` - For raising awareness about social issues or
        #   important public information.
        # - `security_alert` - For alerts related to potential security breaches or
        #   compromised systems requiring user action.
        # - `two_factor_authentication` - For sending one-time passwords or verification
        #   codes for login or password reset.
        #
        # For access to special use cases not shown here, reach out to support@surge.app.
        use_cases:,
        # This will be one of the following:
        #
        # - `low` - The campaign will be allowed to send up to 2000 SMS segments to
        #   T-Mobile customers each day. In this case your platform will be charged for
        #   the setup fee for a low volume number upon receipt of the API request.
        # - `high` - The campaign will be allowed to send up to 200k SMS segments to
        #   T-Mobile customers each day, depending on the trust score assigned by The
        #   Campaign Registry. Your platform will be charged for the setup fee for a high
        #   volume number upon receipt of the API request, and phone numbers will be
        #   charged as high volume numbers going forward.
        volume:,
        # A list of properties that this campaign should include. These properties can be
        # any of the following values:
        #
        # - `links` - whether the campaign might send links in messages
        # - `phone_numbers` - whether the campaign might send phone numbers in messages
        # - `age_gated` - whether the campaign contains age gated content (controlled
        #   substances or adult content)
        # - `direct_lending` - whether the campaign contains content related to direct
        #   lending or other loan arrangements
        includes: nil,
        # A sample link that might be sent by this campaign. If links from other domains
        # are sent through this campaign, they are much more likely to be filtered by the
        # carriers. If link shortening is enabled for the account, the link shortener URL
        # will be used instead of what is provided. Reach out to support if you would like
        # to disable automatic link shortening.
        link_sample: nil,
        # The URL of the terms and conditions presented to end users when they opt in to
        # messaging. These terms and conditions may be shared among all of a platform's
        # customers if they're the terms that are presented to end users when they opt in
        # to messaging.
        terms_and_conditions_url: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: SurgeAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
