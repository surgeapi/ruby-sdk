# typed: strong

module SurgeAPI
  module Resources
    class PhoneNumbers
      # Retrieves a PhoneNumber object.
      sig do
        params(
          id: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::PhoneNumber)
      end
      def retrieve(
        # The ID of the phone number to retrieve.
        id,
        request_options: {}
      )
      end

      # Updates a phone number's details.
      sig do
        params(
          id: String,
          campaign_id: String,
          name: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::PhoneNumber)
      end
      def update(
        # The ID of the phone number to update.
        id,
        # Campaign ID to attach this number to (`cpn_...`).
        campaign_id: nil,
        # A human-readable name for the phone number.
        name: nil,
        request_options: {}
      )
      end

      # List all phone numbers for an account with cursor-based pagination.
      sig do
        params(
          account_id: String,
          after: String,
          before: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::Internal::Cursor[SurgeAPI::PhoneNumber])
      end
      def list(
        # The account ID to list phone numbers for.
        account_id,
        # Cursor for forward pagination. Use the next_cursor from a previous response.
        after: nil,
        # Cursor for backward pagination. Use the previous_cursor from a previous
        # response.
        before: nil,
        request_options: {}
      )
      end

      # Browse purchasable phone numbers from Surge inventory before buying.
      #
      # Pagination cursors are always null for now.
      sig do
        params(
          account_id: String,
          type: SurgeAPI::PhoneNumberListAvailableNumbersParams::Type::OrSymbol,
          after: String,
          area_code: String,
          before: String,
          country:
            SurgeAPI::PhoneNumberListAvailableNumbersParams::Country::OrSymbol,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(
          SurgeAPI::Internal::Cursor[
            SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse
          ]
        )
      end
      def list_available_numbers(
        # The account ID to list available phone numbers for.
        account_id,
        # Whether to search for local or toll-free numbers.
        type:,
        # Cursor for forward pagination. Use the next_cursor from a previous response.
        after: nil,
        # Filter by 3-digit area code.
        area_code: nil,
        # Cursor for backward pagination. Use the previous_cursor from a previous
        # response.
        before: nil,
        # ISO country code to search in.
        country: nil,
        request_options: {}
      )
      end

      # Purchase a new phone number for the account. You can specify search criteria or
      # let the system select a random number.
      sig do
        params(
          account_id: String,
          area_code: String,
          latitude: Float,
          longitude: Float,
          name: String,
          type: SurgeAPI::PhoneNumberPurchaseParams::Type::OrSymbol,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::PhoneNumber)
      end
      def purchase(
        # The account for which the phone number should be created.
        account_id,
        # The desired area code for this phone number. If provided without type, the type
        # will be inferred.
        area_code: nil,
        # Latitude to search for nearby phone numbers. Must be used with longitude. If
        # provided without type, type will be inferred as 'local'.
        latitude: nil,
        # Longitude to search for nearby phone numbers. Must be used with latitude. If
        # provided without type, type will be inferred as 'local'.
        longitude: nil,
        # A human-readable name for the phone number. If not provided, defaults to the
        # formatted phone number.
        name: nil,
        # Whether the phone number is local or toll-free. Can be omitted if area_code or
        # latitude/longitude are provided.
        type: nil,
        request_options: {}
      )
      end

      # Releases a phone number from the account.
      sig do
        params(
          id: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::PhoneNumber)
      end
      def release(
        # The ID of the phone number to release.
        id,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: SurgeAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
