# frozen_string_literal: true

module SurgeAPI
  module Resources
    class Webhooks
      # @param payload [String] The raw webhook payload as a string
      #
      # @return [SurgeAPI::Models::CallEndedWebhookEvent, SurgeAPI::Models::CampaignApprovedWebhookEvent, SurgeAPI::Models::ContactOptedInWebhookEvent, SurgeAPI::Models::ContactOptedOutWebhookEvent, SurgeAPI::Models::ConversationCreatedWebhookEvent, SurgeAPI::Models::LinkFollowedWebhookEvent, SurgeAPI::Models::MessageDeliveredWebhookEvent, SurgeAPI::Models::MessageFailedWebhookEvent, SurgeAPI::Models::MessageReceivedWebhookEvent, SurgeAPI::Models::MessageSentWebhookEvent, SurgeAPI::Models::VoicemailReceivedWebhookEvent]
      def unwrap(payload)
        parsed = JSON.parse(payload, symbolize_names: true)
        SurgeAPI::Internal::Type::Converter.coerce(SurgeAPI::Models::UnwrapWebhookEvent, parsed)
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
