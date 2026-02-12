# typed: strong

module SurgeAPI
  module Resources
    class Webhooks
      sig do
        params(payload: String).returns(
          T.any(
            SurgeAPI::CallEndedWebhookEvent,
            SurgeAPI::CampaignApprovedWebhookEvent,
            SurgeAPI::ContactOptedInWebhookEvent,
            SurgeAPI::ContactOptedOutWebhookEvent,
            SurgeAPI::ConversationCreatedWebhookEvent,
            SurgeAPI::LinkFollowedWebhookEvent,
            SurgeAPI::MessageDeliveredWebhookEvent,
            SurgeAPI::MessageFailedWebhookEvent,
            SurgeAPI::MessageReceivedWebhookEvent,
            SurgeAPI::MessageSentWebhookEvent,
            SurgeAPI::VoicemailReceivedWebhookEvent
          )
        )
      end
      def unwrap(
        # The raw webhook payload as a string
        payload
      )
      end

      # @api private
      sig { params(client: SurgeAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
