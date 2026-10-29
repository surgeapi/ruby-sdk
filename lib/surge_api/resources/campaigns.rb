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
      # @param campaign_params [SurgeAPI::Models::CampaignParams::StandardCampaignParams, SurgeAPI::Models::CampaignParams::ExternalCampaignParams] Parameters for creating a new campaign. Either provide full campaign details or
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
          body: parsed[:campaign_params],
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

      # Some parameter documentations has been truncated, see
      # {SurgeAPI::Models::CampaignUpdateParams} for more details.
      #
      # Updates supplied fields on a campaign and submits it for review. Omitted fields
      # retain their stored values. An empty object or empty request body resubmits the
      # existing campaign without changing its registration details. Supplied arrays
      # replace their stored values; an empty includes array clears all inclusion flags.
      # Returns an error if the resulting campaign is incomplete or invalid, or the
      # campaign is not editable.
      #
      # @overload update(id, consent_flow: nil, description: nil, includes: nil, link_sample: nil, message_samples: nil, privacy_policy_url: nil, terms_and_conditions_url: nil, use_cases: nil, volume: nil, request_options: {})
      #
      # @param id [String] The ID of the campaign to update.
      #
      # @param consent_flow [String] A string explaining the method through which end users will opt in to receive me
      #
      # @param description [String] An explanation of the organization's purpose and how it will be using text messa
      #
      # @param includes [Array<Symbol, SurgeAPI::Models::CampaignUpdateParams::Include>] A list of properties that this campaign should include. These properties can be
      #
      # @param link_sample [String, nil] A sample link that might be sent by this campaign. This is required when `includ
      #
      # @param message_samples [Array<String>] An array of 2-5 strings with examples of the messages that will be sent from thi
      #
      # @param privacy_policy_url [String] The URL of the privacy policy for the brand in question. This may be a shared pr
      #
      # @param terms_and_conditions_url [String] The URL of the terms and conditions presented to end users when they opt in to m
      #
      # @param use_cases [Array<Symbol, SurgeAPI::Models::CampaignUpdateParams::UseCase>] A list containing 1-5 types of messages that will be sent with this campaign.
      #
      # @param volume [Symbol, SurgeAPI::Models::CampaignUpdateParams::Volume] This will be one of the following:
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::Campaign]
      #
      # @see SurgeAPI::Models::CampaignUpdateParams
      def update(id, params = {})
        parsed, options = SurgeAPI::CampaignUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["campaigns/%1$s", id],
          body: parsed,
          model: SurgeAPI::Campaign,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {SurgeAPI::Models::CampaignListParams} for more details.
      #
      # List all campaigns for an account with cursor-based pagination.
      #
      # @overload list(account_id, after: nil, before: nil, request_options: {})
      #
      # @param account_id [String] The account ID to list campaigns for.
      #
      # @param after [String] Cursor for forward pagination. Use the next_cursor from a previous response.
      #
      # @param before [String] Cursor for backward pagination. Use the previous_cursor from a previous response
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Internal::Cursor<SurgeAPI::Models::Campaign>]
      #
      # @see SurgeAPI::Models::CampaignListParams
      def list(account_id, params = {})
        parsed, options = SurgeAPI::CampaignListParams.dump_request(params)
        query = SurgeAPI::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["accounts/%1$s/campaigns", account_id],
          query: query,
          page: SurgeAPI::Internal::Cursor,
          model: SurgeAPI::Campaign,
          options: options
        )
      end

      # Enqueues an SMS OTP for a sole proprietor brand awaiting identity verification.
      #
      # @overload resend_brand_verification_message(account_id, request_options: {})
      #
      # @param account_id [String] The account whose brand verification OTP should be sent.
      #
      # @param request_options [SurgeAPI::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SurgeAPI::Models::CampaignResendBrandVerificationMessageResponse]
      #
      # @see SurgeAPI::Models::CampaignResendBrandVerificationMessageParams
      def resend_brand_verification_message(account_id, params = {})
        @client.request(
          method: :post,
          path: ["accounts/%1$s/brand_verification_messages", account_id],
          model: SurgeAPI::Models::CampaignResendBrandVerificationMessageResponse,
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
