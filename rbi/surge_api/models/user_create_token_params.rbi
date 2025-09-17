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

      # For how many seconds the token should be accepted. Defaults to 15 minutes.
      sig { returns(T.nilable(Integer)) }
      attr_reader :duration_seconds

      sig { params(duration_seconds: Integer).void }
      attr_writer :duration_seconds

      sig do
        params(
          duration_seconds: Integer,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # For how many seconds the token should be accepted. Defaults to 15 minutes.
        duration_seconds: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            duration_seconds: Integer,
            request_options: SurgeAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
