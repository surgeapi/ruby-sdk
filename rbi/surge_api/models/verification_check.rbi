# typed: strong

module SurgeAPI
  module Models
    class VerificationCheck < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SurgeAPI::VerificationCheck, SurgeAPI::Internal::AnyHash)
        end

      # The result of the code check.
      sig do
        returns(T.nilable(SurgeAPI::VerificationCheck::Result::TaggedSymbol))
      end
      attr_reader :result

      sig { params(result: SurgeAPI::VerificationCheck::Result::OrSymbol).void }
      attr_writer :result

      # A phone number verification
      sig { returns(T.nilable(SurgeAPI::Verification)) }
      attr_reader :verification

      sig { params(verification: SurgeAPI::Verification::OrHash).void }
      attr_writer :verification

      # The result of checking a Verification code
      sig do
        params(
          result: SurgeAPI::VerificationCheck::Result::OrSymbol,
          verification: SurgeAPI::Verification::OrHash
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
            result: SurgeAPI::VerificationCheck::Result::TaggedSymbol,
            verification: SurgeAPI::Verification
          }
        )
      end
      def to_hash
      end

      # The result of the code check.
      module Result
        extend SurgeAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, SurgeAPI::VerificationCheck::Result) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OK = T.let(:ok, SurgeAPI::VerificationCheck::Result::TaggedSymbol)
        INCORRECT =
          T.let(:incorrect, SurgeAPI::VerificationCheck::Result::TaggedSymbol)
        EXHAUSTED =
          T.let(:exhausted, SurgeAPI::VerificationCheck::Result::TaggedSymbol)
        EXPIRED =
          T.let(:expired, SurgeAPI::VerificationCheck::Result::TaggedSymbol)
        ALREADY_VERIFIED =
          T.let(
            :already_verified,
            SurgeAPI::VerificationCheck::Result::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[SurgeAPI::VerificationCheck::Result::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
