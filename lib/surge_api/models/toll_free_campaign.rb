# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::TollFreeCampaigns#create
    class TollFreeCampaign < SurgeAPI::Internal::Type::BaseModel
      # @!attribute id
      #   The toll-free campaign ID
      #
      #   @return [String]
      required :id, String

      # @!attribute consent_flows
      #
      #   @return [Array<SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember0, SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember1, SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember2, SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember3, SurgeAPI::Models::TollFreeCampaignConsentFlow::Type>]
      required :consent_flows,
               -> { SurgeAPI::Internal::Type::ArrayOf[union: SurgeAPI::TollFreeCampaignConsentFlow] }

      # @!attribute description
      #
      #   @return [String, nil]
      required :description, String, nil?: true

      # @!attribute includes
      #
      #   @return [Array<Symbol, SurgeAPI::Models::TollFreeCampaign::Include>]
      required :includes, -> { SurgeAPI::Internal::Type::ArrayOf[enum: SurgeAPI::TollFreeCampaign::Include] }

      # @!attribute message_samples
      #
      #   @return [Array<String>]
      required :message_samples, SurgeAPI::Internal::Type::ArrayOf[String]

      # @!attribute phone_number_id
      #   The toll-free phone number ID
      #
      #   @return [String]
      required :phone_number_id, String

      # @!attribute privacy_policy_url
      #
      #   @return [String, nil]
      required :privacy_policy_url, String, nil?: true

      # @!attribute status
      #   The current status of the toll-free campaign.
      #
      #   @return [Symbol, SurgeAPI::Models::TollFreeCampaign::Status]
      required :status, enum: -> { SurgeAPI::TollFreeCampaign::Status }

      # @!attribute terms_and_conditions_url
      #
      #   @return [String, nil]
      required :terms_and_conditions_url, String, nil?: true

      # @!attribute use_cases
      #
      #   @return [Array<Symbol, SurgeAPI::Models::TollFreeCampaign::UseCase>]
      required :use_cases, -> { SurgeAPI::Internal::Type::ArrayOf[enum: SurgeAPI::TollFreeCampaign::UseCase] }

      # @!method initialize(id:, consent_flows:, description:, includes:, message_samples:, phone_number_id:, privacy_policy_url:, status:, terms_and_conditions_url:, use_cases:)
      #   A toll-free campaign registration for a phone number.
      #
      #   @param id [String] The toll-free campaign ID
      #
      #   @param consent_flows [Array<SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember0, SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember1, SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember2, SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember3, SurgeAPI::Models::TollFreeCampaignConsentFlow::Type>]
      #
      #   @param description [String, nil]
      #
      #   @param includes [Array<Symbol, SurgeAPI::Models::TollFreeCampaign::Include>]
      #
      #   @param message_samples [Array<String>]
      #
      #   @param phone_number_id [String] The toll-free phone number ID
      #
      #   @param privacy_policy_url [String, nil]
      #
      #   @param status [Symbol, SurgeAPI::Models::TollFreeCampaign::Status] The current status of the toll-free campaign.
      #
      #   @param terms_and_conditions_url [String, nil]
      #
      #   @param use_cases [Array<Symbol, SurgeAPI::Models::TollFreeCampaign::UseCase>]

      module Include
        extend SurgeAPI::Internal::Type::Enum

        AGE_GATED = :age_gated

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The current status of the toll-free campaign.
      #
      # @see SurgeAPI::Models::TollFreeCampaign#status
      module Status
        extend SurgeAPI::Internal::Type::Enum

        ACTIVE = :active
        CANCELED = :canceled
        CREATED = :created
        IN_REVIEW = :in_review
        REJECTED = :rejected

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      module UseCase
        extend SurgeAPI::Internal::Type::Enum

        TWO_FACTOR_AUTHENTICATION = :two_factor_authentication
        ACCOUNT_NOTIFICATION = :account_notification
        CUSTOMER_CARE = :customer_care
        CHARITY = :charity
        DELIVERY_NOTIFICATION = :delivery_notification
        FRAUD_ALERT = :fraud_alert
        EVENT = :event
        HIGHER_EDUCATION = :higher_education
        K12_EDUCATION = :k12_education
        MARKETING = :marketing
        POLLING_VOTING = :polling_voting
        POLITICAL = :political
        PUBLIC_SERVICE_ANNOUNCEMENT = :public_service_announcement
        SECURITY_ALERT = :security_alert

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
