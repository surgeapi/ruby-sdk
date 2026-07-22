# typed: strong

module SurgeAPI
  module Models
    class CampaignResendBrandVerificationMessageParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            SurgeAPI::CampaignResendBrandVerificationMessageParams,
            SurgeAPI::Internal::AnyHash
          )
        end

      # The account whose brand verification OTP should be sent.
      sig { returns(String) }
      attr_accessor :account_id

      sig do
        params(
          account_id: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The account whose brand verification OTP should be sent.
        account_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { account_id: String, request_options: SurgeAPI::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
