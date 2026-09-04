# frozen_string_literal: true

module SurgeAPI
  module Resources
    class Webhooks
      # @param payload [String] The raw webhook payload as a string
      #
      # @param headers [Hash{String=>String}] The raw HTTP headers that came with the payload
      #
      # @param key [String, nil] The webhook signing key
      #
      # @return [SurgeAPI::Models::CallEndedWebhookEvent, SurgeAPI::Models::CampaignApprovedWebhookEvent, SurgeAPI::Models::ContactOptedInWebhookEvent, SurgeAPI::Models::ContactOptedOutWebhookEvent, SurgeAPI::Models::ConversationCreatedWebhookEvent, SurgeAPI::Models::LinkFollowedWebhookEvent, SurgeAPI::Models::MessageDeliveredWebhookEvent, SurgeAPI::Models::MessageFailedWebhookEvent, SurgeAPI::Models::MessageReceivedWebhookEvent, SurgeAPI::Models::MessageSentWebhookEvent, SurgeAPI::Models::PhoneNumberAttachedToCampaignWebhookEvent, SurgeAPI::Models::PhoneNumberImportedWebhookEvent, SurgeAPI::Models::RecordingCompletedWebhookEvent, SurgeAPI::Models::VoicemailReceivedWebhookEvent]
      def unwrap(payload, headers:, key: @client.webhook_signing_secret)
        if key.nil?
          raise ArgumentError.new("Cannot verify a webhook without a key on either the client's webhook_signing_secret or passed in as an argument")
        end

        ::StandardWebhooks::Webhook.new(key).verify(payload, headers)

        parsed = JSON.parse(payload, symbolize_names: true)
        SurgeAPI::Internal::Type::Converter.coerce(SurgeAPI::Models::UnwrapWebhookEvent, parsed)
      end

      # @api private
      #
      # @param client [SurgeAPI::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
