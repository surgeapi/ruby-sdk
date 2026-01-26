# typed: strong

module SurgeAPI
  module Models
    class PhoneNumber < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SurgeAPI::PhoneNumber, SurgeAPI::Internal::AnyHash)
        end

      # Unique identifier for the phone number
      sig { returns(String) }
      attr_accessor :id

      # The phone number in E.164 format
      sig { returns(String) }
      attr_accessor :number

      # Whether the phone number is local, toll-free, or short code
      sig { returns(SurgeAPI::PhoneNumber::Type::TaggedSymbol) }
      attr_accessor :type

      # A phone number that can be used to send and receive messages and calls
      sig do
        params(
          id: String,
          number: String,
          type: SurgeAPI::PhoneNumber::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the phone number
        id:,
        # The phone number in E.164 format
        number:,
        # Whether the phone number is local, toll-free, or short code
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            number: String,
            type: SurgeAPI::PhoneNumber::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # Whether the phone number is local, toll-free, or short code
      module Type
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, SurgeAPI::PhoneNumber::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LOCAL = T.let(:local, SurgeAPI::PhoneNumber::Type::TaggedSymbol)
        SHORT_CODE =
          T.let(:short_code, SurgeAPI::PhoneNumber::Type::TaggedSymbol)
        TOLL_FREE = T.let(:toll_free, SurgeAPI::PhoneNumber::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[SurgeAPI::PhoneNumber::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
