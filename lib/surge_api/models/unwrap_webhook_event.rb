# frozen_string_literal: true

module SurgeAPI
  module Models
    module UnwrapWebhookEvent
      extend SurgeAPI::Internal::Type::Union

      discriminator :type

      variant :"call.ended", -> { SurgeAPI::CallEndedWebhookEvent }

      variant :"campaign.approved", -> { SurgeAPI::CampaignApprovedWebhookEvent }

      variant :"contact.opted_in", -> { SurgeAPI::ContactOptedInWebhookEvent }

      variant :"contact.opted_out", -> { SurgeAPI::ContactOptedOutWebhookEvent }

      variant :"conversation.created", -> { SurgeAPI::ConversationCreatedWebhookEvent }

      variant :"link.followed", -> { SurgeAPI::LinkFollowedWebhookEvent }

      variant :"message.delivered", -> { SurgeAPI::MessageDeliveredWebhookEvent }

      variant :"message.failed", -> { SurgeAPI::MessageFailedWebhookEvent }

      variant :"message.received", -> { SurgeAPI::MessageReceivedWebhookEvent }

      variant :"message.sent", -> { SurgeAPI::MessageSentWebhookEvent }

      # @!method self.variants
      #   @return [Array(SurgeAPI::Models::CallEndedWebhookEvent, SurgeAPI::Models::CampaignApprovedWebhookEvent, SurgeAPI::Models::ContactOptedInWebhookEvent, SurgeAPI::Models::ContactOptedOutWebhookEvent, SurgeAPI::Models::ConversationCreatedWebhookEvent, SurgeAPI::Models::LinkFollowedWebhookEvent, SurgeAPI::Models::MessageDeliveredWebhookEvent, SurgeAPI::Models::MessageFailedWebhookEvent, SurgeAPI::Models::MessageReceivedWebhookEvent, SurgeAPI::Models::MessageSentWebhookEvent)]
    end
  end
end
