# frozen_string_literal: true

module SurgeAPI
  module Resources
    class Campaigns
      # Some parameter documentations has been truncated, see
      # {SurgeAPI::Models::CampaignCreateParams} for more details.
      #
      # Creates a campaign to register account to send text messages.
      #
      # @overload create(account_id, params:, request_options: {})
      #
      # @param account_id [String] The account for which the campaign should be created.
      #
      # @param params [SurgeAPI::Models::CampaignCreateParams::Params::StandardCampaignParams, SurgeAPI::Models::CampaignCreateParams::Params::ExternalCampaignParams] Parameters for creating a new campaign. Either provide full campaign details or
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::Campaign]
      #
      # @see SurgeAPI::Models::CampaignCreateParams
      def create(account_id, params)
        parsed, options = SurgeAPI::CampaignCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["accounts/%1$s/campaigns", account_id],
          body: parsed[:params],
          model: SurgeAPI::Campaign,
          options: options
        )
      end

      # @api private
      #
      # @param client [SurgeAPI::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
