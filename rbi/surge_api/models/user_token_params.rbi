# typed: strong

module SurgeAPI
  module Models
    class UserTokenParams < SurgeAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SurgeAPI::UserTokenParams, SurgeAPI::Internal::AnyHash)
        end

      # For how many seconds the token should be accepted. Defaults to 15 minutes.
      sig { returns(T.nilable(Integer)) }
      attr_reader :duration_seconds

      sig { params(duration_seconds: Integer).void }
      attr_writer :duration_seconds

      # A request to create a token
      sig { params(duration_seconds: Integer).returns(T.attached_class) }
      def self.new(
        # For how many seconds the token should be accepted. Defaults to 15 minutes.
        duration_seconds: nil
      )
      end

      sig { override.returns({ duration_seconds: Integer }) }
      def to_hash
      end
    end
  end
end
