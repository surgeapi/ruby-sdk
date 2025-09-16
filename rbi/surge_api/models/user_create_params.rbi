# typed: strong

module SurgeAPI
  module Models
    class UserCreateParams < SurgeAPI::Models::UserParams
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SurgeAPI::UserCreateParams, SurgeAPI::Internal::AnyHash)
        end

      sig do
        params(request_options: SurgeAPI::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig { override.returns({ request_options: SurgeAPI::RequestOptions }) }
      def to_hash
      end
    end
  end
end
