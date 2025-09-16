# frozen_string_literal: true

module SurgeAPI
  module Models
    class CampaignApprovedWebhookEvent < SurgeAPI::Internal::Type::BaseModel
      # @!attribute account_id
      #   The ID of the account in which this event occurred
      #
      #   @return [String]
      required :account_id, String

      # @!attribute data
      #   The data associated with the event
      #
      #   @return [SurgeAPI::Models::CampaignApprovedWebhookEvent::Data]
      required :data, -> { SurgeAPI::CampaignApprovedWebhookEvent::Data }

      # @!attribute timestamp
      #   The timestamp when this event occurred, in ISO8601 format
      #
      #   @return [Time]
      required :timestamp, Time

      # @!attribute type
      #   The type of the event. Always `campaign.approved` for this event.
      #
      #   @return [Symbol, SurgeAPI::Models::CampaignApprovedWebhookEvent::Type]
      required :type, enum: -> { SurgeAPI::CampaignApprovedWebhookEvent::Type }

      # @!method initialize(account_id:, data:, timestamp:, type:)
      #   The `campaign.approved` event is delivered whenever a campaign is approved by
      #   all of the US carriers and able to start sending text messages.
      #
      #   @param account_id [String] The ID of the account in which this event occurred
      #
      #   @param data [SurgeAPI::Models::CampaignApprovedWebhookEvent::Data] The data associated with the event
      #
      #   @param timestamp [Time] The timestamp when this event occurred, in ISO8601 format
      #
      #   @param type [Symbol, SurgeAPI::Models::CampaignApprovedWebhookEvent::Type] The type of the event. Always `campaign.approved` for this event.

      # @see SurgeAPI::Models::CampaignApprovedWebhookEvent#data
      class Data < SurgeAPI::Internal::Type::BaseModel
        # @!attribute id
        #   The unique identifier for the campaign
        #
        #   @return [String]
        required :id, String

        # @!attribute status
        #   The status of the campaign. Will always be `active` for this event.
        #
        #   @return [Symbol, SurgeAPI::Models::CampaignApprovedWebhookEvent::Data::Status]
        required :status, enum: -> { SurgeAPI::CampaignApprovedWebhookEvent::Data::Status }

        # @!method initialize(id:, status:)
        #   The data associated with the event
        #
        #   @param id [String] The unique identifier for the campaign
        #
        #   @param status [Symbol, SurgeAPI::Models::CampaignApprovedWebhookEvent::Data::Status] The status of the campaign. Will always be `active` for this event.

        # The status of the campaign. Will always be `active` for this event.
        #
        # @see SurgeAPI::Models::CampaignApprovedWebhookEvent::Data#status
        module Status
          extend SurgeAPI::Internal::Type::Enum

          ACTIVE = :active

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # The type of the event. Always `campaign.approved` for this event.
      #
      # @see SurgeAPI::Models::CampaignApprovedWebhookEvent#type
      module Type
        extend SurgeAPI::Internal::Type::Enum

        CAMPAIGN_APPROVED = :"campaign.approved"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
