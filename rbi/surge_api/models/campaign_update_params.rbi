# typed: strong

module SurgeAPI
  module Models
    class CampaignUpdateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SurgeAPI::CampaignUpdateParams, SurgeAPI::Internal::AnyHash)
        end

      # The ID of the campaign to update.
      sig { returns(String) }
      attr_accessor :id

      # A string explaining the method through which end users will opt in to receive
      # messages from the brand. Typically this should include URLs for opt-in forms or
      # screenshots that might be helpful in explaining the flow to someone unfamiliar
      # with the organization's purpose.
      sig { returns(T.nilable(String)) }
      attr_reader :consent_flow

      sig { params(consent_flow: String).void }
      attr_writer :consent_flow

      # An explanation of the organization's purpose and how it will be using text
      # messaging to accomplish that purpose.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

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
          T.nilable(T::Array[SurgeAPI::CampaignUpdateParams::Include::OrSymbol])
        )
      end
      attr_reader :includes

      sig do
        params(
          includes: T::Array[SurgeAPI::CampaignUpdateParams::Include::OrSymbol]
        ).void
      end
      attr_writer :includes

      # A sample link that might be sent by this campaign. This is required when
      # `includes` contains `links`. Provide the same URL or domain that the campaign
      # will use in production. If links from other domains are sent through this
      # campaign, they are much more likely to be filtered by the carriers.
      sig { returns(T.nilable(String)) }
      attr_accessor :link_sample

      # An array of 2-5 strings with examples of the messages that will be sent from
      # this campaign. Typically the first sample should be a compliance message like
      # `You are now opted in to messages from {brand name}. Frequency varies. Msg&data rates apply. Reply STOP to opt out.`
      # These samples don't necessarily need to be the only templates that will be used
      # for the campaign, but they should reflect the purpose of the messages that will
      # be sent. Any variable content can be reflected by wrapping it in square brackets
      # like `[customer name]`.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :message_samples

      sig { params(message_samples: T::Array[String]).void }
      attr_writer :message_samples

      # The URL of the privacy policy for the brand in question. This may be a shared
      # privacy policy if it's the policy that is displayed to end users when they opt
      # in to messaging.
      sig { returns(T.nilable(String)) }
      attr_reader :privacy_policy_url

      sig { params(privacy_policy_url: String).void }
      attr_writer :privacy_policy_url

      # The URL of the terms and conditions presented to end users when they opt in to
      # messaging. These terms and conditions may be shared among all of a platform's
      # customers if they're the terms that are presented to end users when they opt in
      # to messaging.
      sig { returns(T.nilable(String)) }
      attr_reader :terms_and_conditions_url

      sig { params(terms_and_conditions_url: String).void }
      attr_writer :terms_and_conditions_url

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
        returns(
          T.nilable(T::Array[SurgeAPI::CampaignUpdateParams::UseCase::OrSymbol])
        )
      end
      attr_reader :use_cases

      sig do
        params(
          use_cases: T::Array[SurgeAPI::CampaignUpdateParams::UseCase::OrSymbol]
        ).void
      end
      attr_writer :use_cases

      # This will be one of the following:
      #
      # - `low` - The campaign will be allowed to send up to 2000 SMS segments to
      #   T-Mobile customers each day. In this case your project will be charged for the
      #   setup fee for a low volume number upon receipt of the API request.
      # - `high` - The campaign will be allowed to send up to 200k SMS segments to
      #   T-Mobile customers each day, depending on the trust score assigned by The
      #   Campaign Registry. Your project will be charged for the setup fee for a high
      #   volume number upon receipt of the API request, and phone numbers will be
      #   charged as high volume numbers going forward.
      sig do
        returns(T.nilable(SurgeAPI::CampaignUpdateParams::Volume::OrSymbol))
      end
      attr_reader :volume

      sig do
        params(volume: SurgeAPI::CampaignUpdateParams::Volume::OrSymbol).void
      end
      attr_writer :volume

      sig do
        params(
          id: String,
          consent_flow: String,
          description: String,
          includes: T::Array[SurgeAPI::CampaignUpdateParams::Include::OrSymbol],
          link_sample: T.nilable(String),
          message_samples: T::Array[String],
          privacy_policy_url: String,
          terms_and_conditions_url: String,
          use_cases:
            T::Array[SurgeAPI::CampaignUpdateParams::UseCase::OrSymbol],
          volume: SurgeAPI::CampaignUpdateParams::Volume::OrSymbol,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The ID of the campaign to update.
        id:,
        # A string explaining the method through which end users will opt in to receive
        # messages from the brand. Typically this should include URLs for opt-in forms or
        # screenshots that might be helpful in explaining the flow to someone unfamiliar
        # with the organization's purpose.
        consent_flow: nil,
        # An explanation of the organization's purpose and how it will be using text
        # messaging to accomplish that purpose.
        description: nil,
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
        # A sample link that might be sent by this campaign. This is required when
        # `includes` contains `links`. Provide the same URL or domain that the campaign
        # will use in production. If links from other domains are sent through this
        # campaign, they are much more likely to be filtered by the carriers.
        link_sample: nil,
        # An array of 2-5 strings with examples of the messages that will be sent from
        # this campaign. Typically the first sample should be a compliance message like
        # `You are now opted in to messages from {brand name}. Frequency varies. Msg&data rates apply. Reply STOP to opt out.`
        # These samples don't necessarily need to be the only templates that will be used
        # for the campaign, but they should reflect the purpose of the messages that will
        # be sent. Any variable content can be reflected by wrapping it in square brackets
        # like `[customer name]`.
        message_samples: nil,
        # The URL of the privacy policy for the brand in question. This may be a shared
        # privacy policy if it's the policy that is displayed to end users when they opt
        # in to messaging.
        privacy_policy_url: nil,
        # The URL of the terms and conditions presented to end users when they opt in to
        # messaging. These terms and conditions may be shared among all of a platform's
        # customers if they're the terms that are presented to end users when they opt in
        # to messaging.
        terms_and_conditions_url: nil,
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
        use_cases: nil,
        # This will be one of the following:
        #
        # - `low` - The campaign will be allowed to send up to 2000 SMS segments to
        #   T-Mobile customers each day. In this case your project will be charged for the
        #   setup fee for a low volume number upon receipt of the API request.
        # - `high` - The campaign will be allowed to send up to 200k SMS segments to
        #   T-Mobile customers each day, depending on the trust score assigned by The
        #   Campaign Registry. Your project will be charged for the setup fee for a high
        #   volume number upon receipt of the API request, and phone numbers will be
        #   charged as high volume numbers going forward.
        volume: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            consent_flow: String,
            description: String,
            includes:
              T::Array[SurgeAPI::CampaignUpdateParams::Include::OrSymbol],
            link_sample: T.nilable(String),
            message_samples: T::Array[String],
            privacy_policy_url: String,
            terms_and_conditions_url: String,
            use_cases:
              T::Array[SurgeAPI::CampaignUpdateParams::UseCase::OrSymbol],
            volume: SurgeAPI::CampaignUpdateParams::Volume::OrSymbol,
            request_options: SurgeAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Include
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, SurgeAPI::CampaignUpdateParams::Include)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LINKS =
          T.let(:links, SurgeAPI::CampaignUpdateParams::Include::TaggedSymbol)
        PHONE_NUMBERS =
          T.let(
            :phone_numbers,
            SurgeAPI::CampaignUpdateParams::Include::TaggedSymbol
          )
        AGE_GATED =
          T.let(
            :age_gated,
            SurgeAPI::CampaignUpdateParams::Include::TaggedSymbol
          )
        DIRECT_LENDING =
          T.let(
            :direct_lending,
            SurgeAPI::CampaignUpdateParams::Include::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[SurgeAPI::CampaignUpdateParams::Include::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module UseCase
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, SurgeAPI::CampaignUpdateParams::UseCase)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACCOUNT_NOTIFICATION =
          T.let(
            :account_notification,
            SurgeAPI::CampaignUpdateParams::UseCase::TaggedSymbol
          )
        CUSTOMER_CARE =
          T.let(
            :customer_care,
            SurgeAPI::CampaignUpdateParams::UseCase::TaggedSymbol
          )
        DELIVERY_NOTIFICATION =
          T.let(
            :delivery_notification,
            SurgeAPI::CampaignUpdateParams::UseCase::TaggedSymbol
          )
        FRAUD_ALERT =
          T.let(
            :fraud_alert,
            SurgeAPI::CampaignUpdateParams::UseCase::TaggedSymbol
          )
        HIGHER_EDUCATION =
          T.let(
            :higher_education,
            SurgeAPI::CampaignUpdateParams::UseCase::TaggedSymbol
          )
        MARKETING =
          T.let(
            :marketing,
            SurgeAPI::CampaignUpdateParams::UseCase::TaggedSymbol
          )
        POLLING_VOTING =
          T.let(
            :polling_voting,
            SurgeAPI::CampaignUpdateParams::UseCase::TaggedSymbol
          )
        PUBLIC_SERVICE_ANNOUNCEMENT =
          T.let(
            :public_service_announcement,
            SurgeAPI::CampaignUpdateParams::UseCase::TaggedSymbol
          )
        SECURITY_ALERT =
          T.let(
            :security_alert,
            SurgeAPI::CampaignUpdateParams::UseCase::TaggedSymbol
          )
        TWO_FACTOR_AUTHENTICATION =
          T.let(
            :two_factor_authentication,
            SurgeAPI::CampaignUpdateParams::UseCase::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[SurgeAPI::CampaignUpdateParams::UseCase::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # This will be one of the following:
      #
      # - `low` - The campaign will be allowed to send up to 2000 SMS segments to
      #   T-Mobile customers each day. In this case your project will be charged for the
      #   setup fee for a low volume number upon receipt of the API request.
      # - `high` - The campaign will be allowed to send up to 200k SMS segments to
      #   T-Mobile customers each day, depending on the trust score assigned by The
      #   Campaign Registry. Your project will be charged for the setup fee for a high
      #   volume number upon receipt of the API request, and phone numbers will be
      #   charged as high volume numbers going forward.
      module Volume
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, SurgeAPI::CampaignUpdateParams::Volume) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        HIGH =
          T.let(:high, SurgeAPI::CampaignUpdateParams::Volume::TaggedSymbol)
        LOW = T.let(:low, SurgeAPI::CampaignUpdateParams::Volume::TaggedSymbol)

        sig do
          override.returns(
            T::Array[SurgeAPI::CampaignUpdateParams::Volume::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
