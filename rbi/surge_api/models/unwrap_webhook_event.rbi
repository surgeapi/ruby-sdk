# typed: strong

module SurgeAPI
  module Models
    module UnwrapWebhookEvent
      extend SurgeAPI::Internal::Type::Union

      Variants =
        T.type_alias do
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
        end

      sig { override.returns(T::Array[SurgeAPI::UnwrapWebhookEvent::Variants]) }
      def self.variants
      end
    end
  end
end
