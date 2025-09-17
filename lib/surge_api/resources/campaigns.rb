# frozen_string_literal: true

module SurgeAPI
  module Resources
    class Campaigns
      # Some parameter documentations has been truncated, see
      # {SurgeAPI::Models::CampaignCreateParams} for more details.
      #
      # Creates a campaign to register account to send text messages.
      #
      # @overload create(account_id, consent_flow:, description:, message_samples:, privacy_policy_url:, use_cases:, volume:, includes: nil, link_sample: nil, terms_and_conditions_url: nil, request_options: {})
      #
      # @param account_id [String] The account for which the campaign should be created.
      #
      # @param consent_flow [String] A string explaining the method through which end users will opt in to receive me
      #
      # @param description [String] An explanation of the organization's purpose and how it will be using text messa
      #
      # @param message_samples [Array<String>] An array of 2-5 strings with examples of the messages that will be sent from thi
      #
      # @param privacy_policy_url [String] The URL of the privacy policy for the brand in question. This may be a shared pr
      #
      # @param use_cases [Array<Symbol, SurgeAPI::Models::CampaignCreateParams::UseCase>] A list containing 1-5 types of messages that will be sent with this campaign.
      #
      # @param volume [Symbol, SurgeAPI::Models::CampaignCreateParams::Volume] This will be one of the following:
      #
      # @param includes [Array<Symbol, SurgeAPI::Models::CampaignCreateParams::Include>] A list of properties that this campaign should include. These properties can be
      #
      # @param link_sample [String] A sample link that might be sent by this campaign. If links from other domains a
      #
      # @param terms_and_conditions_url [String] The URL of the terms and conditions presented to end users when they opt in to m
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
          body: parsed,
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
