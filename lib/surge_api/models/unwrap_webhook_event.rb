# frozen_string_literal: true

module SurgeAPI
  module Models
    module UnwrapWebhookEvent
      extend SurgeAPI::Internal::Type::Union

      variant -> { SurgeAPI::CallEndedWebhookEvent }

      variant -> { SurgeAPI::CampaignApprovedWebhookEvent }

      variant -> { SurgeAPI::ContactOptedInWebhookEvent }

      variant -> { SurgeAPI::ContactOptedOutWebhookEvent }

      variant -> { SurgeAPI::ConversationCreatedWebhookEvent }

      variant -> { SurgeAPI::MessageDeliveredWebhookEvent }

      variant -> { SurgeAPI::MessageFailedWebhookEvent }

      variant -> { SurgeAPI::MessageReceivedWebhookEvent }

      variant -> { SurgeAPI::MessageSentWebhookEvent }

      # @!method self.variants
      #   @return [Array(SurgeAPI::Models::CallEndedWebhookEvent, SurgeAPI::Models::CampaignApprovedWebhookEvent, SurgeAPI::Models::ContactOptedInWebhookEvent, SurgeAPI::Models::ContactOptedOutWebhookEvent, SurgeAPI::Models::ConversationCreatedWebhookEvent, SurgeAPI::Models::MessageDeliveredWebhookEvent, SurgeAPI::Models::MessageFailedWebhookEvent, SurgeAPI::Models::MessageReceivedWebhookEvent, SurgeAPI::Models::MessageSentWebhookEvent)]
    end
  end
end
