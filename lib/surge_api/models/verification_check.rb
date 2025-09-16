# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Verifications#check
    class VerificationCheck < SurgeAPI::Internal::Type::BaseModel
      # @!attribute result
      #   The result of the code check.
      #
      #   @return [Symbol, SurgeAPI::Models::VerificationCheck::Result, nil]
      optional :result, enum: -> { SurgeAPI::VerificationCheck::Result }

      # @!attribute verification
      #   A phone number verification
      #
      #   @return [SurgeAPI::Models::Verification, nil]
      optional :verification, -> { SurgeAPI::Verification }

      # @!method initialize(result: nil, verification: nil)
      #   The result of checking a Verification code
      #
      #   @param result [Symbol, SurgeAPI::Models::VerificationCheck::Result] The result of the code check.
      #
      #   @param verification [SurgeAPI::Models::Verification] A phone number verification

      # The result of the code check.
      #
      # @see SurgeAPI::Models::VerificationCheck#result
      module Result
        extend SurgeAPI::Internal::Type::Enum

        OK = :ok
        INCORRECT = :incorrect
        EXHAUSTED = :exhausted
        EXPIRED = :expired
        ALREADY_VERIFIED = :already_verified

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
