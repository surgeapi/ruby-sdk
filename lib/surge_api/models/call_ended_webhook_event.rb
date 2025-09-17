# frozen_string_literal: true

module SurgeAPI
  module Models
    class CallEndedWebhookEvent < SurgeAPI::Internal::Type::BaseModel
      # @!attribute account_id
      #   The ID of the account in which this event occurred
      #
      #   @return [String]
      required :account_id, String

      # @!attribute data
      #   The data associated with the event
      #
      #   @return [SurgeAPI::Models::CallEndedWebhookEvent::Data]
      required :data, -> { SurgeAPI::CallEndedWebhookEvent::Data }

      # @!attribute timestamp
      #   The timestamp when this event occurred, in ISO8601 format
      #
      #   @return [Time]
      required :timestamp, Time

      # @!attribute type
      #   The type of the event. Always `call.ended` for this event.
      #
      #   @return [Symbol, :"call.ended"]
      required :type, const: :"call.ended"

      # @!method initialize(account_id:, data:, timestamp:, type: :"call.ended")
      #   @param account_id [String] The ID of the account in which this event occurred
      #
      #   @param data [SurgeAPI::Models::CallEndedWebhookEvent::Data] The data associated with the event
      #
      #   @param timestamp [Time] The timestamp when this event occurred, in ISO8601 format
      #
      #   @param type [Symbol, :"call.ended"] The type of the event. Always `call.ended` for this event.

      # @see SurgeAPI::Models::CallEndedWebhookEvent#data
      class Data < SurgeAPI::Internal::Type::BaseModel
        # @!attribute id
        #   The unique identifier for the call
        #
        #   @return [String]
        required :id, String

        # @!attribute contact
        #   A contact who has consented to receive messages
        #
        #   @return [SurgeAPI::Models::Contact]
        required :contact, -> { SurgeAPI::Contact }

        # @!attribute duration
        #   The duration of the call in seconds
        #
        #   @return [Integer]
        required :duration, Integer

        # @!attribute initiated_at
        #   When the call was initiated
        #
        #   @return [Time]
        required :initiated_at, Time

        # @!attribute status
        #   The status of the call
        #
        #   @return [Symbol, SurgeAPI::Models::CallEndedWebhookEvent::Data::Status]
        required :status, enum: -> { SurgeAPI::CallEndedWebhookEvent::Data::Status }

        # @!method initialize(id:, contact:, duration:, initiated_at:, status:)
        #   The data associated with the event
        #
        #   @param id [String] The unique identifier for the call
        #
        #   @param contact [SurgeAPI::Models::Contact] A contact who has consented to receive messages
        #
        #   @param duration [Integer] The duration of the call in seconds
        #
        #   @param initiated_at [Time] When the call was initiated
        #
        #   @param status [Symbol, SurgeAPI::Models::CallEndedWebhookEvent::Data::Status] The status of the call

        # The status of the call
        #
        # @see SurgeAPI::Models::CallEndedWebhookEvent::Data#status
        module Status
          extend SurgeAPI::Internal::Type::Enum

          BUSY = :busy
          CANCELED = :canceled
          COMPLETED = :completed
          FAILED = :failed
          IN_PROGRESS = :in_progress
          MISSED = :missed
          NO_ANSWER = :no_answer
          QUEUED = :queued
          RINGING = :ringing

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
