# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::TollFreeCampaigns#create
    class TollFreeCampaignCreateParams < SurgeAPI::Models::TollFreeCampaignParams
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The account for which the toll-free campaign should be created.
      #
      #   @return [String]
      required :account_id, String

      # @!method initialize(account_id:, request_options: {})
      #   @param account_id [String] The account for which the toll-free campaign should be created.
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
