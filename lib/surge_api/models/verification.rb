# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Verifications#create
    class Verification < SurgeAPI::Internal::Type::BaseModel
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
      #   @return [Symbol, SurgeAPI::Models::Verification::Status]
      required :status, enum: -> { SurgeAPI::Verification::Status }

      # @!method initialize(id:, attempt_count:, phone_number:, status:)
      #   A phone number verification
      #
      #   @param id [String] Unique identifier for the object.
      #
      #   @param attempt_count [Integer] The number of times the code has been attempted.
      #
      #   @param phone_number [String] The phone number being verified. In E.164 format.
      #
      #   @param status [Symbol, SurgeAPI::Models::Verification::Status] The current status of the verification.

      # The current status of the verification.
      #
      # @see SurgeAPI::Models::Verification#status
      module Status
        extend SurgeAPI::Internal::Type::Enum

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
