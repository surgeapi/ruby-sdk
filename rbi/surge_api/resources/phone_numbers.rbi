# typed: strong

module SurgeAPI
  module Resources
    class PhoneNumbers
      # Purchase a new phone number for the account. You can specify search criteria or
      # let the system select a random number.
      sig do
        params(
          account_id: String,
          area_code: String,
          latitude: Float,
          longitude: Float,
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
        # Whether the phone number is local or toll-free. Can be omitted if area_code or
        # latitude/longitude are provided.
        type: nil,
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
