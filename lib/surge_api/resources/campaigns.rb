# frozen_string_literal: true

module SurgeAPI
  module Resources
    class Campaigns
      # Some parameter documentations has been truncated, see
      # {SurgeAPI::Models::CampaignCreateParams} for more details.
      #
      # Creates a campaign to register account to send text messages.
      #
      # @overload create(account_id, campaign_params:, request_options: {})
      #
      # @param account_id [String] The account for which the campaign should be created.
      #
      # @param campaign_params [SurgeAPI::CampaignParams] Parameters for creating a new campaign. Either provide full campaign details or
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::Campaign]
      #
      # @see SurgeAPI::Models::CampaignCreateParams
      def create(account_id, params)
        parsed, options = SurgeAPI::CampaignCreateParams.dump_request(params)
        case parsed
        in {campaign_params: Hash => union, **rest}
          parsed = {**rest, **union}
        else
        end
        @client.request(
          method: :post,
          path: ["accounts/%1$s/campaigns", account_id],
          body: parsed,
          model: SurgeAPI::Campaign,
          options: options
        )
      end

      # Retrieves a Campaign object.
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] The ID of the campaign to retrieve.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::Campaign]
      #
      # @see SurgeAPI::Models::CampaignRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["campaigns/%1$s", id],
          model: SurgeAPI::Campaign,
          options: params[:request_options]
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
