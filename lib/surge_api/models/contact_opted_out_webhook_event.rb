# frozen_string_literal: true

module SurgeAPI
  module Models
    class ContactOptedOutWebhookEvent < SurgeAPI::Internal::Type::BaseModel
      # @!attribute account_id
      #   The ID of the account in which this event occurred
      #
      #   @return [String]
      required :account_id, String

      # @!attribute data
      #   The data associated with the event
      #
      #   @return [SurgeAPI::Models::ContactOptedOutWebhookEvent::Data]
      required :data, -> { SurgeAPI::ContactOptedOutWebhookEvent::Data }

      # @!attribute timestamp
      #   The timestamp when this event occurred, in ISO8601 format
      #
      #   @return [Time]
      required :timestamp, Time

      # @!attribute type
      #   The type of the event. Always `contact.opted_out` for this event.
      #
      #   @return [Symbol, :"contact.opted_out"]
      required :type, const: :"contact.opted_out"

      # @!method initialize(account_id:, data:, timestamp:, type: :"contact.opted_out")
      #   @param account_id [String] The ID of the account in which this event occurred
      #
      #   @param data [SurgeAPI::Models::ContactOptedOutWebhookEvent::Data] The data associated with the event
      #
      #   @param timestamp [Time] The timestamp when this event occurred, in ISO8601 format
      #
      #   @param type [Symbol, :"contact.opted_out"] The type of the event. Always `contact.opted_out` for this event.

      # @see SurgeAPI::Models::ContactOptedOutWebhookEvent#data
      class Data < SurgeAPI::Internal::Type::BaseModel
        # @!attribute id
        #   The unique identifier for the contact
        #
        #   @return [String]
        required :id, String

        # @!method initialize(id:)
        #   The data associated with the event
        #
        #   @param id [String] The unique identifier for the contact
      end
    end
  end
end
