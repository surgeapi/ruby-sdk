# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::PhoneNumbers#purchase
    class PhoneNumberPurchaseParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute area_code
      #   The desired area code for this phone number. If provided without type, the type
      #   will be inferred.
      #
      #   @return [String, nil]
      optional :area_code, String

      # @!attribute latitude
      #   Latitude to search for nearby phone numbers. Must be used with longitude. If
      #   provided without type, type will be inferred as 'local'.
      #
      #   @return [Float, nil]
      optional :latitude, Float

      # @!attribute longitude
      #   Longitude to search for nearby phone numbers. Must be used with latitude. If
      #   provided without type, type will be inferred as 'local'.
      #
      #   @return [Float, nil]
      optional :longitude, Float

      # @!attribute type
      #   Whether the phone number is local or toll-free. Can be omitted if area_code or
      #   latitude/longitude are provided.
      #
      #   @return [Symbol, SurgeAPI::Models::PhoneNumberPurchaseParams::Type, nil]
      optional :type, enum: -> { SurgeAPI::PhoneNumberPurchaseParams::Type }

      # @!method initialize(area_code: nil, latitude: nil, longitude: nil, type: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {SurgeAPI::Models::PhoneNumberPurchaseParams} for more details.
      #
      #   @param area_code [String] The desired area code for this phone number. If provided without type, the type
      #
      #   @param latitude [Float] Latitude to search for nearby phone numbers. Must be used with longitude. If pro
      #
      #   @param longitude [Float] Longitude to search for nearby phone numbers. Must be used with latitude. If pro
      #
      #   @param type [Symbol, SurgeAPI::Models::PhoneNumberPurchaseParams::Type] Whether the phone number is local or toll-free. Can be omitted if area_code or l
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]

      # Whether the phone number is local or toll-free. Can be omitted if area_code or
      # latitude/longitude are provided.
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
