# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Campaigns#create
    class CampaignCreateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute campaign_params
      #   Parameters for creating a new campaign. Either provide full campaign details or
      #   import using a TCR ID.
      #
      #   @return [SurgeAPI::Models::CampaignParams::StandardCampaignParams, SurgeAPI::Models::CampaignParams::ExternalCampaignParams]
      required :campaign_params, union: -> { SurgeAPI::CampaignParams }

      # @!method initialize(campaign_params:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {SurgeAPI::Models::CampaignCreateParams} for more details.
      #
      #   @param campaign_params [SurgeAPI::Models::CampaignParams::StandardCampaignParams, SurgeAPI::Models::CampaignParams::ExternalCampaignParams] Parameters for creating a new campaign. Either provide full campaign details or
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
