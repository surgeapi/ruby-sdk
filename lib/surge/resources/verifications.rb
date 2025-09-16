# frozen_string_literal: true

module Surge
  module Resources
    class Verifications
      # Creates a new Verification and sends the code to the given phone number.
      #
      # @overload create(phone_number:, request_options: {})
      #
      # @param phone_number [String] The phone number to be verified. In E.164 format.
      #
      # @param request_options [Surge::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Surge::Models::Verification]
      #
      # @see Surge::Models::VerificationCreateParams
      def create(params)
        parsed, options = Surge::VerificationCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "verifications",
          body: parsed,
          model: Surge::Verification,
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
      # @param request_options [Surge::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Surge::Models::VerificationCheck]
      #
      # @see Surge::Models::VerificationCheckParams
      def check(id, params)
        parsed, options = Surge::VerificationCheckParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["verifications/%1$s/checks", id],
          body: parsed,
          model: Surge::VerificationCheck,
          options: options
        )
      end

      # @api private
      #
      # @param client [Surge::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
