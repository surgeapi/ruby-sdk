# frozen_string_literal: true

module Surge
  module Models
    # @see Surge::Resources::Verifications#create
    class Verification < Surge::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the object.
      #
      #   @return [String]
      required :id, String

      # @!attribute attempt_count
      #   The number of times the code has been attempted.
      #
      #   @return [Integer]
      required :attempt_count, Integer

      # @!attribute phone_number
      #   The phone number being verified. In E.164 format.
      #
      #   @return [String]
      required :phone_number, String

      # @!attribute status
      #   The current status of the verification.
      #
      #   @return [Symbol, Surge::Models::Verification::Status]
      required :status, enum: -> { Surge::Verification::Status }

      # @!method initialize(id:, attempt_count:, phone_number:, status:)
      #   A phone number verification
      #
      #   @param id [String] Unique identifier for the object.
      #
      #   @param attempt_count [Integer] The number of times the code has been attempted.
      #
      #   @param phone_number [String] The phone number being verified. In E.164 format.
      #
      #   @param status [Symbol, Surge::Models::Verification::Status] The current status of the verification.

      # The current status of the verification.
      #
      # @see Surge::Models::Verification#status
      module Status
        extend Surge::Internal::Type::Enum

        PENDING = :pending
        VERIFIED = :verified
        EXHAUSTED = :exhausted
        EXPIRED = :expired

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
