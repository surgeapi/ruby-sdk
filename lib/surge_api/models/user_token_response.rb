# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Users#create_token
    class UserTokenResponse < SurgeAPI::Internal::Type::BaseModel
      # @!attribute token
      #   The created token.
      #
      #   @return [String, nil]
      optional :token, String

      # @!method initialize(token: nil)
      #   Response when token has been created successfully
      #
      #   @param token [String] The created token.
    end
  end
end
