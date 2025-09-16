# frozen_string_literal: true

module SurgeAPI
  module Resources
    class PhoneNumbers
      # Some parameter documentations has been truncated, see
      # {SurgeAPI::Models::PhoneNumberPurchaseParams} for more details.
      #
      # Purchase a new phone number for the account. You can specify search criteria or
      # let the system select a random number.
      #
      # @overload purchase(account_id, area_code: nil, latitude: nil, longitude: nil, type: nil, request_options: {})
      #
      # @param account_id [String] The account for which the phone number should be created.
      #
      # @param area_code [String] The desired area code for this phone number. If provided without type, the type
      #
      # @param latitude [Float] Latitude to search for nearby phone numbers. Must be used with longitude. If pro
      #
      # @param longitude [Float] Longitude to search for nearby phone numbers. Must be used with latitude. If pro
      #
      # @param type [Symbol, SurgeAPI::Models::PhoneNumberPurchaseParams::Type] Whether the phone number is local or toll-free. Can be omitted if area_code or l
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::PhoneNumber]
      #
      # @see SurgeAPI::Models::PhoneNumberPurchaseParams
      def purchase(account_id, params = {})
        parsed, options = SurgeAPI::PhoneNumberPurchaseParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["accounts/%1$s/phone_numbers", account_id],
          body: parsed,
          model: SurgeAPI::PhoneNumber,
          options: options
        )
      end

      # @api private
      #
      # @param client [SurgeAPI::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
