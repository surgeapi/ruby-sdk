# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::PhoneNumbers#list_available_numbers
    class PhoneNumberListAvailableNumbersParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The account ID to list available phone numbers for.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute type
      #   Whether to search for local or toll-free numbers.
      #
      #   @return [Symbol, SurgeAPI::Models::PhoneNumberListAvailableNumbersParams::Type]
      required :type, enum: -> { SurgeAPI::PhoneNumberListAvailableNumbersParams::Type }

      # @!attribute after
      #   Cursor for forward pagination. Use the next_cursor from a previous response.
      #
      #   @return [String, nil]
      optional :after, String

      # @!attribute area_code
      #   Filter by 3-digit area code.
      #
      #   @return [String, nil]
      optional :area_code, String

      # @!attribute before
      #   Cursor for backward pagination. Use the previous_cursor from a previous
      #   response.
      #
      #   @return [String, nil]
      optional :before, String

      # @!attribute country
      #   ISO country code to search in.
      #
      #   @return [Symbol, SurgeAPI::Models::PhoneNumberListAvailableNumbersParams::Country, nil]
      optional :country, enum: -> { SurgeAPI::PhoneNumberListAvailableNumbersParams::Country }

      # @!method initialize(account_id:, type:, after: nil, area_code: nil, before: nil, country: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {SurgeAPI::Models::PhoneNumberListAvailableNumbersParams} for more details.
      #
      #   @param account_id [String] The account ID to list available phone numbers for.
      #
      #   @param type [Symbol, SurgeAPI::Models::PhoneNumberListAvailableNumbersParams::Type] Whether to search for local or toll-free numbers.
      #
      #   @param after [String] Cursor for forward pagination. Use the next_cursor from a previous response.
      #
      #   @param area_code [String] Filter by 3-digit area code.
      #
      #   @param before [String] Cursor for backward pagination. Use the previous_cursor from a previous response
      #
      #   @param country [Symbol, SurgeAPI::Models::PhoneNumberListAvailableNumbersParams::Country] ISO country code to search in.
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]

      # Whether to search for local or toll-free numbers.
      module Type
        extend SurgeAPI::Internal::Type::Enum

        LOCAL = :local
        TOLL_FREE = :toll_free

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # ISO country code to search in.
      module Country
        extend SurgeAPI::Internal::Type::Enum

        US = :US
        CA = :CA

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
