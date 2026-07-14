# frozen_string_literal: true

module SurgeAPI
  module Resources
    class PhoneNumbers
      # Retrieves a PhoneNumber object.
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] The ID of the phone number to retrieve.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::PhoneNumber]
      #
      # @see SurgeAPI::Models::PhoneNumberRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["phone_numbers/%1$s", id],
          model: SurgeAPI::PhoneNumber,
          options: params[:request_options]
        )
      end

      # Updates a phone number's details.
      #
      # @overload update(id, campaign_id: nil, name: nil, request_options: {})
      #
      # @param id [String] The ID of the phone number to update.
      #
      # @param campaign_id [String] Campaign ID to attach this number to (`cpn_...`).
      #
      # @param name [String] A human-readable name for the phone number.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::PhoneNumber]
      #
      # @see SurgeAPI::Models::PhoneNumberUpdateParams
      def update(id, params = {})
        parsed, options = SurgeAPI::PhoneNumberUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["phone_numbers/%1$s", id],
          body: parsed,
          model: SurgeAPI::PhoneNumber,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {SurgeAPI::Models::PhoneNumberListParams} for more details.
      #
      # List all phone numbers for an account with cursor-based pagination.
      #
      # @overload list(account_id, after: nil, before: nil, request_options: {})
      #
      # @param account_id [String] The account ID to list phone numbers for.
      #
      # @param after [String] Cursor for forward pagination. Use the next_cursor from a previous response.
      #
      # @param before [String] Cursor for backward pagination. Use the previous_cursor from a previous response
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Internal::Cursor<SurgeAPI::Models::PhoneNumber>]
      #
      # @see SurgeAPI::Models::PhoneNumberListParams
      def list(account_id, params = {})
        parsed, options = SurgeAPI::PhoneNumberListParams.dump_request(params)
        query = SurgeAPI::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["accounts/%1$s/phone_numbers", account_id],
          query: query,
          page: SurgeAPI::Internal::Cursor,
          model: SurgeAPI::PhoneNumber,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {SurgeAPI::Models::PhoneNumberListAvailableNumbersParams} for more details.
      #
      # Browse purchasable phone numbers from Surge inventory before buying.
      #
      # Pagination cursors are always null for now.
      #
      # @overload list_available_numbers(account_id, type:, after: nil, area_code: nil, before: nil, country: nil, request_options: {})
      #
      # @param account_id [String] The account ID to list available phone numbers for.
      #
      # @param type [Symbol, SurgeAPI::Models::PhoneNumberListAvailableNumbersParams::Type] Whether to search for local or toll-free numbers.
      #
      # @param after [String] Cursor for forward pagination. Use the next_cursor from a previous response.
      #
      # @param area_code [String] Filter by 3-digit area code.
      #
      # @param before [String] Cursor for backward pagination. Use the previous_cursor from a previous response
      #
      # @param country [Symbol, SurgeAPI::Models::PhoneNumberListAvailableNumbersParams::Country] ISO country code to search in.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Internal::Cursor<SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse>]
      #
      # @see SurgeAPI::Models::PhoneNumberListAvailableNumbersParams
      def list_available_numbers(account_id, params)
        parsed, options = SurgeAPI::PhoneNumberListAvailableNumbersParams.dump_request(params)
        query = SurgeAPI::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["accounts/%1$s/available_phone_numbers", account_id],
          query: query,
          page: SurgeAPI::Internal::Cursor,
          model: SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {SurgeAPI::Models::PhoneNumberPurchaseParams} for more details.
      #
      # Purchase a new phone number for the account. You can specify search criteria or
      # let the system select a random number.
      #
      # @overload purchase(account_id, area_code: nil, latitude: nil, longitude: nil, name: nil, type: nil, request_options: {})
      #
      # @param account_id [String] The account for which the phone number should be created.
      #
      # @param area_code [String] The desired area code for this phone number. If provided without type, the type
      #
      # @param latitude [Float] Latitude to search for nearby phone numbers. Must be used with longitude. If pro
      #
      # @param longitude [Float] Longitude to search for nearby phone numbers. Must be used with latitude. If pro
      #
      # @param name [String] A human-readable name for the phone number. If not provided, defaults to the for
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

      # Releases a phone number from the account.
      #
      # @overload release(id, request_options: {})
      #
      # @param id [String] The ID of the phone number to release.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::PhoneNumber]
      #
      # @see SurgeAPI::Models::PhoneNumberReleaseParams
      def release(id, params = {})
        @client.request(
          method: :delete,
          path: ["phone_numbers/%1$s", id],
          model: SurgeAPI::PhoneNumber,
          options: params[:request_options]
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
