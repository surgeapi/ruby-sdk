# typed: strong

module Surge
  module Resources
    class Verifications
      # Creates a new Verification and sends the code to the given phone number.
      sig do
        params(
          phone_number: String,
          request_options: Surge::RequestOptions::OrHash
        ).returns(Surge::Verification)
      end
      def create(
        # The phone number to be verified. In E.164 format.
        phone_number:,
        request_options: {}
      )
      end

      # Checks the code against a verification.
      sig do
        params(
          id: String,
          code: String,
          request_options: Surge::RequestOptions::OrHash
        ).returns(Surge::VerificationCheck)
      end
      def check(
        # The ID of the verification to check against.
        id,
        # The Verification code that was received.
        code:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Surge::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
