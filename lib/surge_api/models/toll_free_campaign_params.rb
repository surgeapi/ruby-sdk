# frozen_string_literal: true

module SurgeAPI
  module Models
    class TollFreeCampaignParams < SurgeAPI::Internal::Type::BaseModel
      # @!attribute consent_flows
      #
      #   @return [Array<SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember0, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember1, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember2, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember3>]
      required :consent_flows,
               -> { SurgeAPI::Internal::Type::ArrayOf[union: SurgeAPI::TollFreeCampaignParams::ConsentFlow] }

      # @!attribute description
      #   An explanation of how the toll-free number will be used.
      #
      #   @return [String]
      required :description, String

      # @!attribute message_samples
      #
      #   @return [Array<String>]
      required :message_samples, SurgeAPI::Internal::Type::ArrayOf[String]

      # @!attribute phone_number_id
      #   The toll-free phone number to register.
      #
      #   @return [String]
      required :phone_number_id, String

      # @!attribute privacy_policy_url
      #
      #   @return [String]
      required :privacy_policy_url, String

      # @!attribute terms_and_conditions_url
      #
      #   @return [String]
      required :terms_and_conditions_url, String

      # @!attribute use_cases
      #
      #   @return [Array<Symbol, SurgeAPI::Models::TollFreeCampaignParams::UseCase>]
      required :use_cases,
               -> { SurgeAPI::Internal::Type::ArrayOf[enum: SurgeAPI::TollFreeCampaignParams::UseCase] }

      # @!attribute includes
      #
      #   @return [Array<Symbol, SurgeAPI::Models::TollFreeCampaignParams::Include>, nil]
      optional :includes,
               -> { SurgeAPI::Internal::Type::ArrayOf[enum: SurgeAPI::TollFreeCampaignParams::Include] }

      # @!method initialize(consent_flows:, description:, message_samples:, phone_number_id:, privacy_policy_url:, terms_and_conditions_url:, use_cases:, includes: nil)
      #   Parameters for creating a toll-free campaign through Surge
      #
      #   @param consent_flows [Array<SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember0, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember1, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember2, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember3>]
      #
      #   @param description [String] An explanation of how the toll-free number will be used.
      #
      #   @param message_samples [Array<String>]
      #
      #   @param phone_number_id [String] The toll-free phone number to register.
      #
      #   @param privacy_policy_url [String]
      #
      #   @param terms_and_conditions_url [String]
      #
      #   @param use_cases [Array<Symbol, SurgeAPI::Models::TollFreeCampaignParams::UseCase>]
      #
      #   @param includes [Array<Symbol, SurgeAPI::Models::TollFreeCampaignParams::Include>]

      module ConsentFlow
        extend SurgeAPI::Internal::Type::Union

        variant -> { SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember0 }

        variant -> { SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1 }

        variant -> { SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember2 }

        variant -> { SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember3 }

        class UnionMember0 < SurgeAPI::Internal::Type::BaseModel
          # @!attribute script
          #
          #   @return [String]
          required :script, String

          # @!attribute type
          #
          #   @return [Symbol, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember0::Type]
          required :type, enum: -> { SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember0::Type }

          # @!method initialize(script:, type:)
          #   @param script [String]
          #   @param type [Symbol, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember0::Type]

          # @see SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember0#type
          module Type
            extend SurgeAPI::Internal::Type::Enum

            VERBAL = :verbal

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class UnionMember1 < SurgeAPI::Internal::Type::BaseModel
          # @!attribute owner
          #
          #   @return [Symbol, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember1::Owner]
          required :owner, enum: -> { SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Owner }

          # @!attribute type
          #
          #   @return [Symbol, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember1::Type]
          required :type, enum: -> { SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Type }

          # @!attribute form_url
          #
          #   @return [String, nil]
          optional :form_url, String

          # @!attribute screenshot
          #
          #   @return [SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember1::Screenshot, nil]
          optional :screenshot, -> { SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Screenshot }

          # @!method initialize(owner:, type:, form_url: nil, screenshot: nil)
          #   @param owner [Symbol, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember1::Owner]
          #   @param type [Symbol, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember1::Type]
          #   @param form_url [String]
          #   @param screenshot [SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember1::Screenshot]

          # @see SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember1#owner
          module Owner
            extend SurgeAPI::Internal::Type::Enum

            BRAND = :brand
            PLATFORM = :platform

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember1#type
          module Type
            extend SurgeAPI::Internal::Type::Enum

            WEB_FORM = :web_form

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember1#screenshot
          class Screenshot < SurgeAPI::Internal::Type::BaseModel
            # @!attribute reason
            #
            #   @return [Symbol, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember1::Screenshot::Reason]
            required :reason,
                     enum: -> { SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember1::Screenshot::Reason }

            # @!attribute urls
            #
            #   @return [Array<String>]
            required :urls, SurgeAPI::Internal::Type::ArrayOf[String]

            # @!attribute reason_other
            #
            #   @return [String, nil]
            optional :reason_other, String

            # @!method initialize(reason:, urls:, reason_other: nil)
            #   @param reason [Symbol, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember1::Screenshot::Reason]
            #   @param urls [Array<String>]
            #   @param reason_other [String]

            # @see SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember1::Screenshot#reason
            module Reason
              extend SurgeAPI::Internal::Type::Enum

              BEHIND_LOGIN = :behind_login
              UNDER_CONSTRUCTION = :under_construction
              OTHER = :other

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end

        class UnionMember2 < SurgeAPI::Internal::Type::BaseModel
          # @!attribute file_urls
          #
          #   @return [Array<String>]
          required :file_urls, SurgeAPI::Internal::Type::ArrayOf[String]

          # @!attribute type
          #
          #   @return [Symbol, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember2::Type]
          required :type, enum: -> { SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember2::Type }

          # @!attribute keywords
          #
          #   @return [Array<String>, nil]
          optional :keywords, SurgeAPI::Internal::Type::ArrayOf[String]

          # @!method initialize(file_urls:, type:, keywords: nil)
          #   @param file_urls [Array<String>]
          #   @param type [Symbol, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember2::Type]
          #   @param keywords [Array<String>]

          # @see SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember2#type
          module Type
            extend SurgeAPI::Internal::Type::Enum

            TEXT = :text

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class UnionMember3 < SurgeAPI::Internal::Type::BaseModel
          # @!attribute file_urls
          #
          #   @return [Array<String>]
          required :file_urls, SurgeAPI::Internal::Type::ArrayOf[String]

          # @!attribute type
          #
          #   @return [Symbol, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember3::Type]
          required :type, enum: -> { SurgeAPI::TollFreeCampaignParams::ConsentFlow::UnionMember3::Type }

          # @!method initialize(file_urls:, type:)
          #   @param file_urls [Array<String>]
          #   @param type [Symbol, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember3::Type]

          # @see SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember3#type
          module Type
            extend SurgeAPI::Internal::Type::Enum

            PAPER_FORM = :paper_form

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember0, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember1, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember2, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember3)]
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

      module Include
        extend SurgeAPI::Internal::Type::Enum

        AGE_GATED = :age_gated

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
