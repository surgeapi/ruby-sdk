# typed: strong

module SurgeAPI
  module Models
    class PhoneNumberListAvailableNumbersResponse < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse,
            SurgeAPI::Internal::AnyHash
          )
        end

      # ISO country code for the phone number
      sig do
        returns(
          SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse::Country::TaggedSymbol
        )
      end
      attr_accessor :country

      # The phone number in E.164 format
      sig { returns(String) }
      attr_accessor :number

      # Whether the phone number is local or toll-free
      sig do
        returns(
          SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse::Type::TaggedSymbol
        )
      end
      attr_accessor :type

      # A phone number available for purchase from Surge inventory
      sig do
        params(
          country:
            SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse::Country::OrSymbol,
          number: String,
          type:
            SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # ISO country code for the phone number
        country:,
        # The phone number in E.164 format
        number:,
        # Whether the phone number is local or toll-free
        type:
      )
      end

      sig do
        override.returns(
          {
            country:
              SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse::Country::TaggedSymbol,
            number: String,
            type:
              SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # ISO country code for the phone number
      module Country
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse::Country
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        US =
          T.let(
            :US,
            SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse::Country::TaggedSymbol
          )
        CA =
          T.let(
            :CA,
            SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse::Country::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse::Country::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Whether the phone number is local or toll-free
      module Type
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse::Type
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LOCAL =
          T.let(
            :local,
            SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse::Type::TaggedSymbol
          )
        TOLL_FREE =
          T.let(
            :toll_free,
            SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              SurgeAPI::Models::PhoneNumberListAvailableNumbersResponse::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
