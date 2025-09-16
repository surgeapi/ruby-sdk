# typed: strong

module Surge
  module Resources
    class Users
      # Creates a new User object.
      sig do
        params(
          account_id: String,
          first_name: String,
          last_name: String,
          metadata: T::Hash[Symbol, String],
          photo_url: String,
          request_options: Surge::RequestOptions::OrHash
        ).returns(Surge::User)
      end
      def create(
        # The account for which the user should be created.
        account_id,
        # The user's first name.
        first_name:,
        # The user's last name.
        last_name: nil,
        # Set of key-value pairs that will be stored with the object.
        metadata: nil,
        # URL of a photo to be used as the user's avatar.
        photo_url: nil,
        request_options: {}
      )
      end

      # Retrieves a User object.
      sig do
        params(
          id: String,
          request_options: Surge::RequestOptions::OrHash
        ).returns(Surge::User)
      end
      def retrieve(
        # The ID of the user to retrieve.
        id,
        request_options: {}
      )
      end

      # Updates an existing User object.
      sig do
        params(
          id: String,
          first_name: String,
          last_name: String,
          metadata: T::Hash[Symbol, String],
          photo_url: String,
          request_options: Surge::RequestOptions::OrHash
        ).returns(Surge::User)
      end
      def update(
        # The ID of the user to update.
        id,
        # The user's first name.
        first_name:,
        # The user's last name.
        last_name: nil,
        # Set of key-value pairs that will be stored with the object.
        metadata: nil,
        # URL of a photo to be used as the user's avatar.
        photo_url: nil,
        request_options: {}
      )
      end

      # Provides a mechanism for having Surge create a signed token for embeds instead
      # of signing with your own signing key.
      sig do
        params(
          user_id: String,
          duration_seconds: Integer,
          request_options: Surge::RequestOptions::OrHash
        ).returns(Surge::UserTokenResponse)
      end
      def create_token(
        # The user for which the token represents authentication.
        user_id,
        # For how many seconds the token should be accepted. Defaults to 15 minutes.
        duration_seconds: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Surge::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
