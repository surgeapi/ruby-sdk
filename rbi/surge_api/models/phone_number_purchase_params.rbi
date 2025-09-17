# typed: strong

module SurgeAPI
  module Models
    class PhoneNumberPurchaseParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            SurgeAPI::PhoneNumberPurchaseParams,
            SurgeAPI::Internal::AnyHash
          )
        end

      # The desired area code for this phone number. If provided without type, the type
      # will be inferred.
      sig { returns(T.nilable(String)) }
      attr_reader :area_code

      sig { params(area_code: String).void }
      attr_writer :area_code

      # Latitude to search for nearby phone numbers. Must be used with longitude. If
      # provided without type, type will be inferred as 'local'.
      sig { returns(T.nilable(Float)) }
      attr_reader :latitude

      sig { params(latitude: Float).void }
      attr_writer :latitude

      # Longitude to search for nearby phone numbers. Must be used with latitude. If
      # provided without type, type will be inferred as 'local'.
      sig { returns(T.nilable(Float)) }
      attr_reader :longitude

      sig { params(longitude: Float).void }
      attr_writer :longitude

      # Whether the phone number is local or toll-free. Can be omitted if area_code or
      # latitude/longitude are provided.
      sig do
        returns(T.nilable(SurgeAPI::PhoneNumberPurchaseParams::Type::OrSymbol))
      end
      attr_reader :type

      sig do
        params(type: SurgeAPI::PhoneNumberPurchaseParams::Type::OrSymbol).void
      end
      attr_writer :type

      sig do
        params(
          area_code: String,
          latitude: Float,
          longitude: Float,
          type: SurgeAPI::PhoneNumberPurchaseParams::Type::OrSymbol,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
            area_code: String,
            latitude: Float,
            longitude: Float,
            type: SurgeAPI::PhoneNumberPurchaseParams::Type::OrSymbol,
            request_options: SurgeAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Whether the phone number is local or toll-free. Can be omitted if area_code or
      # latitude/longitude are provided.
      module Type
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, SurgeAPI::PhoneNumberPurchaseParams::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LOCAL =
          T.let(:local, SurgeAPI::PhoneNumberPurchaseParams::Type::TaggedSymbol)
        TOLL_FREE =
          T.let(
            :toll_free,
            SurgeAPI::PhoneNumberPurchaseParams::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[SurgeAPI::PhoneNumberPurchaseParams::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
