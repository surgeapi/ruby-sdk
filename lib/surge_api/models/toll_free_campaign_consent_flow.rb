# frozen_string_literal: true

module SurgeAPI
  module Models
    # A consent flow returned on toll-free campaign responses.
    module TollFreeCampaignConsentFlow
      extend SurgeAPI::Internal::Type::Union

      variant -> { SurgeAPI::TollFreeCampaignConsentFlow::UnionMember0 }

      variant -> { SurgeAPI::TollFreeCampaignConsentFlow::UnionMember1 }

      variant -> { SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2 }

      variant -> { SurgeAPI::TollFreeCampaignConsentFlow::UnionMember3 }

      variant -> { SurgeAPI::TollFreeCampaignConsentFlow::Type }

      class UnionMember0 < SurgeAPI::Internal::Type::BaseModel
        # @!attribute script
        #
        #   @return [String]
        required :script, String

        # @!attribute type
        #
        #   @return [Symbol, SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember0::Type]
        required :type, enum: -> { SurgeAPI::TollFreeCampaignConsentFlow::UnionMember0::Type }

        # @!method initialize(script:, type:)
        #   @param script [String]
        #   @param type [Symbol, SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember0::Type]

        # @see SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember0#type
        module Type
          extend SurgeAPI::Internal::Type::Enum

          VERBAL = :verbal

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class UnionMember1 < SurgeAPI::Internal::Type::BaseModel
        # @!attribute form_url
        #
        #   @return [String]
        required :form_url, String

        # @!attribute type
        #
        #   @return [Symbol, SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember1::Type]
        required :type, enum: -> { SurgeAPI::TollFreeCampaignConsentFlow::UnionMember1::Type }

        # @!method initialize(form_url:, type:)
        #   @param form_url [String]
        #   @param type [Symbol, SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember1::Type]

        # @see SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember1#type
        module Type
          extend SurgeAPI::Internal::Type::Enum

          WEB_FORM = :web_form

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class UnionMember2 < SurgeAPI::Internal::Type::BaseModel
        # @!attribute screenshot
        #
        #   @return [SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember2::Screenshot]
        required :screenshot, -> { SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::Screenshot }

        # @!attribute type
        #
        #   @return [Symbol, SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember2::Type]
        required :type, enum: -> { SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::Type }

        # @!method initialize(screenshot:, type:)
        #   @param screenshot [SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember2::Screenshot]
        #   @param type [Symbol, SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember2::Type]

        # @see SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember2#screenshot
        class Screenshot < SurgeAPI::Internal::Type::BaseModel
          # @!attribute reason
          #
          #   @return [Symbol, SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember2::Screenshot::Reason]
          required :reason, enum: -> { SurgeAPI::TollFreeCampaignConsentFlow::UnionMember2::Screenshot::Reason }

          # @!attribute reason_other
          #
          #   @return [String, nil]
          optional :reason_other, String

          # @!method initialize(reason:, reason_other: nil)
          #   @param reason [Symbol, SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember2::Screenshot::Reason]
          #   @param reason_other [String]

          # @see SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember2::Screenshot#reason
          module Reason
            extend SurgeAPI::Internal::Type::Enum

            BEHIND_LOGIN = :behind_login
            UNDER_CONSTRUCTION = :under_construction
            OTHER = :other

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember2#type
        module Type
          extend SurgeAPI::Internal::Type::Enum

          WEB_FORM = :web_form

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class UnionMember3 < SurgeAPI::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember3::Type]
        required :type, enum: -> { SurgeAPI::TollFreeCampaignConsentFlow::UnionMember3::Type }

        # @!attribute keywords
        #
        #   @return [Array<String>, nil]
        optional :keywords, SurgeAPI::Internal::Type::ArrayOf[String]

        # @!method initialize(type:, keywords: nil)
        #   @param type [Symbol, SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember3::Type]
        #   @param keywords [Array<String>]

        # @see SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember3#type
        module Type
          extend SurgeAPI::Internal::Type::Enum

          TEXT = :text

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class Type < SurgeAPI::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, SurgeAPI::Models::TollFreeCampaignConsentFlow::Type::Type]
        required :type, enum: -> { SurgeAPI::TollFreeCampaignConsentFlow::Type::Type }

        # @!method initialize(type:)
        #   @param type [Symbol, SurgeAPI::Models::TollFreeCampaignConsentFlow::Type::Type]

        # @see SurgeAPI::Models::TollFreeCampaignConsentFlow::Type#type
        module Type
          extend SurgeAPI::Internal::Type::Enum

          PAPER_FORM = :paper_form

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @!method self.variants
      #   @return [Array(SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember0, SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember1, SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember2, SurgeAPI::Models::TollFreeCampaignConsentFlow::UnionMember3, SurgeAPI::Models::TollFreeCampaignConsentFlow::Type)]
    end
  end
end
