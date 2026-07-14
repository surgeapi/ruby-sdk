# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::PhoneNumbers#list_available_numbers
    class PhoneNumberListAvailableNumbersResponse < SurgeAPI::Internal::Type::BaseModel
      # @!attribute country
      #   ISO country code for the phone number
      #
      #   @return [Symbol, SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse::Country]
      required :country, enum: -> { SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse::Country }

      # @!attribute number
      #   The phone number in E.164 format
      #
      #   @return [String]
      required :number, String

      # @!attribute type
      #   Whether the phone number is local or toll-free
      #
      #   @return [Symbol, SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse::Type]
      required :type, enum: -> { SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse::Type }

      # @!method initialize(country:, number:, type:)
      #   A phone number available for purchase from Surge inventory
      #
      #   @param country [Symbol, SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse::Country] ISO country code for the phone number
      #
      #   @param number [String] The phone number in E.164 format
      #
      #   @param type [Symbol, SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse::Type] Whether the phone number is local or toll-free

      # ISO country code for the phone number
      #
      # @see SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse#country
      module Country
        extend SurgeAPI::Internal::Type::Enum

        US = :US
        CA = :CA

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Whether the phone number is local or toll-free
      #
      # @see SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse#type
      module Type
        extend SurgeAPI::Internal::Type::Enum

        LOCAL = :local
        TOLL_FREE = :toll_free

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
