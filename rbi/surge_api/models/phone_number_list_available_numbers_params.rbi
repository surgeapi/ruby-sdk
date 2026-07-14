# typed: strong

module SurgeAPI
  module Models
    class PhoneNumberListAvailableNumbersParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            SurgeAPI::PhoneNumberListAvailableNumbersParams,
            SurgeAPI::Internal::AnyHash
          )
        end

      # The account ID to list available phone numbers for.
      sig { returns(String) }
      attr_accessor :account_id

      # Whether to search for local or toll-free numbers.
      sig do
        returns(SurgeAPI::PhoneNumberListAvailableNumbersParams::Type::OrSymbol)
      end
      attr_accessor :type

      # Cursor for forward pagination. Use the next_cursor from a previous response.
      sig { returns(T.nilable(String)) }
      attr_reader :after

      sig { params(after: String).void }
      attr_writer :after

      # Filter by 3-digit area code.
      sig { returns(T.nilable(String)) }
      attr_reader :area_code

      sig { params(area_code: String).void }
      attr_writer :area_code

      # Cursor for backward pagination. Use the previous_cursor from a previous
      # response.
      sig { returns(T.nilable(String)) }
      attr_reader :before

      sig { params(before: String).void }
      attr_writer :before

      # ISO country code to search in.
      sig do
        returns(
          T.nilable(
            SurgeAPI::PhoneNumberListAvailableNumbersParams::Country::OrSymbol
          )
        )
      end
      attr_reader :country

      sig do
        params(
          country:
            SurgeAPI::PhoneNumberListAvailableNumbersParams::Country::OrSymbol
        ).void
      end
      attr_writer :country

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
        ).returns(T.attached_class)
      end
      def self.new(
        # The account ID to list available phone numbers for.
        account_id:,
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

      sig do
        override.returns(
          {
            account_id: String,
            type:
              SurgeAPI::PhoneNumberListAvailableNumbersParams::Type::OrSymbol,
            after: String,
            area_code: String,
            before: String,
            country:
              SurgeAPI::PhoneNumberListAvailableNumbersParams::Country::OrSymbol,
            request_options: SurgeAPI::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Whether to search for local or toll-free numbers.
      module Type
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, SurgeAPI::PhoneNumberListAvailableNumbersParams::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LOCAL =
          T.let(
            :local,
            SurgeAPI::PhoneNumberListAvailableNumbersParams::Type::TaggedSymbol
          )
        TOLL_FREE =
          T.let(
            :toll_free,
            SurgeAPI::PhoneNumberListAvailableNumbersParams::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              SurgeAPI::PhoneNumberListAvailableNumbersParams::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # ISO country code to search in.
      module Country
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              SurgeAPI::PhoneNumberListAvailableNumbersParams::Country
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        US =
          T.let(
            :US,
            SurgeAPI::PhoneNumberListAvailableNumbersParams::Country::TaggedSymbol
          )
        CA =
          T.let(
            :CA,
            SurgeAPI::PhoneNumberListAvailableNumbersParams::Country::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              SurgeAPI::PhoneNumberListAvailableNumbersParams::Country::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
