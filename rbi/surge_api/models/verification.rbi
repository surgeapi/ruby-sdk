# typed: strong

module SurgeAPI
  module Models
    class Verification < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SurgeAPI::Verification, SurgeAPI::Internal::AnyHash)
        end

      # Unique identifier for the object.
      sig { returns(String) }
      attr_accessor :id

      # The number of times the code has been attempted.
      sig { returns(Integer) }
      attr_accessor :attempt_count

      # The phone number being verified. In E.164 format.
      sig { returns(String) }
      attr_accessor :phone_number

      # The current status of the verification.
      sig { returns(SurgeAPI::Verification::Status::TaggedSymbol) }
      attr_accessor :status

      # A phone number verification
      sig do
        params(
          id: String,
          attempt_count: Integer,
          phone_number: String,
          status: SurgeAPI::Verification::Status::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the object.
        id:,
        # The number of times the code has been attempted.
        attempt_count:,
        # The phone number being verified. In E.164 format.
        phone_number:,
        # The current status of the verification.
        status:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            attempt_count: Integer,
            phone_number: String,
            status: SurgeAPI::Verification::Status::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # The current status of the verification.
      module Status
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, SurgeAPI::Verification::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PENDING = T.let(:pending, SurgeAPI::Verification::Status::TaggedSymbol)
        VERIFIED =
          T.let(:verified, SurgeAPI::Verification::Status::TaggedSymbol)
        EXHAUSTED =
          T.let(:exhausted, SurgeAPI::Verification::Status::TaggedSymbol)
        EXPIRED = T.let(:expired, SurgeAPI::Verification::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[SurgeAPI::Verification::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
