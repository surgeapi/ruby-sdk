# typed: strong

module Surge
  module Models
    # The `call.ended` event is delivered whenever a call is completed between a Surge
    # number you own and another phone number.
    module UnwrapWebhookEvent
      extend Surge::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Surge::CallEndedWebhookEvent,
            Surge::CampaignApprovedWebhookEvent,
            Surge::ConversationCreatedWebhookEvent,
            Surge::MessageDeliveredWebhookEvent,
            Surge::MessageFailedWebhookEvent,
            Surge::MessageReceivedWebhookEvent,
            Surge::MessageSentWebhookEvent
          )
        end

      sig { override.returns(T::Array[Surge::UnwrapWebhookEvent::Variants]) }
      def self.variants
      end
    end
  end
end
