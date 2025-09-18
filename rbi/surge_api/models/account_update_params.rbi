# typed: strong

module SurgeAPI
  module Models
    class AccountUpdateParams < SurgeAPI::Models::AccountUpdateParams
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SurgeAPI::AccountUpdateParams, SurgeAPI::Internal::AnyHash)
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
