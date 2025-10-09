# frozen_string_literal: true

module SurgeAPI
  module Models
    class ContactOptedInWebhookEvent < SurgeAPI::Internal::Type::BaseModel
      # @!attribute account_id
      #   The ID of the account in which this event occurred
      #
      #   @return [String]
      required :account_id, String

      # @!attribute data
      #   The data associated with the event
      #
      #   @return [SurgeAPI::Models::ContactOptedInWebhookEvent::Data]
      required :data, -> { SurgeAPI::ContactOptedInWebhookEvent::Data }

      # @!attribute timestamp
      #   The timestamp when this event occurred, in ISO8601 format
      #
      #   @return [Time]
      required :timestamp, Time

      # @!attribute type
      #   The type of the event. Always `contact.opted_in` for this event.
      #
      #   @return [Symbol, :"contact.opted_in"]
      required :type, const: :"contact.opted_in"

      # @!method initialize(account_id:, data:, timestamp:, type: :"contact.opted_in")
      #   @param account_id [String] The ID of the account in which this event occurred
      #
      #   @param data [SurgeAPI::Models::ContactOptedInWebhookEvent::Data] The data associated with the event
      #
      #   @param timestamp [Time] The timestamp when this event occurred, in ISO8601 format
      #
      #   @param type [Symbol, :"contact.opted_in"] The type of the event. Always `contact.opted_in` for this event.

      # @see SurgeAPI::Models::ContactOptedInWebhookEvent#data
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
