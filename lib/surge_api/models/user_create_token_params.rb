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

      # @!attribute read_only
      #   Restrict the token to viewing embedded conversations and unread counts. Sending
      #   messages, changing read state, editing contacts, and calling are disabled.
      #   Defaults to false. Preserve this value when refreshing the token; changing
      #   access mode requires reloading the embed.
      #
      #   @return [Boolean, nil]
      optional :read_only, SurgeAPI::Internal::Type::Boolean

      # @!method initialize(user_id:, duration_seconds: nil, read_only: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {SurgeAPI::Models::UserCreateTokenParams} for more details.
      #
      #   @param user_id [String] The user for which the token represents authentication.
      #
      #   @param duration_seconds [Integer] For how many seconds the token should be accepted. Defaults to 15 minutes.
      #
      #   @param read_only [Boolean] Restrict the token to viewing embedded conversations and unread counts. Sending
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
