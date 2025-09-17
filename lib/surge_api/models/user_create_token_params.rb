# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Users#create_token
    class UserCreateTokenParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute duration_seconds
      #   For how many seconds the token should be accepted. Defaults to 15 minutes.
      #
      #   @return [Integer, nil]
      optional :duration_seconds, Integer

      # @!method initialize(duration_seconds: nil, request_options: {})
      #   @param duration_seconds [Integer] For how many seconds the token should be accepted. Defaults to 15 minutes.
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
