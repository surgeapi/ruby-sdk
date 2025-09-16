# frozen_string_literal: true

module Surge
  module Models
    class VerificationParams < Surge::Internal::Type::BaseModel
      # @!attribute phone_number
      #   The phone number to be verified. In E.164 format.
      #
      #   @return [String]
      required :phone_number, String

      # @!method initialize(phone_number:)
      #   Parameters for creating a Verification
      #
      #   @param phone_number [String] The phone number to be verified. In E.164 format.
    end
  end
end
