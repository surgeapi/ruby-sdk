# typed: strong

module SurgeAPI
  module Models
    # The `call.ended` event is delivered whenever a call is completed between a Surge
    # number you own and another phone number.
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
