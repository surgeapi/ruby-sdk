# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Verifications#check
    class VerificationCheckParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute code
      #   The Verification code that was received.
      #
      #   @return [String]
      required :code, String

      # @!method initialize(code:, request_options: {})
      #   @param code [String] The Verification code that was received.
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
