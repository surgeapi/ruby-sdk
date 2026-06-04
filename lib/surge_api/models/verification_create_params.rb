# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Verifications#create
    class VerificationCreateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The account to associate with the verification.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute phone_number
      #   The phone number to be verified. In E.164 format.
      #
      #   @return [String]
      required :phone_number, String

      # @!method initialize(account_id:, phone_number:, request_options: {})
      #   @param account_id [String] The account to associate with the verification.
      #
      #   @param phone_number [String] The phone number to be verified. In E.164 format.
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
