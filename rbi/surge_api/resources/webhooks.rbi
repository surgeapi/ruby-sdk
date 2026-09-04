# typed: strong

module SurgeAPI
  module Resources
    class Webhooks
      sig do
        params(
          payload: String,
          headers: T::Hash[String, String],
          key: T.nilable(String)
        ).returns(
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
            SurgeAPI::PhoneNumberAttachedToCampaignWebhookEvent,
            SurgeAPI::PhoneNumberImportedWebhookEvent,
            SurgeAPI::RecordingCompletedWebhookEvent,
            SurgeAPI::VoicemailReceivedWebhookEvent
          )
        )
      end
      def unwrap(
        # The raw webhook payload as a string
        payload,
        # The raw HTTP headers that came with the payload
        headers:,
        # The webhook signing key
        key: @client.webhook_signing_secret
      )
      end

      # @api private
      sig { params(client: SurgeAPI::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
