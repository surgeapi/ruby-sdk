# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Users#create_token
    class UserCreateTokenParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute user_id
      #   The user for which the token represents authentication.
      #
      #   @return [String]
      required :user_id, String

      # @!attribute duration_seconds
      #   For how many seconds the token should be accepted. Defaults to 15 minutes.
      #
      #   @return [Integer, nil]
      optional :duration_seconds, Integer

      # @!method initialize(user_id:, duration_seconds: nil, request_options: {})
      #   @param user_id [String] The user for which the token represents authentication.
      #
      #   @param duration_seconds [Integer] For how many seconds the token should be accepted. Defaults to 15 minutes.
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
