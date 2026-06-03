# typed: strong

module SurgeAPI
  module Models
    class VerificationCheckParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SurgeAPI::VerificationCheckParams, SurgeAPI::Internal::AnyHash)
        end

      # The ID of the verification to check against.
      sig { returns(String) }
      attr_accessor :id

      # The Verification code that was received.
      sig { returns(String) }
      attr_accessor :code

      sig do
        params(
          id: String,
          code: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The ID of the verification to check against.
        id:,
        # The Verification code that was received.
        code:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            code: String,
            request_options: SurgeAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
