# frozen_string_literal: true

module Surge
  module Resources
    class Webhooks
      # @param payload [String] The raw webhook payload as a string
      #
      # @return [Surge::Models::CallEndedWebhookEvent, Surge::Models::CampaignApprovedWebhookEvent, Surge::Models::ConversationCreatedWebhookEvent, Surge::Models::MessageDeliveredWebhookEvent, Surge::Models::MessageFailedWebhookEvent, Surge::Models::MessageReceivedWebhookEvent, Surge::Models::MessageSentWebhookEvent]
      def unwrap(payload)
        parsed = JSON.parse(payload, symbolize_names: true)
        Surge::Internal::Type::Converter.coerce(Surge::Models::UnwrapWebhookEvent, parsed)
      end

      # @api private
      #
      # @param client [Surge::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
