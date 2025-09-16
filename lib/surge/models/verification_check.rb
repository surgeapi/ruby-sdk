# frozen_string_literal: true

module Surge
  module Models
    # @see Surge::Resources::Verifications#check
    class VerificationCheck < Surge::Internal::Type::BaseModel
      # @!attribute result
      #   The result of the code check.
      #
      #   @return [Symbol, Surge::Models::VerificationCheck::Result, nil]
      optional :result, enum: -> { Surge::VerificationCheck::Result }

      # @!attribute verification
      #   A phone number verification
      #
      #   @return [Surge::Models::Verification, nil]
      optional :verification, -> { Surge::Verification }

      # @!method initialize(result: nil, verification: nil)
      #   The result of checking a Verification code
      #
      #   @param result [Symbol, Surge::Models::VerificationCheck::Result] The result of the code check.
      #
      #   @param verification [Surge::Models::Verification] A phone number verification

      # The result of the code check.
      #
      # @see Surge::Models::VerificationCheck#result
      module Result
        extend Surge::Internal::Type::Enum

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
