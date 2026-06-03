# frozen_string_literal: true

module SurgeAPI
  module Models
    # @see SurgeAPI::Resources::Campaigns#create
    class CampaignCreateParams < SurgeAPI::Internal::Type::BaseModel
      extend SurgeAPI::Internal::Type::RequestParameters::Converter
      include SurgeAPI::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The account for which the campaign should be created.
      #
      #   @return [String]
      required :account_id, String

      # @!method initialize(account_id:, request_options: {})
      #   @param account_id [String] The account for which the campaign should be created.
      #
      #   @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
