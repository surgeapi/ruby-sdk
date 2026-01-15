# frozen_string_literal: true

module SurgeAPI
  module Resources
    class Users
      # Creates a new User object.
      #
      # @overload create(account_id, first_name:, last_name: nil, metadata: nil, photo_url: nil, request_options: {})
      #
      # @param account_id [String] The account for which the user should be created.
      #
      # @param first_name [String] The user's first name.
      #
      # @param last_name [String] The user's last name.
      #
      # @param metadata [Hash{Symbol=>String}] Set of key-value pairs that will be stored with the object.
      #
      # @param photo_url [String] URL of a photo to be used as the user's avatar.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::User]
      #
      # @see SurgeAPI::Models::UserCreateParams
      def create(account_id, params)
        parsed, options = SurgeAPI::UserCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["accounts/%1$s/users", account_id],
          body: parsed,
          model: SurgeAPI::User,
          options: options
        )
      end

      # Retrieves a User object.
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] The ID of the user to retrieve.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::User]
      #
      # @see SurgeAPI::Models::UserRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["users/%1$s", id],
          model: SurgeAPI::User,
          options: params[:request_options]
        )
      end

      # Updates an existing User object.
      #
      # @overload update(id, first_name:, last_name: nil, metadata: nil, photo_url: nil, request_options: {})
      #
      # @param id [String] The ID of the user to update.
      #
      # @param first_name [String] The user's first name.
      #
      # @param last_name [String] The user's last name.
      #
      # @param metadata [Hash{Symbol=>String}] Set of key-value pairs that will be stored with the object.
      #
      # @param photo_url [String] URL of a photo to be used as the user's avatar.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::User]
      #
      # @see SurgeAPI::Models::UserUpdateParams
      def update(id, params)
        parsed, options = SurgeAPI::UserUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["users/%1$s", id],
          body: parsed,
          model: SurgeAPI::User,
          options: options
        )
      end

      # Deletes a user.
      #
      # Once a user has been deleted, they will no longer be permitted to access any of
      # the embedded components. Attempting to access a deleted user will return a 404
      # Not Found error.
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] The ID of the user to delete.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::User]
      #
      # @see SurgeAPI::Models::UserDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["users/%1$s", id],
          model: SurgeAPI::User,
          options: params[:request_options]
        )
      end

      # Provides a mechanism for having Surge create a signed token for embeds instead
      # of signing with your own signing key.
      #
      # @overload create_token(user_id, duration_seconds: nil, request_options: {})
      #
      # @param user_id [String] The user for which the token represents authentication.
      #
      # @param duration_seconds [Integer] For how many seconds the token should be accepted. Defaults to 15 minutes.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::UserTokenResponse]
      #
      # @see SurgeAPI::Models::UserCreateTokenParams
      def create_token(user_id, params = {})
        parsed, options = SurgeAPI::UserCreateTokenParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["users/%1$s/tokens", user_id],
          body: parsed,
          model: SurgeAPI::UserTokenResponse,
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
