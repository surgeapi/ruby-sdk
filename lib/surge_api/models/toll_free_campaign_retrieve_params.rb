# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::TollFreeCampaigns#retrieve
    class TollFreeCampaignRetrieveParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute campaign_id
      #   The ID of the toll-free campaign to retrieve.
      #
      #   @return [String]
      required :campaign_id, String

      # @!method initialize(campaign_id:, request_options: {})
      #   @param campaign_id [String] The ID of the toll-free campaign to retrieve.
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
