# typed: strong

module SurgeAPI
  module Models
    class AudienceCreateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SurgeAPI::AudienceCreateParams, SurgeAPI::Internal::AnyHash)
        end

      # The audience name.
      sig { returns(String) }
      attr_accessor :name

      sig do
        params(
          name: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The audience name.
        name:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { name: String, request_options: SurgeAPI::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
