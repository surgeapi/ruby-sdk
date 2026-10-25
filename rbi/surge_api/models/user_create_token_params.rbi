# typed: strong

module SurgeAPI
  module Models
    class UserCreateTokenParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SurgeAPI::UserCreateTokenParams, SurgeAPI::Internal::AnyHash)
        end

      # The user for which the token represents authentication.
      sig { returns(String) }
      attr_accessor :user_id

      # For how many seconds the token should be accepted. Defaults to 15 minutes.
      sig { returns(T.nilable(Integer)) }
      attr_reader :duration_seconds

      sig { params(duration_seconds: Integer).void }
      attr_writer :duration_seconds

      # Restrict the token to viewing embedded conversations and unread counts. Sending
      # messages, changing read state, editing contacts, and calling are disabled.
      # Defaults to false. Preserve this value when refreshing the token; changing
      # access mode requires reloading the embed.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :read_only

      sig { params(read_only: T::Boolean).void }
      attr_writer :read_only

      sig do
        params(
          user_id: String,
          duration_seconds: Integer,
          read_only: T::Boolean,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The user for which the token represents authentication.
        user_id:,
        # For how many seconds the token should be accepted. Defaults to 15 minutes.
        duration_seconds: nil,
        # Restrict the token to viewing embedded conversations and unread counts. Sending
        # messages, changing read state, editing contacts, and calling are disabled.
        # Defaults to false. Preserve this value when refreshing the token; changing
        # access mode requires reloading the embed.
        read_only: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            user_id: String,
            duration_seconds: Integer,
            read_only: T::Boolean,
            request_options: SurgeAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
