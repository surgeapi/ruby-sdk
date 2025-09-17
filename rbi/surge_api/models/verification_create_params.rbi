# typed: strong

module SurgeAPI
  module Models
    class VerificationCreateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SurgeAPI::VerificationCreateParams, SurgeAPI::Internal::AnyHash)
        end

      # The phone number to be verified. In E.164 format.
      sig { returns(String) }
      attr_accessor :phone_number

      sig do
        params(
          phone_number: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The phone number to be verified. In E.164 format.
        phone_number:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { phone_number: String, request_options: SurgeAPI::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
