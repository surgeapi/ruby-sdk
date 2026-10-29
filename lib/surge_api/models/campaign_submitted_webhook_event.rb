# frozen_string_literal: true

module SurgeAPI
  module Models
    class CampaignSubmittedWebhookEvent < SurgeAPI::Internal::Type::BaseModel
      # @!attribute account_id
      #   The ID of the account in which this event occurred
      #
      #   @return [String]
      required :account_id, String

      # @!attribute data
      #   The data associated with the event
      #
      #   @return [SurgeAPI::Models::CampaignSubmittedWebhookEvent::Data]
      required :data, -> { SurgeAPI::CampaignSubmittedWebhookEvent::Data }

      # @!attribute timestamp
      #   The timestamp when this event occurred, in ISO8601 format
      #
      #   @return [Time]
      required :timestamp, Time

      # @!attribute type
      #   The type of the event. Always `campaign.submitted` for this event.
      #
      #   @return [Symbol, :"campaign.submitted"]
      required :type, const: :"campaign.submitted"

      # @!method initialize(account_id:, data:, timestamp:, type: :"campaign.submitted")
      #   @param account_id [String] The ID of the account in which this event occurred
      #
      #   @param data [SurgeAPI::Models::CampaignSubmittedWebhookEvent::Data] The data associated with the event
      #
      #   @param timestamp [Time] The timestamp when this event occurred, in ISO8601 format
      #
      #   @param type [Symbol, :"campaign.submitted"] The type of the event. Always `campaign.submitted` for this event.

      # @see SurgeAPI::Models::CampaignSubmittedWebhookEvent#data
      class Data < SurgeAPI::Internal::Type::BaseModel
        # @!attribute id
        #   The unique identifier for the campaign
        #
        #   @return [String]
        required :id, String

        # @!attribute status
        #   The public campaign status. Always `in_review` for this event.
        #
        #   @return [Symbol, SurgeAPI::Models::CampaignSubmittedWebhookEvent::Data::Status]
        required :status, enum: -> { SurgeAPI::CampaignSubmittedWebhookEvent::Data::Status }

        # @!method initialize(id:, status:)
        #   The data associated with the event
        #
        #   @param id [String] The unique identifier for the campaign
        #
        #   @param status [Symbol, SurgeAPI::Models::CampaignSubmittedWebhookEvent::Data::Status] The public campaign status. Always `in_review` for this event.

        # The public campaign status. Always `in_review` for this event.
        #
        # @see SurgeAPI::Models::CampaignSubmittedWebhookEvent::Data#status
        module Status
          extend SurgeAPI::Internal::Type::Enum

          IN_REVIEW = :in_review

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
