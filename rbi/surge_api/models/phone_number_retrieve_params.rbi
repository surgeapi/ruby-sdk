# typed: strong

module SurgeAPI
  module Models
    class PhoneNumberRetrieveParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            SurgeAPI::PhoneNumberRetrieveParams,
            SurgeAPI::Internal::AnyHash
          )
        end

      # The ID of the phone number to retrieve.
      sig { returns(String) }
      attr_accessor :id

      sig do
        params(
          id: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The ID of the phone number to retrieve.
        id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { id: String, request_options: SurgeAPI::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
