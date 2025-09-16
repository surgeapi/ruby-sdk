# typed: strong

module Surge
  module Models
    class VerificationCheck < Surge::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Surge::VerificationCheck, Surge::Internal::AnyHash)
        end

      # The result of the code check.
      sig { returns(T.nilable(Surge::VerificationCheck::Result::TaggedSymbol)) }
      attr_reader :result

      sig { params(result: Surge::VerificationCheck::Result::OrSymbol).void }
      attr_writer :result

      # A phone number verification
      sig { returns(T.nilable(Surge::Verification)) }
      attr_reader :verification

      sig { params(verification: Surge::Verification::OrHash).void }
      attr_writer :verification

      # The result of checking a Verification code
      sig do
        params(
          result: Surge::VerificationCheck::Result::OrSymbol,
          verification: Surge::Verification::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The result of the code check.
        result: nil,
        # A phone number verification
        verification: nil
      )
      end

      sig do
        override.returns(
          {
            result: Surge::VerificationCheck::Result::TaggedSymbol,
            verification: Surge::Verification
          }
        )
      end
      def to_hash
      end

      # The result of the code check.
      module Result
        extend Surge::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Surge::VerificationCheck::Result) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OK = T.let(:ok, Surge::VerificationCheck::Result::TaggedSymbol)
        INCORRECT =
          T.let(:incorrect, Surge::VerificationCheck::Result::TaggedSymbol)
        EXHAUSTED =
          T.let(:exhausted, Surge::VerificationCheck::Result::TaggedSymbol)
        EXPIRED =
          T.let(:expired, Surge::VerificationCheck::Result::TaggedSymbol)
        ALREADY_VERIFIED =
          T.let(
            :already_verified,
            Surge::VerificationCheck::Result::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Surge::VerificationCheck::Result::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
