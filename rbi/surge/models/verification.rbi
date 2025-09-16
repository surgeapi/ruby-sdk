# typed: strong

module Surge
  module Models
    class Verification < Surge::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Surge::Verification, Surge::Internal::AnyHash) }

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
      sig { returns(Surge::Verification::Status::TaggedSymbol) }
      attr_accessor :status

      # A phone number verification
      sig do
        params(
          id: String,
          attempt_count: Integer,
          phone_number: String,
          status: Surge::Verification::Status::OrSymbol
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
            status: Surge::Verification::Status::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # The current status of the verification.
      module Status
        extend Surge::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Surge::Verification::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PENDING = T.let(:pending, Surge::Verification::Status::TaggedSymbol)
        VERIFIED = T.let(:verified, Surge::Verification::Status::TaggedSymbol)
        EXHAUSTED = T.let(:exhausted, Surge::Verification::Status::TaggedSymbol)
        EXPIRED = T.let(:expired, Surge::Verification::Status::TaggedSymbol)

        sig do
          override.returns(T::Array[Surge::Verification::Status::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
