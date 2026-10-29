# frozen_string_literal: true

module SurgeAPI
  module Resources
    class TollFreeCampaigns
      # Creates a toll-free campaign and submits it for Surge review.
      #
      # @overload create(account_id, consent_flows:, description:, message_samples:, phone_number_id:, privacy_policy_url:, terms_and_conditions_url:, use_cases:, includes: nil, request_options: {})
      #
      # @param account_id [String] The account for which the toll-free campaign should be created.
      #
      # @param consent_flows [Array<SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember0, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember1, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember2, SurgeAPI::Models::TollFreeCampaignParams::ConsentFlow::UnionMember3>]
      #
      # @param description [String] An explanation of how the toll-free number will be used.
      #
      # @param message_samples [Array<String>]
      #
      # @param phone_number_id [String] The toll-free phone number to register.
      #
      # @param privacy_policy_url [String]
      #
      # @param terms_and_conditions_url [String]
      #
      # @param use_cases [Array<Symbol, SurgeAPI::Models::TollFreeCampaignParams::UseCase>]
      #
      # @param includes [Array<Symbol, SurgeAPI::Models::TollFreeCampaignParams::Include>]
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::TollFreeCampaign]
      #
      # @see SurgeAPI::Models::TollFreeCampaignCreateParams
      def create(account_id, params)
        parsed, options = SurgeAPI::TollFreeCampaignCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["accounts/%1$s/toll_free_campaigns", account_id],
          body: parsed,
          model: SurgeAPI::TollFreeCampaign,
          options: options
        )
      end

      # Retrieves a toll-free campaign object.
      #
      # @overload retrieve(campaign_id, request_options: {})
      #
      # @param campaign_id [String] The ID of the toll-free campaign to retrieve.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::TollFreeCampaign]
      #
      # @see SurgeAPI::Models::TollFreeCampaignRetrieveParams
      def retrieve(campaign_id, params = {})
        @client.request(
          method: :get,
          path: ["toll_free_campaigns/%1$s", campaign_id],
          model: SurgeAPI::TollFreeCampaign,
          options: params[:request_options]
        )
      end

      # Updates a toll-free campaign awaiting customer fixes and re-submits it for Surge
      # review. Returns 409 if the campaign is not in an updatable status.
      #
      # @overload update(campaign_id, consent_flows: nil, description: nil, includes: nil, message_samples: nil, privacy_policy_url: nil, terms_and_conditions_url: nil, use_cases: nil, request_options: {})
      #
      # @param campaign_id [String] The toll-free campaign ID to update.
      #
      # @param consent_flows [Array<SurgeAPI::Models::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember0, SurgeAPI::Models::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember1, SurgeAPI::Models::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember2, SurgeAPI::Models::TollFreeCampaignUpdateParams::ConsentFlow::UnionMember3>]
      #
      # @param description [String] An explanation of how the toll-free number will be used.
      #
      # @param includes [Array<Symbol, SurgeAPI::Models::TollFreeCampaignUpdateParams::Include>]
      #
      # @param message_samples [Array<String>]
      #
      # @param privacy_policy_url [String]
      #
      # @param terms_and_conditions_url [String]
      #
      # @param use_cases [Array<Symbol, SurgeAPI::Models::TollFreeCampaignUpdateParams::UseCase>]
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::TollFreeCampaign]
      #
      # @see SurgeAPI::Models::TollFreeCampaignUpdateParams
      def update(campaign_id, params = {})
        parsed, options = SurgeAPI::TollFreeCampaignUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["toll_free_campaigns/%1$s", campaign_id],
          body: parsed,
          model: SurgeAPI::TollFreeCampaign,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {SurgeAPI::Models::TollFreeCampaignListParams} for more details.
      #
      # List all toll-free campaigns for an account with cursor-based pagination.
      #
      # @overload list(account_id, after: nil, before: nil, request_options: {})
      #
      # @param account_id [String] The account ID to list toll-free campaigns for.
      #
      # @param after [String] Cursor for forward pagination. Use the next_cursor from a previous response.
      #
      # @param before [String] Cursor for backward pagination. Use the previous_cursor from a previous response
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Internal::Cursor<SurgeAPI::Models::TollFreeCampaign>]
      #
      # @see SurgeAPI::Models::TollFreeCampaignListParams
      def list(account_id, params = {})
        parsed, options = SurgeAPI::TollFreeCampaignListParams.dump_request(params)
        query = SurgeAPI::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["accounts/%1$s/toll_free_campaigns", account_id],
          query: query,
          page: SurgeAPI::Internal::Cursor,
          model: SurgeAPI::TollFreeCampaign,
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
