# frozen_string_literal: true

module SurgeAPI
  module Resources
    class Verifications
      # Creates a new Verification and sends the code to the given phone number.
      #
      # @overload create(phone_number:, request_options: {})
      #
      # @param phone_number [String] The phone number to be verified. In E.164 format.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::Verification]
      #
      # @see SurgeAPI::Models::VerificationCreateParams
      def create(params)
        parsed, options = SurgeAPI::VerificationCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "verifications",
          body: parsed,
          model: SurgeAPI::Verification,
          options: options
        )
      end

      # Checks the code against a verification.
      #
      # @overload check(id, code:, request_options: {})
      #
      # @param id [String] The ID of the verification to check against.
      #
      # @param code [String] The Verification code that was received.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::VerificationCheck]
      #
      # @see SurgeAPI::Models::VerificationCheckParams
      def check(id, params)
        parsed, options = SurgeAPI::VerificationCheckParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["verifications/%1$s/checks", id],
          body: parsed,
          model: SurgeAPI::VerificationCheck,
          options: options
        )
      end

      # @api private
      #
      # @param client [SurgeAPI::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
