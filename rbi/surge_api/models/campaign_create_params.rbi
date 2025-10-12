# typed: strong

module SurgeAPI
  module Models
    class CampaignCreateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SurgeAPI::CampaignCreateParams, SurgeAPI::Internal::AnyHash)
        end

      # Parameters for creating a new campaign. Either provide full campaign details or
      # import using a TCR ID.
      sig do
        returns(
          T.any(
            SurgeAPI::CampaignParams::StandardCampaignParams,
            SurgeAPI::CampaignParams::ExternalCampaignParams
          )
        )
      end
      attr_accessor :campaign_params

      sig do
        params(
          campaign_params:
            T.any(
              SurgeAPI::CampaignParams::StandardCampaignParams::OrHash,
              SurgeAPI::CampaignParams::ExternalCampaignParams::OrHash
            ),
          request_options: SurgeAPI::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Parameters for creating a new campaign. Either provide full campaign details or
        # import using a TCR ID.
        campaign_params:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            campaign_params:
              T.any(
                SurgeAPI::CampaignParams::StandardCampaignParams,
                SurgeAPI::CampaignParams::ExternalCampaignParams
              ),
            request_options: SurgeAPI::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
