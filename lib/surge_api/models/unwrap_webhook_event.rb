# frozen_string_literal: true

module SurgeAPI
  module Models
    # The `call.ended` event is delivered whenever a call is completed between a Surge
    # number you own and another phone number.
    module UnwrapWebhookEvent
      extend SurgeAPI::Internal::Type::Union

      # The `call.ended` event is delivered whenever a call is completed between a Surge number you own and another phone number.
      variant -> { SurgeAPI::CallEndedWebhookEvent }

      # The `campaign.approved` event is delivered whenever a campaign is approved by all of the US carriers and able to start sending text messages.
      variant -> { SurgeAPI::CampaignApprovedWebhookEvent }

      # The `conversation.created` event is delivered whenever a new conversation is started with a contact. This could be when either the contact sends a message to your Surge number or when you create a conversation, whether by sending an initial message to the contact or by manually creating the conversation using the API.
      variant -> { SurgeAPI::ConversationCreatedWebhookEvent }

      # The `message.delivered` event is delivered whenever a message sent from a Surge number is successfully delivered to the recipient. When the message is sent from a short code or toll-free number, this means that the message arrived on the recipient's device. When sent from a local number, this means that the message was successfully handed off to the recipient's mobile carrier, but does not guarantee that it arrived on the recipient's device.
      variant -> { SurgeAPI::MessageDeliveredWebhookEvent }

      # The `message.failed` event is delivered whenever a message sent from your Surge number fails to be delivered.
      variant -> { SurgeAPI::MessageFailedWebhookEvent }

      # The `message.received` event is delivered whenever a message is received at a Surge number from a contact.
      variant -> { SurgeAPI::MessageReceivedWebhookEvent }

      # The `message.sent` event is delivered whenever a message is sent from a Surge number to a contact.
      variant -> { SurgeAPI::MessageSentWebhookEvent }

      # @!method self.variants
      #   @return [Array(SurgeAPI::Models::CallEndedWebhookEvent, SurgeAPI::Models::CampaignApprovedWebhookEvent, SurgeAPI::Models::ConversationCreatedWebhookEvent, SurgeAPI::Models::MessageDeliveredWebhookEvent, SurgeAPI::Models::MessageFailedWebhookEvent, SurgeAPI::Models::MessageReceivedWebhookEvent, SurgeAPI::Models::MessageSentWebhookEvent)]
    end
  end
end
