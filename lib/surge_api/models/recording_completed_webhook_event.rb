# frozen_string_literal: true

module SurgeAPI
  module Models
    class RecordingCompletedWebhookEvent < SurgeAPI::Internal::Type::BaseModel
      # @!attribute account_id
      #   The ID of the account in which this event occurred
      #
      #   @return [String]
      required :account_id, String

      # @!attribute data
      #   The data associated with the event
      #
      #   @return [SurgeAPI::Models::RecordingCompletedWebhookEvent::Data]
      required :data, -> { SurgeAPI::RecordingCompletedWebhookEvent::Data }

      # @!attribute timestamp
      #   The timestamp when this event occurred, in ISO8601 format
      #
      #   @return [Time]
      required :timestamp, Time

      # @!attribute type
      #   The type of the event. Always `recording.completed` for this event.
      #
      #   @return [Symbol, :"recording.completed"]
      required :type, const: :"recording.completed"

      # @!method initialize(account_id:, data:, timestamp:, type: :"recording.completed")
      #   @param account_id [String] The ID of the account in which this event occurred
      #
      #   @param data [SurgeAPI::Models::RecordingCompletedWebhookEvent::Data] The data associated with the event
      #
      #   @param timestamp [Time] The timestamp when this event occurred, in ISO8601 format
      #
      #   @param type [Symbol, :"recording.completed"] The type of the event. Always `recording.completed` for this event.

      # @see SurgeAPI::Models::RecordingCompletedWebhookEvent#data
      class Data < SurgeAPI::Internal::Type::BaseModel
        # @!attribute id
        #   The unique identifier for the recording
        #
        #   @return [String]
        required :id, String

        # @!attribute call
        #   The call that produced this recording
        #
        #   @return [SurgeAPI::Models::RecordingCompletedWebhookEvent::Data::Call]
        required :call, -> { SurgeAPI::RecordingCompletedWebhookEvent::Data::Call }

        # @!attribute duration
        #   The duration of the recording in seconds
        #
        #   @return [Integer]
        required :duration, Integer

        # @!method initialize(id:, call:, duration:)
        #   The data associated with the event
        #
        #   @param id [String] The unique identifier for the recording
        #
        #   @param call [SurgeAPI::Models::RecordingCompletedWebhookEvent::Data::Call] The call that produced this recording
        #
        #   @param duration [Integer] The duration of the recording in seconds

        # @see SurgeAPI::Models::RecordingCompletedWebhookEvent::Data#call
        class Call < SurgeAPI::Internal::Type::BaseModel
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
          #   @return [Symbol, SurgeAPI::Models::RecordingCompletedWebhookEvent::Data::Call::Status]
          required :status, enum: -> { SurgeAPI::RecordingCompletedWebhookEvent::Data::Call::Status }

          # @!method initialize(id:, contact:, duration:, initiated_at:, status:)
          #   The call that produced this recording
          #
          #   @param id [String] The unique identifier for the call
          #
          #   @param contact [SurgeAPI::Models::Contact] A contact who has consented to receive messages
          #
          #   @param duration [Integer] The duration of the call in seconds
          #
          #   @param initiated_at [Time] When the call was initiated
          #
          #   @param status [Symbol, SurgeAPI::Models::RecordingCompletedWebhookEvent::Data::Call::Status] The status of the call

          # The status of the call
          #
          # @see SurgeAPI::Models::RecordingCompletedWebhookEvent::Data::Call#status
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
end
