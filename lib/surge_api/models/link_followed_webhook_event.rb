# frozen_string_literal: true

module SurgeAPI
  module Models
    class LinkFollowedWebhookEvent < SurgeAPI::Internal::Type::BaseModel
      # @!attribute account_id
      #   The ID of the account in which this event occurred
      #
      #   @return [String]
      required :account_id, String

      # @!attribute data
      #   The data associated with the event
      #
      #   @return [SurgeAPI::Models::LinkFollowedWebhookEvent::Data]
      required :data, -> { SurgeAPI::LinkFollowedWebhookEvent::Data }

      # @!attribute timestamp
      #   The timestamp when this event occurred, in ISO8601 format
      #
      #   @return [Time]
      required :timestamp, Time

      # @!attribute type
      #   The type of the event. Always `link.followed` for this event.
      #
      #   @return [Symbol, :"link.followed"]
      required :type, const: :"link.followed"

      # @!method initialize(account_id:, data:, timestamp:, type: :"link.followed")
      #   @param account_id [String] The ID of the account in which this event occurred
      #
      #   @param data [SurgeAPI::Models::LinkFollowedWebhookEvent::Data] The data associated with the event
      #
      #   @param timestamp [Time] The timestamp when this event occurred, in ISO8601 format
      #
      #   @param type [Symbol, :"link.followed"] The type of the event. Always `link.followed` for this event.

      # @see SurgeAPI::Models::LinkFollowedWebhookEvent#data
      class Data < SurgeAPI::Internal::Type::BaseModel
        # @!attribute id
        #   The unique identifier for the link
        #
        #   @return [String]
        required :id, String

        # @!attribute message_id
        #   The unique identifier for the message that contained the link
        #
        #   @return [String]
        required :message_id, String

        # @!attribute url
        #   The original URL that was shortened
        #
        #   @return [String]
        required :url, String

        # @!method initialize(id:, message_id:, url:)
        #   The data associated with the event
        #
        #   @param id [String] The unique identifier for the link
        #
        #   @param message_id [String] The unique identifier for the message that contained the link
        #
        #   @param url [String] The original URL that was shortened
      end
    end
  end
end
