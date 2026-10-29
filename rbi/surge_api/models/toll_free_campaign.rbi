# typed: strong

module SurgeAPI
  module Models
    class TollFreeCampaign < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SurgeAPI::TollFreeCampaign, SurgeAPI::Internal::AnyHash)
        end

      # The toll-free campaign ID
      sig { returns(String) }
      attr_accessor :id

      sig { returns(T::Array[SurgeAPI::TollFreeCampaignConsentFlow::Variants]) }
      attr_accessor :consent_flows

      sig { returns(T.nilable(String)) }
      attr_accessor :description

      sig do
        returns(T::Array[SurgeAPI::TollFreeCampaign::Include::TaggedSymbol])
      end
      attr_accessor :includes

      sig { returns(T::Array[String]) }
      attr_accessor :message_samples

      # The toll-free phone number ID
      sig { returns(String) }
      attr_accessor :phone_number_id

      sig { returns(T.nilable(String)) }
      attr_accessor :privacy_policy_url

      # The current status of the toll-free campaign.
      sig { returns(SurgeAPI::TollFreeCampaign::Status::TaggedSymbol) }
      attr_accessor :status

      sig { returns(T.nilable(String)) }
      attr_accessor :terms_and_conditions_url

      sig do
        returns(T::Array[SurgeAPI::TollFreeCampaign::UseCase::TaggedSymbol])
      end
      attr_accessor :use_cases

      # A toll-free campaign registration for a phone number.
      sig do
        params(
          id: String,
          consent_flows:
            T::Array[
              T.any(
                SurgeAPI::TollFreeCampaignConsentFlow::UnionMember0::OrHash,
                SurgeAPI::TollFreeCampaignConsentFlow::UnionMember1::OrHash,
                SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::OrHash,
                SurgeAPI::TollFreeCampaignConsentFlow::UnionMember3::OrHash,
                SurgeAPI::TollFreeCampaignConsentFlow::Type::OrHash
              )
            ],
          description: T.nilable(String),
          includes: T::Array[SurgeAPI::TollFreeCampaign::Include::OrSymbol],
          message_samples: T::Array[String],
          phone_number_id: String,
          privacy_policy_url: T.nilable(String),
          status: SurgeAPI::TollFreeCampaign::Status::OrSymbol,
          terms_and_conditions_url: T.nilable(String),
          use_cases: T::Array[SurgeAPI::TollFreeCampaign::UseCase::OrSymbol]
        ).returns(T.attached_class)
      end
      def self.new(
        # The toll-free campaign ID
        id:,
        consent_flows:,
        description:,
        includes:,
        message_samples:,
        # The toll-free phone number ID
        phone_number_id:,
        privacy_policy_url:,
        # The current status of the toll-free campaign.
        status:,
        terms_and_conditions_url:,
        use_cases:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            consent_flows:
              T::Array[SurgeAPI::TollFreeCampaignConsentFlow::Variants],
            description: T.nilable(String),
            includes:
              T::Array[SurgeAPI::TollFreeCampaign::Include::TaggedSymbol],
            message_samples: T::Array[String],
            phone_number_id: String,
            privacy_policy_url: T.nilable(String),
            status: SurgeAPI::TollFreeCampaign::Status::TaggedSymbol,
            terms_and_conditions_url: T.nilable(String),
            use_cases:
              T::Array[SurgeAPI::TollFreeCampaign::UseCase::TaggedSymbol]
          }
        )
      end
      def to_hash
      end

      module Include
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, SurgeAPI::TollFreeCampaign::Include) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AGE_GATED =
          T.let(:age_gated, SurgeAPI::TollFreeCampaign::Include::TaggedSymbol)

        sig do
          override.returns(
            T::Array[SurgeAPI::TollFreeCampaign::Include::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The current status of the toll-free campaign.
      module Status
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, SurgeAPI::TollFreeCampaign::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(:active, SurgeAPI::TollFreeCampaign::Status::TaggedSymbol)
        CANCELED =
          T.let(:canceled, SurgeAPI::TollFreeCampaign::Status::TaggedSymbol)
        CREATED =
          T.let(:created, SurgeAPI::TollFreeCampaign::Status::TaggedSymbol)
        IN_REVIEW =
          T.let(:in_review, SurgeAPI::TollFreeCampaign::Status::TaggedSymbol)
        REJECTED =
          T.let(:rejected, SurgeAPI::TollFreeCampaign::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[SurgeAPI::TollFreeCampaign::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module UseCase
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, SurgeAPI::TollFreeCampaign::UseCase) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TWO_FACTOR_AUTHENTICATION =
          T.let(
            :two_factor_authentication,
            SurgeAPI::TollFreeCampaign::UseCase::TaggedSymbol
          )
        ACCOUNT_NOTIFICATION =
          T.let(
            :account_notification,
            SurgeAPI::TollFreeCampaign::UseCase::TaggedSymbol
          )
        CUSTOMER_CARE =
          T.let(
            :customer_care,
            SurgeAPI::TollFreeCampaign::UseCase::TaggedSymbol
          )
        CHARITY =
          T.let(:charity, SurgeAPI::TollFreeCampaign::UseCase::TaggedSymbol)
        DELIVERY_NOTIFICATION =
          T.let(
            :delivery_notification,
            SurgeAPI::TollFreeCampaign::UseCase::TaggedSymbol
          )
        FRAUD_ALERT =
          T.let(:fraud_alert, SurgeAPI::TollFreeCampaign::UseCase::TaggedSymbol)
        EVENT = T.let(:event, SurgeAPI::TollFreeCampaign::UseCase::TaggedSymbol)
        HIGHER_EDUCATION =
          T.let(
            :higher_education,
            SurgeAPI::TollFreeCampaign::UseCase::TaggedSymbol
          )
        K12_EDUCATION =
          T.let(
            :k12_education,
            SurgeAPI::TollFreeCampaign::UseCase::TaggedSymbol
          )
        MARKETING =
          T.let(:marketing, SurgeAPI::TollFreeCampaign::UseCase::TaggedSymbol)
        POLLING_VOTING =
          T.let(
            :polling_voting,
            SurgeAPI::TollFreeCampaign::UseCase::TaggedSymbol
          )
        POLITICAL =
          T.let(:political, SurgeAPI::TollFreeCampaign::UseCase::TaggedSymbol)
        PUBLIC_SERVICE_ANNOUNCEMENT =
          T.let(
            :public_service_announcement,
            SurgeAPI::TollFreeCampaign::UseCase::TaggedSymbol
          )
        SECURITY_ALERT =
          T.let(
            :security_alert,
            SurgeAPI::TollFreeCampaign::UseCase::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[SurgeAPI::TollFreeCampaign::UseCase::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
