# typed: strong

module SurgeAPI
  module Models
    class TollFreeCampaignRetrieveParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            SurgeAPI::TollFreeCampaignRetrieveParams,
            SurgeAPI::Internal::AnyHash
          )
        end

      # The ID of the toll-free campaign to retrieve.
      sig { returns(String) }
      attr_accessor :campaign_id

      sig do
        params(
          campaign_id: String,
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The ID of the toll-free campaign to retrieve.
        campaign_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { campaign_id: String, request_options: SurgeAPI::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
