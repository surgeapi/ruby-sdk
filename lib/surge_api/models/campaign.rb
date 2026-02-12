# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Campaigns#create
    class Campaign < SurgeAPI::Internal::Type::BaseModel
      # @!attribute id
      #   The campaign ID
      #
      #   @return [String]
      required :id, String

      # @!attribute consent_flow
      #   A string explaining the method through which end users will opt in to receive
      #   messages from the brand. Typically this should include URLs for opt-in forms or
      #   screenshots that might be helpful in explaining the flow to someone unfamiliar
      #   with the organization's purpose.
      #
      #   @return [String]
      required :consent_flow, String

      # @!attribute description
      #   An explanation of the organization's purpose and how it will be using text
      #   messaging to accomplish that purpose.
      #
      #   @return [String]
      required :description, String

      # @!attribute includes
      #   A list of properties that this campaign should include. These properties can be
      #   any of the following values:
      #
      #   - `links` - whether the campaign might send links in messages
      #   - `phone_numbers` - whether the campaign might send phone numbers in messages
      #   - `age_gated` - whether the campaign contains age gated content (controlled
      #     substances or adult content)
      #   - `direct_lending` - whether the campaign contains content related to direct
      #     lending or other loan arrangements
      #
      #   @return [Array<Symbol, SurgeAPI::Models::Campaign::Include>]
      required :includes, -> { SurgeAPI::Internal::Type::ArrayOf[enum: SurgeAPI::Campaign::Include] }

      # @!attribute message_samples
      #   An array of 2-5 strings with examples of the messages that will be sent from
      #   this campaign. Typically the first sample should be a compliance message like
      #   `You are now opted in to messages from {brand name}. Frequency varies. Msg&data rates apply. Reply STOP to opt out.`
      #   These samples don't necessarily need to be the only templates that will be used
      #   for the campaign, but they should reflect the purpose of the messages that will
      #   be sent. Any variable content can be reflected by wrapping it in square brackets
      #   like `[customer name]`.
      #
      #   @return [Array<String>]
      required :message_samples, SurgeAPI::Internal::Type::ArrayOf[String]

      # @!attribute privacy_policy_url
      #   The URL of the privacy policy for the brand in question. This may be a shared
      #   privacy policy if it's the policy that is displayed to end users when they opt
      #   in to messaging.
      #
      #   @return [String]
      required :privacy_policy_url, String

      # @!attribute status
      #   The current status of the campaign.
      #
      #   @return [Symbol, SurgeAPI::Models::Campaign::Status]
      required :status, enum: -> { SurgeAPI::Campaign::Status }

      # @!attribute use_cases
      #   A list containing 1-5 types of messages that will be sent with this campaign.
      #
      #   The following use cases are typically available to all brands:
      #
      #   - `account_notification` - For sending reminders, alerts, and general
      #     account-related notifications like booking confirmations or appointment
      #     reminders.
      #   - `customer_care` - For account support, troubleshooting, and general customer
      #     service communication.
      #   - `delivery_notification` - For notifying customers about the status of product
      #     or service deliveries.
      #   - `fraud_alert` - For warning customers about suspicious or potentially
      #     fraudulent activity.
      #   - `higher_education` - For messaging related to colleges, universities, and
      #     school districts outside of K–12.
      #   - `marketing` - For promotional or advertising messages intended to market
      #     products or services.
      #   - `polling_voting` - For conducting surveys, polls, or voting-related messaging.
      #   - `public_service_announcement` - For raising awareness about social issues or
      #     important public information.
      #   - `security_alert` - For alerts related to potential security breaches or
      #     compromised systems requiring user action.
      #   - `two_factor_authentication` - For sending one-time passwords or verification
      #     codes for login or password reset.
      #
      #   For access to special use cases not shown here, reach out to support@surge.app.
      #
      #   @return [Array<Symbol, SurgeAPI::Models::Campaign::UseCase>]
      required :use_cases, -> { SurgeAPI::Internal::Type::ArrayOf[enum: SurgeAPI::Campaign::UseCase] }

      # @!attribute volume
      #   This will be one of the following:
      #
      #   - `low` - The campaign will be allowed to send up to 2000 SMS segments to
      #     T-Mobile customers each day. In this case your platform will be charged for
      #     the setup fee for a low volume number upon receipt of the API request.
      #   - `high` - The campaign will be allowed to send up to 200k SMS segments to
      #     T-Mobile customers each day, depending on the trust score assigned by The
      #     Campaign Registry. Your platform will be charged for the setup fee for a high
      #     volume number upon receipt of the API request, and phone numbers will be
      #     charged as high volume numbers going forward.
      #
      #   @return [Symbol, SurgeAPI::Models::Campaign::Volume]
      required :volume, enum: -> { SurgeAPI::Campaign::Volume }

      # @!attribute link_sample
      #   A sample link that might be sent by this campaign. If links from other domains
      #   are sent through this campaign, they are much more likely to be filtered by the
      #   carriers. If link shortening is enabled for the account, the link shortener URL
      #   will be used instead of what is provided. Reach out to support if you would like
      #   to disable automatic link shortening.
      #
      #   @return [String, nil]
      optional :link_sample, String

      # @!attribute terms_and_conditions_url
      #   The URL of the terms and conditions presented to end users when they opt in to
      #   messaging. These terms and conditions may be shared among all of a platform's
      #   customers if they're the terms that are presented to end users when they opt in
      #   to messaging.
      #
      #   @return [String, nil]
      optional :terms_and_conditions_url, String

      # @!method initialize(id:, consent_flow:, description:, includes:, message_samples:, privacy_policy_url:, status:, use_cases:, volume:, link_sample: nil, terms_and_conditions_url: nil)
      #   Some parameter documentations has been truncated, see
      #   {SurgeAPI::Models::Campaign} for more details.
      #
      #   A campaign represents the context in which one or more of your phone numbers
      #   communicates with your contacts. Consent and opt-outs are tied to the campaign.
      #
      #   @param id [String] The campaign ID
      #
      #   @param consent_flow [String] A string explaining the method through which end users will opt in to receive me
      #
      #   @param description [String] An explanation of the organization's purpose and how it will be using text messa
      #
      #   @param includes [Array<Symbol, SurgeAPI::Models::Campaign::Include>] A list of properties that this campaign should include. These properties can be
      #
      #   @param message_samples [Array<String>] An array of 2-5 strings with examples of the messages that will be sent from thi
      #
      #   @param privacy_policy_url [String] The URL of the privacy policy for the brand in question. This may be a shared pr
      #
      #   @param status [Symbol, SurgeAPI::Models::Campaign::Status] The current status of the campaign.
      #
      #   @param use_cases [Array<Symbol, SurgeAPI::Models::Campaign::UseCase>] A list containing 1-5 types of messages that will be sent with this campaign.
      #
      #   @param volume [Symbol, SurgeAPI::Models::Campaign::Volume] This will be one of the following:
      #
      #   @param link_sample [String] A sample link that might be sent by this campaign. If links from other domains a
      #
      #   @param terms_and_conditions_url [String] The URL of the terms and conditions presented to end users when they opt in to m

      module Include
        extend SurgeAPI::Internal::Type::Enum

        LINKS = :links
        PHONE_NUMBERS = :phone_numbers
        AGE_GATED = :age_gated
        DIRECT_LENDING = :direct_lending

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The current status of the campaign.
      #
      # @see SurgeAPI::Models::Campaign#status
      module Status
        extend SurgeAPI::Internal::Type::Enum

        ACTIVE = :active
        CANCELED = :canceled
        CREATED = :created
        DEACTIVATED = :deactivated
        IN_REVIEW = :in_review
        PENDING = :pending
        REJECTED = :rejected

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      module UseCase
        extend SurgeAPI::Internal::Type::Enum

        ACCOUNT_NOTIFICATION = :account_notification
        CUSTOMER_CARE = :customer_care
        DELIVERY_NOTIFICATION = :delivery_notification
        FRAUD_ALERT = :fraud_alert
        HIGHER_EDUCATION = :higher_education
        MARKETING = :marketing
        POLLING_VOTING = :polling_voting
        PUBLIC_SERVICE_ANNOUNCEMENT = :public_service_announcement
        SECURITY_ALERT = :security_alert
        TWO_FACTOR_AUTHENTICATION = :two_factor_authentication

        # @!method self.values
        #   @return [Array<Symbol>]
      end

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
      #
      # @see SurgeAPI::Models::Campaign#volume
      module Volume
        extend SurgeAPI::Internal::Type::Enum

        HIGH = :high
        LOW = :low

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
