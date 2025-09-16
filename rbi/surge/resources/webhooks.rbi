# typed: strong

module Surge
  module Resources
    class Webhooks
      sig do
        params(payload: String).returns(
          T.any(
            Surge::CallEndedWebhookEvent,
            Surge::CampaignApprovedWebhookEvent,
            Surge::ConversationCreatedWebhookEvent,
            Surge::MessageDeliveredWebhookEvent,
            Surge::MessageFailedWebhookEvent,
            Surge::MessageReceivedWebhookEvent,
            Surge::MessageSentWebhookEvent
          )
        )
      end
      def unwrap(
        # The raw webhook payload as a string
        payload
      )
      end

      # @api private
      sig { params(client: Surge::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
