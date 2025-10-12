# typed: strong

module SurgeAPI
  module Models
    class CampaignCreateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SurgeAPI::CampaignCreateParams, SurgeAPI::Internal::AnyHash)
        end

      # A string explaining the method through which end users will opt in to receive
      # messages from the brand. Typically this should include URLs for opt-in forms or
      # screenshots that might be helpful in explaining the flow to someone unfamiliar
      # with the organization's purpose.
      sig { returns(String) }
      attr_accessor :consent_flow

      # An explanation of the organization's purpose and how it will be using text
      # messaging to accomplish that purpose.
      sig { returns(String) }
      attr_accessor :description

      # An array of 2-5 strings with examples of the messages that will be sent from
      # this campaign. Typically the first sample should be a compliance message like
      # `You are now opted in to messages from {brand name}. Frequency varies. Msg&data rates apply. Reply STOP to opt out.`
      # These samples don't necessarily need to be the only templates that will be used
      # for the campaign, but they should reflect the purpose of the messages that will
      # be sent. Any variable content can be reflected by wrapping it in square brackets
      # like `[customer name]`.
      sig { returns(T::Array[String]) }
      attr_accessor :message_samples

      # The URL of the privacy policy for the brand in question. This may be a shared
      # privacy policy if it's the policy that is displayed to end users when they opt
      # in to messaging.
      sig { returns(String) }
      attr_accessor :privacy_policy_url

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
      sig do
        returns(T::Array[SurgeAPI::CampaignCreateParams::UseCase::OrSymbol])
      end
      attr_accessor :use_cases

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
      sig { returns(SurgeAPI::CampaignCreateParams::Volume::OrSymbol) }
      attr_accessor :volume

      # A list of properties that this campaign should include. These properties can be
      # any of the following values:
      #
      # - `links` - whether the campaign might send links in messages
      # - `phone_numbers` - whether the campaign might send phone numbers in messages
      # - `age_gated` - whether the campaign contains age gated content (controlled
      #   substances or adult content)
      # - `direct_lending` - whether the campaign contains content related to direct
      #   lending or other loan arrangements
      sig do
        returns(
          T.nilable(T::Array[SurgeAPI::CampaignCreateParams::Include::OrSymbol])
        )
      end
      attr_reader :includes

      sig do
        params(
          includes: T::Array[SurgeAPI::CampaignCreateParams::Include::OrSymbol]
        ).void
      end
      attr_writer :includes

      # A sample link that might be sent by this campaign. If links from other domains
      # are sent through this campaign, they are much more likely to be filtered by the
      # carriers. If link shortening is enabled for the account, the link shortener URL
      # will be used instead of what is provided. Reach out to support if you would like
      # to disable automatic link shortening.
      sig { returns(T.nilable(String)) }
      attr_reader :link_sample

      sig { params(link_sample: String).void }
      attr_writer :link_sample

      # The URL of the terms and conditions presented to end users when they opt in to
      # messaging. These terms and conditions may be shared among all of a platform's
      # customers if they're the terms that are presented to end users when they opt in
      # to messaging.
      sig { returns(T.nilable(String)) }
      attr_reader :terms_and_conditions_url

      sig { params(terms_and_conditions_url: String).void }
      attr_writer :terms_and_conditions_url

      # The Campaign Registry (TCR) ID for the externally registered campaign
      sig { returns(String) }
      attr_accessor :tcr_id

      sig do
        params(
          consent_flow: String,
          description: String,
          message_samples: T::Array[String],
          privacy_policy_url: String,
          use_cases:
            T::Array[SurgeAPI::CampaignCreateParams::UseCase::OrSymbol],
          volume: SurgeAPI::CampaignCreateParams::Volume::OrSymbol,
          tcr_id: String,
          includes: T::Array[SurgeAPI::CampaignCreateParams::Include::OrSymbol],
          link_sample: String,
          terms_and_conditions_url: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
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
        # The Campaign Registry (TCR) ID for the externally registered campaign
        tcr_id:,
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

      sig do
        override.returns(
          {
            consent_flow: String,
            description: String,
            message_samples: T::Array[String],
            privacy_policy_url: String,
            use_cases:
              T::Array[SurgeAPI::CampaignCreateParams::UseCase::OrSymbol],
            volume: SurgeAPI::CampaignCreateParams::Volume::OrSymbol,
            includes:
              T::Array[SurgeAPI::CampaignCreateParams::Include::OrSymbol],
            link_sample: String,
            terms_and_conditions_url: String,
            tcr_id: String,
            request_options: SurgeAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      module UseCase
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, SurgeAPI::CampaignCreateParams::UseCase)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACCOUNT_NOTIFICATION =
          T.let(
            :account_notification,
            SurgeAPI::CampaignCreateParams::UseCase::TaggedSymbol
          )
        CUSTOMER_CARE =
          T.let(
            :customer_care,
            SurgeAPI::CampaignCreateParams::UseCase::TaggedSymbol
          )
        DELIVERY_NOTIFICATION =
          T.let(
            :delivery_notification,
            SurgeAPI::CampaignCreateParams::UseCase::TaggedSymbol
          )
        FRAUD_ALERT =
          T.let(
            :fraud_alert,
            SurgeAPI::CampaignCreateParams::UseCase::TaggedSymbol
          )
        HIGHER_EDUCATION =
          T.let(
            :higher_education,
            SurgeAPI::CampaignCreateParams::UseCase::TaggedSymbol
          )
        MARKETING =
          T.let(
            :marketing,
            SurgeAPI::CampaignCreateParams::UseCase::TaggedSymbol
          )
        POLLING_VOTING =
          T.let(
            :polling_voting,
            SurgeAPI::CampaignCreateParams::UseCase::TaggedSymbol
          )
        PUBLIC_SERVICE_ANNOUNCEMENT =
          T.let(
            :public_service_announcement,
            SurgeAPI::CampaignCreateParams::UseCase::TaggedSymbol
          )
        SECURITY_ALERT =
          T.let(
            :security_alert,
            SurgeAPI::CampaignCreateParams::UseCase::TaggedSymbol
          )
        TWO_FACTOR_AUTHENTICATION =
          T.let(
            :two_factor_authentication,
            SurgeAPI::CampaignCreateParams::UseCase::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[SurgeAPI::CampaignCreateParams::UseCase::TaggedSymbol]
          )
        end
        def self.values
        end
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
      module Volume
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, SurgeAPI::CampaignCreateParams::Volume) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        HIGH =
          T.let(:high, SurgeAPI::CampaignCreateParams::Volume::TaggedSymbol)
        LOW = T.let(:low, SurgeAPI::CampaignCreateParams::Volume::TaggedSymbol)

        sig do
          override.returns(
            T::Array[SurgeAPI::CampaignCreateParams::Volume::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module Include
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, SurgeAPI::CampaignCreateParams::Include)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LINKS =
          T.let(:links, SurgeAPI::CampaignCreateParams::Include::TaggedSymbol)
        PHONE_NUMBERS =
          T.let(
            :phone_numbers,
            SurgeAPI::CampaignCreateParams::Include::TaggedSymbol
          )
        AGE_GATED =
          T.let(
            :age_gated,
            SurgeAPI::CampaignCreateParams::Include::TaggedSymbol
          )
        DIRECT_LENDING =
          T.let(
            :direct_lending,
            SurgeAPI::CampaignCreateParams::Include::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[SurgeAPI::CampaignCreateParams::Include::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
