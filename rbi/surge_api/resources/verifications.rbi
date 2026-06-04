# typed: strong

module SurgeAPI
  module Resources
    class Verifications
      # Creates a new Verification for an account and sends the code to the given phone
      # number.
      sig do
        params(
          account_id: String,
          phone_number: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::Verification)
      end
      def create(
        # The account to associate with the verification.
        account_id,
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
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(SurgeAPI::VerificationCheck)
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
      sig { params(client: SurgeAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
