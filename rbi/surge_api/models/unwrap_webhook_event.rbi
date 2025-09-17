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
            SurgeAPI::ConversationCreatedWebhookEvent,
            SurgeAPI::MessageDeliveredWebhookEvent,
            SurgeAPI::MessageFailedWebhookEvent,
            SurgeAPI::MessageReceivedWebhookEvent,
            SurgeAPI::MessageSentWebhookEvent
          )
        end

      sig { override.returns(T::Array[SurgeAPI::UnwrapWebhookEvent::Variants]) }
      def self.variants
      end
    end
  end
end
