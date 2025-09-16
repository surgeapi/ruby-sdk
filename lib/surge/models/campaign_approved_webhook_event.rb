# frozen_string_literal: true

module Surge
  module Models
    class CampaignApprovedWebhookEvent < Surge::Internal::Type::BaseModel
      # @!attribute account_id
      #   The ID of the account in which this event occurred
      #
      #   @return [String]
      required :account_id, String

      # @!attribute data
      #   The data associated with the event
      #
      #   @return [Surge::Models::CampaignApprovedWebhookEvent::Data]
      required :data, -> { Surge::CampaignApprovedWebhookEvent::Data }

      # @!attribute timestamp
      #   The timestamp when this event occurred, in ISO8601 format
      #
      #   @return [Time]
      required :timestamp, Time

      # @!attribute type
      #   The type of the event. Always `campaign.approved` for this event.
      #
      #   @return [Symbol, Surge::Models::CampaignApprovedWebhookEvent::Type]
      required :type, enum: -> { Surge::CampaignApprovedWebhookEvent::Type }

      # @!method initialize(account_id:, data:, timestamp:, type:)
      #   The `campaign.approved` event is delivered whenever a campaign is approved by
      #   all of the US carriers and able to start sending text messages.
      #
      #   @param account_id [String] The ID of the account in which this event occurred
      #
      #   @param data [Surge::Models::CampaignApprovedWebhookEvent::Data] The data associated with the event
      #
      #   @param timestamp [Time] The timestamp when this event occurred, in ISO8601 format
      #
      #   @param type [Symbol, Surge::Models::CampaignApprovedWebhookEvent::Type] The type of the event. Always `campaign.approved` for this event.

      # @see Surge::Models::CampaignApprovedWebhookEvent#data
      class Data < Surge::Internal::Type::BaseModel
        # @!attribute id
        #   The unique identifier for the campaign
        #
        #   @return [String]
        required :id, String

        # @!attribute status
        #   The status of the campaign. Will always be `active` for this event.
        #
        #   @return [Symbol, Surge::Models::CampaignApprovedWebhookEvent::Data::Status]
        required :status, enum: -> { Surge::CampaignApprovedWebhookEvent::Data::Status }

        # @!method initialize(id:, status:)
        #   The data associated with the event
        #
        #   @param id [String] The unique identifier for the campaign
        #
        #   @param status [Symbol, Surge::Models::CampaignApprovedWebhookEvent::Data::Status] The status of the campaign. Will always be `active` for this event.

        # The status of the campaign. Will always be `active` for this event.
        #
        # @see Surge::Models::CampaignApprovedWebhookEvent::Data#status
        module Status
          extend Surge::Internal::Type::Enum

          ACTIVE = :active

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # The type of the event. Always `campaign.approved` for this event.
      #
      # @see Surge::Models::CampaignApprovedWebhookEvent#type
      module Type
        extend Surge::Internal::Type::Enum

        CAMPAIGN_APPROVED = :"campaign.approved"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
