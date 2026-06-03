# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Verifications#check
    class VerificationCheckParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute id
      #   The ID of the verification to check against.
      #
      #   @return [String]
      required :id, String

      # @!attribute code
      #   The Verification code that was received.
      #
      #   @return [String]
      required :code, String

      # @!method initialize(id:, code:, request_options: {})
      #   @param id [String] The ID of the verification to check against.
      #
      #   @param code [String] The Verification code that was received.
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
